# export-worksheets-week-to-pdf.ps1
# Converts all *.html in worksheets/{grade}-grade/{week}/ to PDFs via Microsoft Edge (headless).
#
# Usage:
#   .\export-worksheets-week-to-pdf.ps1 <grade> <week>     # e.g. 3 12  -> 3-grade\12
#   .\export-worksheets-week-to-pdf.ps1 <week>            # all grades that have that week folder
#   .\export-worksheets-week-to-pdf.ps1 -Week 5            # same (all grades)
#   .\export-worksheets-week-to-pdf.ps1 -Grade 3 -Week 12

param(
    [Parameter(ParameterSetName = 'ByGrade', Mandatory, Position = 0)]
    [string]$Grade,

    [Parameter(ParameterSetName = 'ByGrade', Mandatory, Position = 1)]
    [Parameter(ParameterSetName = 'AllGrades', Mandatory, Position = 0)]
    [ValidateRange(1, 40)]
    [int]$Week
)

$ErrorActionPreference = "Stop"

$root = (Resolve-Path (Join-Path $PSScriptRoot "..")).Path
$worksheetsPath = Join-Path $root "worksheets"

function Get-AllGradeFolderNames {
    $numeric = 1..12 | ForEach-Object { "$_-grade" }
    return [string[]]($numeric + @('DC3A-grade', 'DC3B-grade'))
}

function Resolve-GradeFolderName {
    param([string]$Raw)
    $g = $Raw.Trim()
    if ([string]::IsNullOrWhiteSpace($g)) {
        throw "Grade must not be empty."
    }
    $upper = $g.ToUpperInvariant()
    if ($upper -eq 'DC3A') { return 'DC3A-grade' }
    if ($upper -eq 'DC3B') { return 'DC3B-grade' }
    $n = 0
    if ([int]::TryParse($g, [ref]$n)) {
        if ($n -ge 1 -and $n -le 12) {
            return "$n-grade"
        }
    }
    throw "Invalid grade '$Raw'. Use 1-12, DC3A, or DC3B."
}

function Get-EdgeExecutable {
    $candidates = @(
        (Join-Path ${env:ProgramFiles(x86)} "Microsoft\Edge\Application\msedge.exe"),
        (Join-Path $env:ProgramFiles "Microsoft\Edge\Application\msedge.exe")
    )
    foreach ($p in $candidates) {
        if (Test-Path -LiteralPath $p) {
            return (Resolve-Path -LiteralPath $p).Path
        }
    }
    return $null
}

function Invoke-EdgePrintToPdf {
    param(
        [string]$EdgePath,
        [string]$FileUri,
        [string]$PdfPath,
        [bool]$UseNewHeadless
    )
    $headlessArg = if ($UseNewHeadless) { '--headless=new' } else { '--headless' }
    $argList = @(
        $headlessArg,
        '--disable-gpu',
        '--no-pdf-header-footer',
        "--print-to-pdf=$PdfPath",
        $FileUri
    )
    $p = Start-Process -FilePath $EdgePath -ArgumentList $argList -Wait -PassThru -NoNewWindow
    return $p.ExitCode
}

function Export-WorksheetsWeekFolderToPdf {
    param(
        [string]$WeekDir,
        [string]$EdgePath
    )
    $htmlFiles = @(Get-ChildItem -LiteralPath $weekDir -Filter "*.html" -File)
    if ($htmlFiles.Count -eq 0) {
        Write-Host "No HTML files in: $weekDir"
        return [string[]]@()
    }

    $failed = [System.Collections.Generic.List[string]]::new()
    foreach ($html in $htmlFiles) {
        $htmlFull = $html.FullName
        $pdfPath = Join-Path $html.DirectoryName ($html.BaseName + ".pdf")
        $fileUri = ([System.Uri]::new($htmlFull)).AbsoluteUri

        $exitCode = Invoke-EdgePrintToPdf -EdgePath $EdgePath -FileUri $fileUri -PdfPath $pdfPath -UseNewHeadless $true
        if ($exitCode -ne 0) {
            $exitCode = Invoke-EdgePrintToPdf -EdgePath $EdgePath -FileUri $fileUri -PdfPath $pdfPath -UseNewHeadless $false
        }
        if ($exitCode -ne 0) {
            $failed.Add($html.Name)
            Write-Warning "Edge exited with code $exitCode for: $htmlFull"
            continue
        }
        if (-not (Test-Path -LiteralPath $pdfPath)) {
            $failed.Add($html.Name)
            Write-Warning "PDF was not created: $pdfPath"
        }
        else {
            Write-Host "Wrote: $pdfPath"
        }
    }
    return [string[]]@($failed)
}

if ($PSBoundParameters.ContainsKey('Grade')) {
    try {
        $gradeFolder = Resolve-GradeFolderName $Grade
    }
    catch {
        Write-Host $_.Exception.Message
        exit 1
    }

    $weekDir = Join-Path $worksheetsPath (Join-Path $gradeFolder $Week.ToString())

    if (-not (Test-Path -LiteralPath $weekDir)) {
        Write-Error "Week folder not found: $weekDir"
        exit 1
    }

    $htmlProbe = @(Get-ChildItem -LiteralPath $weekDir -Filter "*.html" -File)
    if ($htmlProbe.Count -eq 0) {
        Write-Host "No HTML files in: $weekDir"
        exit 0
    }

    $edge = Get-EdgeExecutable
    if (-not $edge) {
        Write-Error "Microsoft Edge (msedge.exe) not found under Program Files. Install Edge or update Get-EdgeExecutable paths."
        exit 1
    }

    $failed = Export-WorksheetsWeekFolderToPdf -WeekDir $weekDir -EdgePath $edge
    if ($failed.Count -gt 0) {
        Write-Error ("Conversion failed for: " + ($failed -join ", "))
        exit 1
    }

    exit 0
}

# AllGrades
$allFailed = [System.Collections.Generic.List[string]]::new()
$edge = $null
foreach ($gradeFolder in (Get-AllGradeFolderNames)) {
    $weekDir = Join-Path $worksheetsPath (Join-Path $gradeFolder $Week.ToString())
    if (-not (Test-Path -LiteralPath $weekDir)) {
        Write-Host "Skipping $gradeFolder (no week folder for week $($Week))."
        continue
    }

    $htmlProbe = @(Get-ChildItem -LiteralPath $weekDir -Filter "*.html" -File)
    if ($htmlProbe.Count -eq 0) {
        Write-Host "No HTML files in: $weekDir"
        continue
    }

    if (-not $edge) {
        $edge = Get-EdgeExecutable
        if (-not $edge) {
            Write-Error "Microsoft Edge (msedge.exe) not found under Program Files. Install Edge or update Get-EdgeExecutable paths."
            exit 1
        }
    }

    $failed = Export-WorksheetsWeekFolderToPdf -WeekDir $weekDir -EdgePath $edge
    foreach ($name in $failed) {
        $allFailed.Add("${gradeFolder}: $name")
    }
}

if ($allFailed.Count -gt 0) {
    Write-Error ("Conversion failed for: " + ($allFailed -join "; "))
    exit 1
}

exit 0

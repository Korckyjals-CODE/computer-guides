# generate-worksheet-manifest.ps1
# Scans worksheets/ folder and Topic Matrix.csv to generate worksheets-manifest.json

$ErrorActionPreference = "Stop"
$root = (Resolve-Path (Join-Path $PSScriptRoot "..")).Path

$worksheetsPath = Join-Path $root "worksheets"
$matrixPath = Join-Path $root "Topic Matrix.csv"
$outputPath = Join-Path $root "worksheets-manifest.json"

if (-not (Test-Path $worksheetsPath)) {
    Write-Host "Worksheets path not found: $worksheetsPath"
    exit 1
}

function Get-SlugForMatrixColumn {
    param([string]$ColumnName)
    $ordinal = @{
        '1st' = '1'; '2nd' = '2'; '3rd' = '3'; '4th' = '4'; '5th' = '5'; '6th' = '6'
        '7th' = '7'; '8th' = '8'; '9th' = '9'; '10th' = '10'; '11th' = '11'; '12th' = '12'
    }
    if ($ordinal.ContainsKey($ColumnName)) {
        return $ordinal[$ColumnName]
    }
    return $ColumnName
}

# Build topic matrix: (slug-week) -> topic string; collect slug order from CSV
$topicMatrix = @{}
$slugOrder = @()
if (Test-Path $matrixPath) {
    $rows = Import-Csv $matrixPath
    if ($rows.Count -eq 0) {
        Write-Warning "Topic Matrix.csv has no data rows."
    }
    else {
        $gradeColumns = @($rows[0].PSObject.Properties.Name | Where-Object { $_ -ne 'Week' })
        foreach ($col in $gradeColumns) {
            $slug = Get-SlugForMatrixColumn $col
            $slugOrder += $slug
        }

        $weekNum = 1
        foreach ($row in $rows) {
            $i = 0
            foreach ($col in $gradeColumns) {
                $slug = $slugOrder[$i]
                $topic = $row.$col
                if ($topic) {
                    $topicMatrix["$slug-$weekNum"] = $topic.Trim()
                }
                $i++
            }
            $weekNum++
        }
    }
}

if ($slugOrder.Count -eq 0) {
    $slugOrder = @('1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12')
}

$validSlugs = @{}
foreach ($s in $slugOrder) {
    $validSlugs[$s] = $true
}

$slugRank = @{}
for ($r = 0; $r -lt $slugOrder.Count; $r++) {
    $slugRank[$slugOrder[$r]] = $r
}

# Infer worksheet type from filename
function Get-WorksheetType {
    param([string]$filename)
    if ($filename -match "-Technical-") { return "technical" }
    if ($filename -match "-Social-") { return "social" }
    return "worksheet"
}

# Scan worksheets folder
$items = @()
$gradeDirs = Get-ChildItem -Path $worksheetsPath -Directory -Filter "*-grade" -ErrorAction SilentlyContinue

foreach ($gradeDir in $gradeDirs) {
    if ($gradeDir.Name -match '^(.+)-grade$') {
        $slug = $Matches[1]
        if (-not $validSlugs.ContainsKey($slug)) {
            continue
        }

        $weekDirs = Get-ChildItem -Path $gradeDir.FullName -Directory -ErrorAction SilentlyContinue

        foreach ($weekDir in $weekDirs) {
            $week = 0
            if ([int]::TryParse($weekDir.Name, [ref]$week) -and $week -ge 1 -and $week -le 40) {
                $htmlFiles = Get-ChildItem -Path $weekDir.FullName -Filter "*-Worksheet.html" -File -ErrorAction SilentlyContinue

                if ($htmlFiles.Count -gt 0) {
                    $worksheets = @()
                    foreach ($f in $htmlFiles) {
                        $worksheets += @{
                            file = $f.Name
                            type = (Get-WorksheetType $f.Name)
                        }
                    }

                    $topic = "Week $week"
                    $key = "$slug-$week"
                    if ($topicMatrix.ContainsKey($key)) {
                        $topic = $topicMatrix[$key]
                    }

                    $items += @{
                        grade      = [string]$slug
                        week       = $week
                        topic      = $topic
                        worksheets = $worksheets
                    }
                }
            }
        }
    }
}

$items = $items | Sort-Object {
    if ($slugRank.ContainsKey($_.grade)) { $slugRank[$_.grade] } else { 999 }
}, { $_.week }

$manifest = @{
    lastUpdated = (Get-Date -Format "yyyy-MM-ddTHH:mm:ssZ")
    items       = $items
}

$manifest | ConvertTo-Json -Depth 4 | Set-Content -Path $outputPath -Encoding UTF8

Write-Host "Generated $outputPath with $($items.Count) worksheet groups"

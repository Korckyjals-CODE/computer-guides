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

# Build topic matrix: (grade, week) -> topic string
$topicMatrix = @{}
if (Test-Path $matrixPath) {
    $gradeCols = @("1st", "2nd", "3rd", "4th", "5th", "6th", "7th", "8th", "9th", "10th", "11th", "12th")
    $rows = Import-Csv $matrixPath
    $weekNum = 1
    foreach ($row in $rows) {
        for ($g = 1; $g -le 12; $g++) {
            $col = $gradeCols[$g - 1]
            $topic = $row.$col
            if ($topic) {
                $topicMatrix["$g-$weekNum"] = $topic.Trim()
            }
        }
        $weekNum++
    }
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
    if ($gradeDir.Name -match "^(\d+)-grade$") {
        $grade = [int]$Matches[1]
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
                    $key = "$grade-$week"
                    if ($topicMatrix.ContainsKey($key)) {
                        $topic = $topicMatrix[$key]
                    }

                    $items += @{
                        grade     = $grade
                        week      = $week
                        topic     = $topic
                        worksheets = $worksheets
                    }
                }
            }
        }
    }
}

# Sort by grade, then week
$items = $items | Sort-Object { $_.grade }, { $_.week }

$manifest = @{
    lastUpdated = (Get-Date -Format "yyyy-MM-ddTHH:mm:ssZ")
    items       = $items
}

$manifest | ConvertTo-Json -Depth 4 | Set-Content -Path $outputPath -Encoding UTF8

Write-Host "Generated $outputPath with $($items.Count) worksheet groups"

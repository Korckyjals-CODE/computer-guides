# create-worksheets-folder-structure.ps1
$root = $PSScriptRoot
$worksheetsPath = Join-Path $root "worksheets"

New-Item -ItemType Directory -Path $worksheetsPath -Force | Out-Null

for ($grade = 1; $grade -le 12; $grade++) {
    $gradePath = Join-Path $worksheetsPath "$grade-grade"
    New-Item -ItemType Directory -Path $gradePath -Force | Out-Null
    for ($n = 1; $n -le 40; $n++) {
        New-Item -ItemType Directory -Path (Join-Path $gradePath $n.ToString()) -Force | Out-Null
    }
}

Write-Host "Created worksheets structure: 12 grades x 40 subfolders"

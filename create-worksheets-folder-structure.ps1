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

$additionalGrades = @('DC3A', 'DC3B-SEC', 'DC3B')
foreach ($name in $additionalGrades) {
    $gradePath = Join-Path $worksheetsPath $name
    New-Item -ItemType Directory -Path $gradePath -Force | Out-Null
    for ($n = 1; $n -le 40; $n++) {
        New-Item -ItemType Directory -Path (Join-Path $gradePath $n.ToString()) -Force | Out-Null
    }
}

Write-Host "Created worksheets structure: 12 numeric grades + 3 named grades (DC3A, DC3B-SEC, DC3B), each with 40 subfolders"

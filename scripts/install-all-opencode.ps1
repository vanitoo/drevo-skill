param(
    [string]$ProjectPath = 'C:\project\genealogy',
    [switch]$Force
)
$ErrorActionPreference = 'Stop'
$repository = Split-Path -Parent $PSScriptRoot
$destination = Join-Path $ProjectPath '.opencode\skills'

if (-not (Test-Path -LiteralPath $ProjectPath -PathType Container)) {
    throw "Project folder not found: $ProjectPath. Create your family project first."
}
New-Item -ItemType Directory -Path $destination -Force | Out-Null

foreach ($skill in @('drevo', 'rod-search')) {
    $source = Join-Path $repository $skill
    $target = Join-Path $destination $skill
    if (-not (Test-Path -LiteralPath (Join-Path $source 'SKILL.md'))) {
        throw "Missing skill: $source\SKILL.md"
    }
    if (Test-Path -LiteralPath $target) {
        if (-not $Force) {
            throw "Skill already installed: $target. Review updates and use -Force to back up and replace."
        }
        $suffix = Get-Date -Format 'yyyyMMdd-HHmmss'
        $backupRoot = Join-Path $ProjectPath '.opencode\skill-backups'
        New-Item -ItemType Directory -Path $backupRoot -Force | Out-Null
        Move-Item -LiteralPath $target -Destination (Join-Path $backupRoot "$skill-$suffix")
    }
    Copy-Item -LiteralPath $source -Destination $target -Recurse
    Write-Host "Installed $skill -> $target"
}
Write-Host 'Run from family project: opencode debug skill'

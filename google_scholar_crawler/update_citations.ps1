# Fetches your Google Scholar stats on this computer and publishes them to the
# google-scholar-stats branch, which the citations badge and per-paper counts read.
# (Google Scholar blocks GitHub's servers, so this can't run as a GitHub Action.)
#
# Usage, from the repository root:
#   powershell -ExecutionPolicy Bypass -File google_scholar_crawler\update_citations.ps1

$ErrorActionPreference = 'Stop'
$scholarId = '-5kDAz4AAAAJ'
$here = $PSScriptRoot
$repo = Split-Path $here
$venv = Join-Path $here '.venv'
$py = Join-Path $venv 'Scripts\python.exe'

# 1. Python environment with the pinned packages (created on the first run only)
if (-not (Test-Path $py)) {
    Write-Host 'Setting up the Python environment (first run only)...'
    python -m venv $venv
    if ($LASTEXITCODE -ne 0) { throw 'Could not create the Python environment.' }
    & $py -m pip install -q -r (Join-Path $here 'requirements.txt')
    if ($LASTEXITCODE -ne 0) { throw 'Could not install the packages.' }
}

# 2. Fetch the data from Google Scholar into results/
Write-Host 'Fetching citations from Google Scholar...'
Push-Location $here
try {
    $env:GOOGLE_SCHOLAR_ID = $scholarId
    $env:PYTHONIOENCODING = 'utf-8'
    & $py -I main.py | Out-Null
    if ($LASTEXITCODE -ne 0) { throw 'Fetching from Google Scholar failed. Try again later.' }
} finally {
    Pop-Location
}

$results = Join-Path $here 'results'
$count = (Get-Content (Join-Path $results 'gs_data_shieldsio.json') -Raw -Encoding UTF8 | ConvertFrom-Json).message
Write-Host "Total citations: $count"

# 3. Publish results/ as the single commit of the google-scholar-stats branch
$remote = git -C $repo remote get-url origin
$gitDir = Join-Path $results '.git'
if (Test-Path $gitDir) { Remove-Item -Recurse -Force $gitDir }
Push-Location $results
try {
    git init -q
    git add gs_data.json gs_data_shieldsio.json
    git commit -q -m "Updated Citation Data"
    if ($LASTEXITCODE -ne 0) { throw 'Could not create the commit.' }
    git push -q --force $remote HEAD:google-scholar-stats
    if ($LASTEXITCODE -ne 0) { throw 'Could not push to GitHub.' }
} finally {
    Pop-Location
    if (Test-Path $gitDir) { Remove-Item -Recurse -Force $gitDir }
}

# 4. Clear jsDelivr's cache of the files, otherwise the site can keep showing
#    the old numbers for up to a day
$cdnPath = 'gf-gonzalez/gf-gonzalez.github.io@google-scholar-stats'
foreach ($f in 'gs_data.json', 'gs_data_shieldsio.json') {
    try { Invoke-WebRequest -UseBasicParsing "https://purge.jsdelivr.net/gh/$cdnPath/$f" | Out-Null }
    catch { Write-Warning "Could not clear the jsDelivr cache for $f; the badge may update late." }
}
Write-Host 'Done. The badges update within about 5 minutes (refresh the page to see them).'

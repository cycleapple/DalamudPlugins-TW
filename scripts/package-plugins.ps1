<#
.SYNOPSIS
    Packages any plugin directories under plugins/ into release-ready ZIP archives.

.DESCRIPTION
    This helper script scans the repository's plugins/ folder for directories and creates a ZIP package for each directory.
    Existing ZIP archives are left in place unless the directory is newer than the ZIP.
#>

$pluginsRoot = Join-Path $PSScriptRoot '..\plugins' | Resolve-Path -ErrorAction Stop
$pluginsRoot = $pluginsRoot.ProviderPath

Get-ChildItem -Path $pluginsRoot -Directory | ForEach-Object {
    $pluginDir = $_.FullName
    $packageName = "$($_.Name).zip"
    $packagePath = Join-Path $pluginsRoot $packageName

    if (Test-Path $packagePath) {
        $zipTime = (Get-Item $packagePath).LastWriteTimeUtc
        $contentTime = Get-ChildItem -Path $pluginDir -Recurse | Measure-Object -Property LastWriteTimeUtc -Maximum | Select-Object -ExpandProperty Maximum
        if ($contentTime -le $zipTime) {
            Write-Host "Skipping $packageName because it is already up to date"
            return
        }
    }

    if (Test-Path $packagePath) {
        Remove-Item -Path $packagePath -Force
    }

    Write-Host "Packaging plugin directory: $pluginDir -> $packageName"
    Compress-Archive -Path (Join-Path $pluginDir '*') -DestinationPath $packagePath -Force
}

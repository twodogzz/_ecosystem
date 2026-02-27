function New-ProjectSubfolders {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [string]$Root
    )

    $folders = @("documentation", "modules", "scripts", "tests", "logs")

    foreach ($folder in $folders) {
        $path = Join-Path $Root $folder
        if (-not (Test-Path $path)) {
            New-Item -ItemType Directory -Path $path | Out-Null
            Write-Log -Message "Created folder: $path" -ProjectRoot $Root
        }
    }
}
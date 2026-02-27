function New-ProjectFolder {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        $Metadata
    )

    $root = Join-Path "E:\SoftwareProjects" $Metadata.Name

    if (Test-Path $root) {
        $choice = Read-Host "Folder already exists. Continue? (y/n)"
        if ($choice -ne 'y') {
            Write-Warning "Project creation aborted by user."
            return $null
        }
    } else {
        New-Item -ItemType Directory -Path $root | Out-Null
    }

    Write-Log -Message "Created project root folder: $root" -ProjectRoot $root
    return $root
}
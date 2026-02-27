function Get-ProjectMetadata {
    [CmdletBinding()]
    param(
        [string]$Name
    )

    if (-not $Name) {
        $Name = Read-Host "Enter project name"
    }

    $Purpose = Read-Host "Enter project purpose (optional)"
    $Version = Read-Host "Enter version (default 0.1.0)"
    if (-not $Version) { $Version = "0.1.0" }

    $Author = "Wayne Freestun"
    $Created = (Get-Date).ToString("yyyy-MM-dd")

    return [PSCustomObject]@{
        Name    = $Name
        Purpose = $Purpose
        Version = $Version
        Author  = $Author
        Created = $Created
    }
}
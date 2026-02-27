function Get-ProjectMetadata {
    [CmdletBinding()]
    param(
        [string]$Name
    )

    # Reserved system folders
    $reservedNames = @('_ecosystem', '_logs', 'SoftwareProjects')

    # Validate project name
    while ([string]::IsNullOrWhiteSpace($Name)) {
        $Name = Read-Host "Enter project name (required)"
        if ([string]::IsNullOrWhiteSpace($Name)) {
            Write-Host "Project name cannot be empty. Please try again." -ForegroundColor Yellow
        }
    }

    # Warn about reserved names
    if ($reservedNames -contains $Name) {
        Write-Host "`n⚠️  WARNING: '$Name' is a system folder!" -ForegroundColor Red
        $proceed = Read-Host "This is a protected system directory. Are you sure? (type 'yes' to continue)"
        if ($proceed -ne 'yes') {
            Write-Host "Project creation cancelled." -ForegroundColor Yellow
            return $null
        }
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
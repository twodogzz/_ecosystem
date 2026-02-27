function Update-MasterProjectList {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        $Metadata,

        [Parameter(Mandatory)]
        [string]$Root
    )

    $listPath = "E:\SoftwareProjects\_ecosystem\MasterProjectList.json"

    if (-not (Test-Path $listPath)) {
        "[]" | Set-Content $listPath
    }

    $list = Get-Content $listPath | ConvertFrom-Json

    # Check for duplicate project names
    $existingProject = $list | Where-Object { $_.name -eq $Metadata.Name }
    if ($existingProject) {
        Write-Warning "Project '$($Metadata.Name)' already exists in MasterProjectList (ID: $($existingProject.id))"
        Write-Host "Updating existing entry instead of creating duplicate." -ForegroundColor Cyan

        # Update existing entry
        $existingProject.lastUpdated = (Get-Date).ToString("yyyy-MM-dd")
        $existingProject.purpose = $Metadata.Purpose
        $existingProject.version = $Metadata.Version

        $list | ConvertTo-Json -Depth 5 | Set-Content $listPath
        Write-Log -Message "Updated existing MasterProjectList entry for project ID $($existingProject.id)" -ProjectRoot $Root
    }
    else {
        # Add new entry
        $nextId = if ($list.Count -eq 0) { 1 } else { ($list.id | Measure-Object -Maximum).Maximum + 1 }

        $entry = [PSCustomObject]@{
            id          = $nextId
            name        = $Metadata.Name
            folder      = $Metadata.Name
            purpose     = $Metadata.Purpose
            version     = $Metadata.Version
            created     = $Metadata.Created
            lastUpdated = (Get-Date).ToString("yyyy-MM-dd")
        }

        $list += $entry
        $list | ConvertTo-Json -Depth 5 | Set-Content $listPath

        Write-Log -Message "Updated MasterProjectList with project ID $nextId" -ProjectRoot $Root
    }
}

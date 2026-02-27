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
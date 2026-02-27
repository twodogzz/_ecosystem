function New-Project {
    [CmdletBinding()]
    param(
        [string]$Name
    )

    $meta = Get-ProjectMetadata -Name $Name
    $root = New-ProjectFolder -Metadata $meta
    New-ProjectSubfolders -Root $root
    New-ProjectFiles -Root $root -Metadata $meta

    $git = Read-Host "Initialize Git repository? (y/n)"
    if ($git -eq 'y') {
        Initialize-GitRepository -Root $root
    }

    $rm = Read-Host "Run Repo Manager now? (y/n)"
    if ($rm -eq 'y') {
        Invoke-RepoManager -Root $root
    }

    Update-MasterProjectList -Metadata $meta -Root $root

    Write-Host "Project created successfully at $root"
}
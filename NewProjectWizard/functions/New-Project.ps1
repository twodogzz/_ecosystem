function New-Project {
    [CmdletBinding()]
    param(
        [string]$Name
    )

    try {
        $meta = Get-ProjectMetadata -Name $Name
        
        # Check if user rejected reserved name
        if (-not $meta) {
            return
        }
        
        $root = New-ProjectFolder -Metadata $meta
        
        # Check if user aborted folder creation
        if (-not $root) {
            Write-Host "Project creation cancelled." -ForegroundColor Yellow
            return
        }
        
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

        Write-Host "Project created successfully at $root" -ForegroundColor Green
    }
    catch {
        Write-Error "Project creation failed: $_"
    }
}
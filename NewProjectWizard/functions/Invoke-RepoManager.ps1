function Invoke-RepoManager {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [string]$Root,

        [string]$RepoManagerFolder
    )

    $moduleRoot = Split-Path -Parent (Split-Path -Parent $PSCommandPath)
    $solutionRoot = Split-Path -Parent $moduleRoot
    $softwareProjectsRoot = Split-Path -Parent $solutionRoot

    $candidatePaths = @()

    if (-not [string]::IsNullOrWhiteSpace($RepoManagerFolder)) {
        if ($RepoManagerFolder.ToLower().EndsWith('.ps1')) {
            $candidatePaths += $RepoManagerFolder
        }
        else {
            $candidatePaths += (Join-Path $RepoManagerFolder 'GitHub_Repo_Manager.ps1')
            $candidatePaths += (Join-Path $RepoManagerFolder 'RepoManager.ps1')
        }
    }

    $candidatePaths += @(
        'E:\SoftwareProjects\GitHubRepoManager\GitHub_Repo_Manager.ps1',
        (Join-Path $softwareProjectsRoot 'GitHubRepoManager\GitHub_Repo_Manager.ps1'),
        (Join-Path $solutionRoot 'RepoManager\RepoManager.ps1'),
        (Join-Path $solutionRoot 'GitHubRepoManager\GitHub_Repo_Manager.ps1')
    )

    $repoManager = $candidatePaths |
        Where-Object { -not [string]::IsNullOrWhiteSpace($_) } |
        Select-Object -Unique |
        Where-Object { Test-Path $_ } |
        Select-Object -First 1

    if (-not $repoManager) {
        $searched = ($candidatePaths | Select-Object -Unique) -join '; '
        throw "Repo Manager script not found. Searched: $searched"
    }

    Write-Host "Using Repo Manager: $repoManager" -ForegroundColor Cyan
    & $repoManager -ProjectPath $Root

    Write-Log -Message "Invoked Repo Manager for $Root using $repoManager" -ProjectRoot $Root
}

function Invoke-RepoManager {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [string]$Root
    )

    $repoManager = "E:\SoftwareProjects\_ecosystem\RepoManager\RepoManager.ps1"
    & $repoManager -ProjectPath $Root

    Write-Log -Message "Invoked Repo Manager for $Root" -ProjectRoot $Root
}
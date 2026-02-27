function Initialize-GitRepository {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [string]$Root
    )

    Push-Location $Root
    git init | Out-Null
    git add . | Out-Null
    git commit -m "Initial commit" | Out-Null
    Pop-Location

    Write-Log -Message "Initialized Git repository." -ProjectRoot $Root
}
function Write-Log {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [string]$Message,

        [Parameter(Mandatory)]
        [string]$ProjectRoot,

        [string]$Level = "INFO"
    )

    $timestamp = (Get-Date).ToString("yyyy-MM-dd HH:mm:ss")
    $entry = "[$timestamp] [$Level] $Message"

    # Project log
    $projectLog = Join-Path $ProjectRoot "logs\creation.log"
    $projectLogDir = Split-Path $projectLog
    if (-not (Test-Path $projectLogDir)) { New-Item -ItemType Directory -Path $projectLogDir | Out-Null }
    Add-Content -Path $projectLog -Value $entry

    # Global log
    $globalLog = "E:\SoftwareProjects\_logs\NewProjectWizard.log"
    Add-Content -Path $globalLog -Value $entry
}
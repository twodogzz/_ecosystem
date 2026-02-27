# NewProjectWizard Module
# Deterministic, auditable PowerShell project scaffolding

# Get the module root directory
$Script:ModuleRoot = $PSScriptRoot

# Dot-source all function files
$functionFiles = Get-ChildItem -Path (Join-Path $ModuleRoot "functions") -Filter "*.ps1" -Recurse

foreach ($file in $functionFiles) {
    try {
        . $file.FullName
        Write-Verbose "Loaded function: $($file.Name)"
    }
    catch {
        Write-Error "Failed to load function $($file.Name): $_"
    }
}

# Export module members
Export-ModuleMember -Function @(
    'Write-Log',
    'Get-ProjectMetadata',
    'New-ProjectFolder',
    'New-ProjectSubfolders',
    'New-ProjectFiles',
    'Initialize-GitRepository',
    'Invoke-RepoManager',
    'Update-MasterProjectList',
    'New-Project'
)

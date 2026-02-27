@{
    # Script module or binary module file associated with this manifest.
    RootModule = 'NewProjectWizard.psm1'

    # Version number of this module.
    ModuleVersion = '1.0.0'

    # ID used to uniquely identify this module
    GUID = 'a1b2c3d4-e5f6-4a5b-9c8d-7e6f5a4b3c2d'

    # Author of this module
    Author = 'Wayne Freestun'

    # Company or vendor of this module
    CompanyName = 'Personal'

    # Copyright statement for this module
    Copyright = '(c) 2026 Wayne Freestun. All rights reserved.'

    # Description of the functionality provided by this module
    Description = 'A deterministic, auditable PowerShell module for creating standardized software projects within the Software Projects Ecosystem. Provides automated folder structure creation, file templating, Git initialization, and master project list management.'

    # Minimum version of the PowerShell engine required by this module
    PowerShellVersion = '5.1'

    # Functions to export from this module
    FunctionsToExport = @(
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

    # Cmdlets to export from this module
    CmdletsToExport = @()

    # Variables to export from this module
    VariablesToExport = @()

    # Aliases to export from this module
    AliasesToExport = @()

    # Private data to pass to the module specified in RootModule/ModuleToProcess
    PrivateData = @{
        PSData = @{
            # Tags applied to this module for module discovery
            Tags = @('ProjectManagement', 'Scaffolding', 'Automation', 'Git', 'Template')

            # A URL to the license for this module.
            LicenseUri = ''

            # A URL to the main website for this project.
            ProjectUri = ''

            # ReleaseNotes of this module
            ReleaseNotes = 'Initial release of New Project Wizard module with full project scaffolding capabilities.'
        }
    }
}

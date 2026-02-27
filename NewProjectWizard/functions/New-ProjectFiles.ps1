function New-ProjectFiles {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [string]$Root,

        [Parameter(Mandatory)]
        $Metadata
    )

    $templateRoot = "E:\SoftwareProjects\_ecosystem\NewProjectWizard\templates"
    $filesToCreate = @(
        @{ Template = "gitignore.txt"; Target = ".gitignore"; Name = ".gitignore" },
        @{ Template = "license.txt"; Target = "LICENSE"; Name = "LICENSE" },
        @{ Template = "readme_template.md"; Target = "README.md"; Name = "README.md" },
        @{ Template = "project.json"; Target = "project.json"; Name = "project.json" }
    )

    # Check for existing files and ask for confirmation
    $existingFiles = @()
    foreach ($file in $filesToCreate) {
        $targetPath = Join-Path $Root $file.Target
        if (Test-Path $targetPath) {
            $existingFiles += $file.Name
        }
    }

    if ($existingFiles.Count -gt 0) {
        Write-Host "`n⚠️  WARNING: The following files already exist:" -ForegroundColor Yellow
        $existingFiles | ForEach-Object { Write-Host "  - $_" -ForegroundColor Yellow }
        $overwrite = Read-Host "Overwrite these files? (y/n)"
        if ($overwrite -ne 'y') {
            Write-Log -Message "File creation skipped by user (files already exist)" -ProjectRoot $Root
            Write-Host "File creation cancelled." -ForegroundColor Yellow
            return
        }
        Write-Log -Message "User confirmed overwrite of existing files: $($existingFiles -join ', ')" -ProjectRoot $Root
    }

    # --- .gitignore ---
    $gitignorePath = Join-Path $templateRoot "gitignore.txt"
    Copy-Item $gitignorePath (Join-Path $Root ".gitignore") -Force
    Write-Log -Message "Created .gitignore" -ProjectRoot $Root

    # --- LICENSE ---
    $licenseTemplate = Get-Content (Join-Path $templateRoot "license.txt") -Raw
    $licenseContent = $licenseTemplate `
        -replace "{{year}}", (Get-Date).Year `
        -replace "{{author}}", $Metadata.Author

    Set-Content -Path (Join-Path $Root "LICENSE") -Value $licenseContent
    Write-Log -Message "Created LICENSE" -ProjectRoot $Root

    # --- README.md ---
    $readmeTemplate = Get-Content (Join-Path $templateRoot "readme_template.md") -Raw
    $readmeContent = $readmeTemplate `
        -replace "{{name}}", $Metadata.Name `
        -replace "{{purpose}}", $Metadata.Purpose `
        -replace "{{version}}", $Metadata.Version `
        -replace "{{created}}", $Metadata.Created `
        -replace "{{author}}", $Metadata.Author

    Set-Content -Path (Join-Path $Root "README.md") -Value $readmeContent
    Write-Log -Message "Created README.md" -ProjectRoot $Root

    # --- project.json ---
    $jsonTemplate = Get-Content (Join-Path $templateRoot "project.json") -Raw
    $jsonContent = $jsonTemplate `
        -replace "{{name}}", $Metadata.Name `
        -replace "{{purpose}}", $Metadata.Purpose `
        -replace "{{version}}", $Metadata.Version `
        -replace "{{author}}", $Metadata.Author `
        -replace "{{created}}", $Metadata.Created

    Set-Content -Path (Join-Path $Root "project.json") -Value $jsonContent
    Write-Log -Message "Created project.json" -ProjectRoot $Root

    Write-Log -Message "All standard project files generated." -ProjectRoot $Root
}

# Create Desktop Shortcut for New Project Wizard
# Run this script once to create a desktop shortcut

$WScriptShell = New-Object -ComObject WScript.Shell
$Desktop = [System.Environment]::GetFolderPath('Desktop')
$ShortcutPath = Join-Path $Desktop "New Project Wizard.lnk"
$Shortcut = $WScriptShell.CreateShortcut($ShortcutPath)

# Target the batch file
$Shortcut.TargetPath = "E:\SoftwareProjects\_ecosystem\NewProjectWizard\Start-NewProjectWizard.bat"
$Shortcut.WorkingDirectory = "E:\SoftwareProjects\_ecosystem\NewProjectWizard"
$Shortcut.Description = "Create a new standardized project"
$Shortcut.IconLocation = "powershell.exe,0"

# Save the shortcut
$Shortcut.Save()

Write-Host "✓ Desktop shortcut created successfully!" -ForegroundColor Green
Write-Host "  Location: $ShortcutPath" -ForegroundColor Cyan
Write-Host ""
Write-Host "You can now double-click the 'New Project Wizard' icon on your desktop!" -ForegroundColor Yellow

# Pause so user can see the message
Start-Sleep -Seconds 3

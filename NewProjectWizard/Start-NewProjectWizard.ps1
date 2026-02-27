# New Project Wizard Launcher
# Double-click this file or right-click > Run with PowerShell

# Set execution policy for this session (in case it's restricted)
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass -Force

# Get the directory where this script is located
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path

# Import the module
Import-Module (Join-Path $ScriptDir "NewProjectWizard.psd1") -Force

# Clear screen for better visibility
Clear-Host

# Display welcome banner
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "    New Project Wizard v1.0.0" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Run the wizard
New-Project

# Pause so user can see results before window closes
Write-Host ""
Write-Host "Press any key to exit..." -ForegroundColor Gray
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")

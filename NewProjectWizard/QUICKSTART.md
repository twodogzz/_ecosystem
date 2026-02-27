# Quick Start Guide - New Project Wizard

This guide will help you get started with the New Project Wizard module.

---

## Step 1: Import the Module

```powershell
Import-Module "E:\SoftwareProjects\_ecosystem\NewProjectWizard\NewProjectWizard.psd1"
```

---

## Step 2: Create Your First Project

### Interactive Mode (Recommended)
```powershell
New-Project
```

You'll be prompted for:
1. **Project name** - e.g., "MyAwesomeApp"
2. **Project purpose** - e.g., "A web application for managing tasks"
3. **Version** - default is "0.1.0", press Enter to accept or type your own
4. **Git initialization** - type `y` to initialize Git, `n` to skip
5. **Repo Manager** - type `y` to run Repo Manager, `n` to skip

### With Project Name Pre-specified
```powershell
New-Project -Name "MyAwesomeApp"
```

This skips the name prompt but still asks for other metadata.

---

## Step 3: Verify Your Project

After creation, check:

### 1. Project Folder
```powershell
Get-ChildItem "E:\SoftwareProjects\MyAwesomeApp"
```

### 2. Project Metadata File
```powershell
Get-Content "E:\SoftwareProjects\MyAwesomeApp\project.json" | ConvertFrom-Json
```

### 3. Master Project List Entry
```powershell
Get-Content "E:\SoftwareProjects\_ecosystem\MasterProjectList.json" | ConvertFrom-Json
```

### 4. Creation Log
```powershell
Get-Content "E:\SoftwareProjects\MyAwesomeApp\logs\creation.log"
```

---

## Example: Complete Walkthrough

```powershell
# Import module
Import-Module "E:\SoftwareProjects\_ecosystem\NewProjectWizard\NewProjectWizard.psd1"

# Create project
New-Project -Name "TaskManager"

# When prompted:
# Enter project purpose: A web-based task management system
# Enter version: 1.0.0
# Initialize Git? y
# Run Repo Manager? n

# Result:
# Project created at E:\SoftwareProjects\TaskManager\
# ├── documentation/
# ├── modules/
# ├── scripts/
# ├── tests/
# ├── logs/
# │   └── creation.log
# ├── .gitignore
# ├── LICENSE
# ├── README.md
# └── project.json
```

---

## Advanced Usage

### Use Individual Functions

If you need more control, you can call individual functions:

```powershell
# Collect metadata
$meta = Get-ProjectMetadata -Name "AdvancedProject"

# Create folder structure
$root = New-ProjectFolder -Metadata $meta
New-ProjectSubfolders -Root $root

# Generate files
New-ProjectFiles -Root $root -Metadata $meta

# Initialize Git (optional)
Initialize-GitRepository -Root $root

# Update master list
Update-MasterProjectList -Metadata $meta -Root $root
```

### Custom Logging

```powershell
$projectPath = "E:\SoftwareProjects\MyProject"
Write-Log -Message "Custom log entry" -ProjectRoot $projectPath -Level "INFO"
```

---

## Typical Workflow

1. **Create Project**: `New-Project -Name "WebApp"`
2. **Navigate to Project**: `cd E:\SoftwareProjects\WebApp`
3. **Add Your Code**: Start building in the `scripts/` or `modules/` folders
4. **Document**: Update README.md and add docs to `documentation/`
5. **Test**: Add tests to `tests/`
6. **Commit Changes**: `git add .` then `git commit -m "Your message"`

---

## Tips

- **Project Names**: Use PascalCase or kebab-case (e.g., "MyProject" or "my-project")
- **Purpose Field**: Be descriptive - this helps when browsing MasterProjectList.json
- **Version Numbers**: Follow semantic versioning (major.minor.patch)
- **Templates**: Customize templates in `templates/` folder to match your preferences
- **Logs**: Check logs if something goes wrong during project creation

---

## Troubleshooting

### Module Not Loading
```powershell
# Check if path is correct
Test-Path "E:\SoftwareProjects\_ecosystem\NewProjectWizard\NewProjectWizard.psd1"

# Try importing with -Verbose flag
Import-Module "E:\SoftwareProjects\_ecosystem\NewProjectWizard\NewProjectWizard.psd1" -Verbose
```

### Project Already Exists
If a project folder already exists, you'll be prompted:
```
Folder already exists. Continue? (y/n)
```
- Type `y` to continue (won't overwrite existing files)
- Type `n` to abort

### Git Not Initialized
Ensure Git is installed and in your PATH:
```powershell
git --version
```

---

## Next Steps

1. **Add to Profile**: Add the Import-Module command to your `$PROFILE` to auto-load on startup
2. **Customize Templates**: Edit files in `templates/` to match your standards
3. **Explore Commands**: Run `Get-Command -Module NewProjectWizard` to see all available commands
4. **Read Documentation**: Check README.md for full module documentation

---

Happy project creating! 🚀

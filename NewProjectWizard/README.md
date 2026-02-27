# New Project Wizard PowerShell Module

A deterministic, auditable PowerShell module for creating standardized software projects within the Software Projects Ecosystem.

---

## Features

- **Standardized Folder Structure**: Automatically creates documentation, modules, scripts, tests, and logs folders
- **Template-Based Files**: Generates .gitignore, LICENSE, README.md, and project.json from templates
- **Git Integration**: Optional Git repository initialization with initial commit
- **Repo Manager Integration**: Optional invocation of the Repo Manager for advanced repository configuration
- **Centralized Tracking**: Automatically updates MasterProjectList.json with project metadata
- **Comprehensive Logging**: Dual logging system (per-project and global logs)

---

## Installation

### Quick Start (Recommended)
No installation needed! Simply:

1. **Double-click** `Start-NewProjectWizard.bat` to run the wizard
2. Or create a desktop shortcut for easy access

> See [HOW-TO-RUN.md](HOW-TO-RUN.md) for complete instructions

### Advanced: Module Import
If you prefer to use it as a PowerShell module:

#### Option 1: Import directly
```powershell
Import-Module "E:\SoftwareProjects\_ecosystem\NewProjectWizard\NewProjectWizard.psd1"
```

#### Option 2: Add to PowerShell Profile
Add this line to your PowerShell profile (`$PROFILE`):
```powershell
Import-Module "E:\SoftwareProjects\_ecosystem\NewProjectWizard\NewProjectWizard.psd1"
```

---

## Usage

### Quick Method
Double-click `Start-NewProjectWizard.bat` and follow the prompts

### Module Method
```powershell
New-Project
```

### Basic Usage
```powershell
# Interactive mode - prompts for all metadata
New-Project

# Specify project name upfront
New-Project -Name "MyNewProject"
```

### What Happens During Project Creation

1. **Metadata Collection**: Prompts for project name, purpose, version, author, and creation date
2. **Folder Creation**: Creates root folder at `E:\SoftwareProjects\<ProjectName>\`
3. **Subfolder Creation**: Creates standard subfolders (documentation, modules, scripts, tests, logs)
4. **File Generation**: Creates .gitignore, LICENSE, README.md, and project.json from templates
5. **Git Initialization** (optional): Initializes Git repository and makes initial commit
6. **Repo Manager** (optional): Invokes Repo Manager for additional configuration
7. **Master List Update**: Adds project entry to MasterProjectList.json

---

## Project Structure

Every project created follows this structure:

```
E:\SoftwareProjects\<ProjectName>\
├── documentation/
├── modules/
├── scripts/
├── tests/
├── logs/
│   └── creation.log
├── .gitignore
├── LICENSE
├── README.md
└── project.json
```

---

## Available Commands

| Command | Description |
|---------|-------------|
| `New-Project` | Main orchestrator - creates a complete project |
| `Get-ProjectMetadata` | Collects project metadata interactively |
| `New-ProjectFolder` | Creates the root project folder |
| `New-ProjectSubfolders` | Creates standard subfolders |
| `New-ProjectFiles` | Generates files from templates |
| `Initialize-GitRepository` | Initializes Git and makes initial commit |
| `Invoke-RepoManager` | Calls the Repo Manager tool |
| `Update-MasterProjectList` | Updates MasterProjectList.json |
| `Write-Log` | Logs messages to project and global logs |

---

## Master Project List

All projects are tracked in:
```
E:\SoftwareProjects\_ecosystem\MasterProjectList.json
```

This file contains:
- Unique project IDs
- Project names and folders
- Purpose descriptions
- Version information
- Creation and last updated timestamps

---

## Logging

### Per-Project Log
```
<ProjectRoot>\logs\creation.log
```

### Global Log
```
E:\SoftwareProjects\_logs\NewProjectWizard.log
```

Both logs use the format: `[timestamp] [level] message`

---

## Templates

Templates are located in `templates/` and support variable substitution:

| Variable | Description |
|----------|-------------|
| `{{name}}` | Project name |
| `{{purpose}}` | Project purpose |
| `{{version}}` | Project version |
| `{{author}}` | Author name |
| `{{created}}` | Creation date |
| `{{year}}` | Current year |

---

## Architecture

The module follows PowerShell best practices:

- **Modular Design**: Each function has a single responsibility
- **CmdletBinding**: All functions use advanced parameter binding
- **Verbose Support**: Use `-Verbose` flag for detailed output
- **Error Handling**: Proper error propagation and user feedback
- **Idempotency**: Safe to run multiple times (checks for existing folders)

---

## Requirements

- PowerShell 5.1 or higher
- Git (if using Git initialization feature)
- Repo Manager (if using Repo Manager integration)

---

## Version History

### 1.0.0 (2026-02-28)
- Initial release
- Full project scaffolding functionality
- Template system
- Git integration
- Master project list tracking

---

## Author

Wayne Freestun

## License

MIT License - See LICENSE file for details

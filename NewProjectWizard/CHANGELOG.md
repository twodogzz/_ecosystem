# Changelog

All notable changes to the New Project Wizard module will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

---

## [1.0.0] - 2026-02-28

### Added
- Initial release of New Project Wizard PowerShell module
- Core project scaffolding functionality
- Nine exported functions:
  - `New-Project` - Main orchestrator
  - `Get-ProjectMetadata` - Interactive metadata collection
  - `New-ProjectFolder` - Root folder creation
  - `New-ProjectSubfolders` - Standard subfolder creation
  - `New-ProjectFiles` - Template-based file generation
  - `Initialize-GitRepository` - Git initialization
  - `Invoke-RepoManager` - Repo Manager integration
  - `Update-MasterProjectList` - Master list management
  - `Write-Log` - Dual logging system
- Template system with variable substitution
- Support for .gitignore, LICENSE (MIT), README.md, and project.json
- Automatic MasterProjectList.json tracking
- Per-project and global logging
- Module manifest (.psd1) with full metadata
- Comprehensive documentation (README.md, QUICKSTART.md)

### Features
- Deterministic project creation
- Auditable through logs and master project list
- Modular architecture - each function has single responsibility
- Idempotent operations - safe to run multiple times
- Interactive prompts with sensible defaults
- Optional Git integration
- Optional Repo Manager integration

---

## [Unreleased]

### Planned Features
- Add support for custom project templates
- Add project archival functionality
- Add project reporting/statistics commands
- Add template validation
- Add support for multiple template sets
- Add project migration/update functionality
- Add support for pre-creation hooks
- Add support for post-creation hooks

---

## Notes

### Version History
- **1.0.0**: Initial stable release with full scaffolding capabilities

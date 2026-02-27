# How to Run New Project Wizard

There are **three simple ways** to run the New Project Wizard - choose what works best for you!

---

## ⭐ Method 1: Double-Click the Batch File (Easiest)

1. Navigate to: `E:\SoftwareProjects\_ecosystem\NewProjectWizard\`
2. **Double-click** `Start-NewProjectWizard.bat`
3. The wizard will start automatically!

**Pros:**
- Simplest method
- No setup required
- Works immediately

---

## ⭐ Method 2: Create a Desktop Shortcut

### Automatic (Fastest):
1. Right-click on `Create-DesktopShortcut.ps1`
2. Select **"Run with PowerShell"**
3. A shortcut will appear on your desktop automatically!

### Manual - Quick Setup:
1. Right-click on `Start-NewProjectWizard.bat`
2. Click **"Send to"** → **"Desktop (create shortcut)"**
3. Now you can double-click the desktop icon anytime!

### Or Create Custom Shortcut:
1. Right-click on your desktop → **New** → **Shortcut**
2. For location, enter:
   ```
   powershell.exe -ExecutionPolicy Bypass -File "E:\SoftwareProjects\_ecosystem\NewProjectWizard\Start-NewProjectWizard.ps1"
   ```
3. Click **Next**
4. Name it: `New Project Wizard`
5. Click **Finish**

**Pros:**
- One-click access from desktop
- Can pin to taskbar
- Professional appearance

---

## ⭐ Method 3: Right-Click in File Explorer

### One-Time Setup:
1. Navigate to any folder in File Explorer
2. Hold **Shift** and right-click in the folder
3. Select **"Open PowerShell window here"** or **"Open in Terminal"**
4. Run this command **once** to add to your profile:
   ```powershell
   Add-Content $PROFILE "`nImport-Module 'E:\SoftwareProjects\_ecosystem\NewProjectWizard\NewProjectWizard.psd1'"
   ```

### Then Every Time:
1. Open PowerShell (any way you like)
2. Type: `New-Project`
3. Press Enter

**Pros:**
- Available in any PowerShell window
- Professional power-user approach
- No mouse clicking needed

---

## 🎯 Recommended for You

Based on your preference for simplicity:

### **Use Method 1 (Double-Click .bat file)**
- Navigate to folder ONCE
- Create a shortcut on your desktop
- Double-click whenever you need to create a project

OR

### **Use Method 2 (Desktop Shortcut)**
- Set it up once (30 seconds)
- Double-click forever after

---

## Troubleshooting

### "Running scripts is disabled on this system"
If you see this error when double-clicking the `.ps1` file:
- **Solution:** Use the `.bat` file instead (it bypasses this restriction)

### Batch file doesn't work
Try right-clicking `Start-NewProjectWizard.bat` and select **"Run as administrator"**

### Want to modify wizard behavior
Edit `Start-NewProjectWizard.ps1` to customize the startup banner or add default parameters

---

## Files Explained

| File | Purpose |
|------|---------|
| `Start-NewProjectWizard.bat` | **Batch file** - Double-click to run (recommended) |
| `Start-NewProjectWizard.ps1` | **PowerShell launcher** - Can also be run directly |
| `NewProjectWizard.psd1` | Module manifest (used by launchers) |
| `NewProjectWizard.psm1` | Module code (used by launchers) |

---

**Bottom Line:** Just double-click `Start-NewProjectWizard.bat` and you're good to go! 🚀

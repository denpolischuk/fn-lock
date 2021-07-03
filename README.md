# Fn lock fix

This script will make your F1-F12 keys work in 'normal' mode.

## What for

To fix issue with Fn lock on Linux for Keychron keyboard (this also should work with other keyboards). Keychron's shortcut to switch between the Fn lock states works only on Windows. I didn't find any recomendations how to switch fn lock on linux from them.

## How

- `chmod +x install.sh`
- `sudo ./install.sh`

To uninstall run: `sudo ./install.sh uninstall`

## Please notice

Script uses systemctl to start and enable a systemd service.
The script that actually changes the fn lock state will be located at `/usr/bin` so if you don't use systemd you can trigger it in any other way you want.

# Dotfiles

This repository contains my personal configuration files (dotfiles) for a Linux desktop environment. The setup is centered around the Hyprland Wayland compositor, with various customizations for applications, the shell environment, and utility scripts.

## Contents

*   **`config/`**: Configuration files for various applications, including Hyprland, Kitty, Neovim, Waybar, and more.
*   **`home/`**: Files that reside directly in the home directory (`~`), such as `.bashrc`, `.gitconfig`, `.bash_profile`, etc.
*   **`scripts/`**: Custom shell scripts for various tasks (e.g., battery status, screenshots).
*   **`wallpapers/`**: A collection of desktop wallpapers.

## Installation / Setup on a New System

When moving to a new machine or performing a fresh installation, follow these steps to deploy these dotfiles:

1.  **Clone the repository:**
    ```bash
    git clone https://github.com/your-username/dotfiles.git ~/dotfiles # Replace with your actual repo URL
    cd ~/dotfiles
    ```

2.  **Deploy `home/` contents:**
    Files within the `home/` directory are intended to be placed directly in your home directory (`~`).
    ```bash
    cp -r home/.* ~/
    ```
    *Note: Be cautious with `cp -r home/.* ~/` as it might overwrite existing files without warning. Review the files first or use symbolic links for more control.*

3.  **Deploy `config/` contents:**
    The contents of the `config/` directory should be copied to `~/.config/`.
    ```bash
    cp -r config/* ~/.config/
    ```

4.  **Deploy `scripts/` contents:**
    The `scripts/` directory and its contents should be placed directly in your home directory.
    ```bash
    cp -r scripts/ ~/
    ```

5.  **Deploy `wallpapers/` contents:**
    The `wallpapers/` directory and its contents should also be placed directly in your home directory.
    ```bash
    cp -r wallpapers/ ~/
    ```

6.  **Install dependencies:**
    This setup relies on several applications and tools. Ensure you install them via your distribution's package manager. Some key applications include:
    *   Hyprland (Wayland compositor)
    *   Kitty (terminal emulator)
    *   Neovim (text editor)
    *   Waybar (status bar)
    *   wofi (application launcher)
    *   `eza` (for `ls` aliases)
    *   `dunst` (notification daemon)
    *   `dms` (dank material shell, referenced in hyprland.conf)
    *   `playerctl`
    *   `brightnessctl`
    *   `wl-clipboard` and `cliphist`
    *   `nm-applet`, `blueman-applet`

7.  **Post-installation steps:**
    *   Log out and log back in (or reboot) to ensure all configurations take effect.
    *   You may need to manually configure some aspects, such as your display settings if they differ from the default `hyprland.conf`.
    *   Review `~/.bashrc` and other configuration files for any system-specific paths or settings that might need adjustment.

## Key Software / Components

*   **Window Manager:** [Hyprland](https://wiki.hyprland.org/) (Dynamic Tiling Wayland Compositor)
*   **Shell:** Bash
*   **Terminal:** [Kitty](https://sw.kovidgoyal.net/kitty/)
*   **Editor:** [Neovim](https://neovim.io/)
*   **Status Bar:** [Waybar](https://github.com/Alexays/Waybar)
*   **Application Launcher:** [wofi](https://hg.sr.ht/~scoopta/wofi)
*   **File Manager:** [pcmanfm](https://wiki.lxde.org/en/PCManFM)

## Custom Scripts

*   `scripts/batstat`: Displays battery level and status, with low battery notifications.
*   `scripts/hyprshot`: Screenshot utility integrated with Hyprland.
*   `scripts/notifyCapsLock`: Script to notify CapsLock state.
*   `scripts/xdph`: A script likely related to XDG Portals/desktop environment integration.

---
*Note: This `README.md` provides general instructions. Depending on your system and existing configurations, you might need to adjust paths or merge configurations manually.*

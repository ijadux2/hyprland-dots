# 🎨 Hyprland Dotfiles

A beautiful, modern, and functional Hyprland desktop environment with a focus on aesthetics and productivity. This configuration features a Catppuccin Mocha theme with carefully selected applications and a polished user experience.

## 📸 Preview

![Hyprland Setup](https://img.shields.io/badge/Theme-Catppuccin%20Mocha-1e1e2e?style=for-the-badge&logo=hyprland)
![Shell](https://img.shields.io/badge/Shell-Nushell-4eaa25?style=for-the-badge&logo=nu)
![Terminal](https://img.shields.io/badge/Terminal-Kitty-ff8c00?style=for-the-badge&logo=kitty)

## 🚀 Features

- **🖥️ Window Manager**: Hyprland with animations and effects
- **🎨 Theme**: Catppuccin Mocha color scheme throughout
- **🔧 Utilities**: Modern tools for productivity and development
- **📱 Status Bar**: Waybar with system monitoring
- **🔍 Launcher**: Rofi with multiple themes
- **📋 Notifications**: Swaync for notification management
- **🖼️ Wallpaper Management**: swww with smooth transitions
- **🎵 Media Controls**: Playerctl integration
- **📸 Screenshots**: Grimblast for area screenshots

## 📦 Required Applications

### Core System
- **Hyprland** - Wayland compositor
- **Waybar** - Status bar
- **Swaync** - Notification center
- **Rofi** - Application launcher
- **Kitty** - Terminal emulator
- **Nushell** - Modern shell
- **Starship** - Prompt customization

### Utilities & Tools
- **swww** - Wallpaper management
- **wl-clipboard** - Clipboard management
- **clipvault** - Clipboard history
- **grimblast** - Screenshot tool
- **hyprlock** - Screen lock
- **fuzzel** - Alternative launcher
- **thunar** - File manager
- **pavucontrol** - Audio control

### Development
- **Neovim** - Text editor (LazyVim config)
- **Git** - Version control

### Media & Entertainment
- **Spotify** (Flatpak) - Music streaming
- **Obsidian** (Flatpak) - Note-taking

### System Controls
- **wpctl** - WirePlumber audio control
- **brightnessctl** - Brightness control
- **playerctl** - Media player control

### Fonts
- **JetBrains Mono NL** - Terminal font
- **Nerd Fonts** - Icon support

## 🛠️ Installation

### Option 1: Interactive Installation Script (Recommended)

```bash
git clone https://github.com/yourusername/hyprland-dots.git
cd hyprland-dots
chmod +x install.sh
./install.sh
```

The interactive script will guide you through:
- Package manager detection (dnf, pacman, apt, etc.)
- Installing required dependencies
- Setting up configuration files
- Installing Flatpak applications
- Configuring fonts and themes

### Option 2: Manual Installation

#### 1. Install System Packages

**For Fedora:**
```bash
sudo dnf install hyprland waybar swaync rofi kitty nushell starship swww wl-clipboard grimblast hyprlock fuzzel thunar pavucontrol wpctl brightnessctl playerctl neovim git
```

**For Arch:**
```bash
sudo pacman -S hyprland waybar swaync rofi kitty nushell starship swww wl-clipboard grimblast hyprlock fuzzel thunar pavucontrol wireplumber brightnessctl playerctl neovim git
```

**For Ubuntu/Debian:**
```bash
sudo apt install hyprland waybar swaync rofi kitty nushell starship swww wl-clipboard grimblast hyprlock fuzzel thunar pavucontrol wireplumber brightnessctl playerctl neovim git
```

#### 2. Install Flatpak Applications
```bash
flatpak install flathub com.spotify.Client
flatpak install flathub md.obsidian.Obsidian
```

#### 3. Install Fonts
```bash
# JetBrains Mono NL
sudo dnf install jetbrains-mono-fonts-all  # Fedora
sudo pacman -S ttf-jetbrains-mono-nerd     # Arch
sudo apt install fonts-jetbrains-mono       # Ubuntu

# Or manually from Nerd Fonts
```

#### 4. Clone and Setup Dotfiles
```bash
git clone https://github.com/yourusername/hyprland-dots.git ~/hyprland-dots
cd ~/hyprland-dots
./setup.sh
```

## 📁 Configuration Structure

```
hyprland-dots/
├── hypr/                    # Hyprland configuration
│   ├── hyprland.conf       # Main config
│   ├── hyprlock.conf       # Lock screen
│   └── mocha.conf          # Theme colors
├── waybar/                 # Status bar config
├── kitty/                  # Terminal config
├── nushell/               # Shell configuration
├── nvim/                  # Neovim (LazyVim)
├── rofi/                  # Launcher themes
├── swaync/                # Notification center
├── wallpaper/              # Wallpapers
├── fontconfig/            # Font configuration
└── bat/                   # Bat syntax highlighting
```

## ⌨️ Keybindings

| Keybinding | Action |
|------------|--------|
| `Super + Enter` | Open terminal |
| `Super + D` | Application launcher (Rofi) |
| `Super + Q` | Close window |
| `Super + Space` | Toggle floating |
| `Super + Arrow keys` | Move focus |
| `Super + Shift + Arrow` | Move window |
| `Super + 1-0` | Switch workspace |
| `Super + Shift + 1-0` | Move to workspace |
| `Super + W` | Change wallpaper |
| `Super + E` | File manager (Thunar) |
| `Super + B` | Browser (Brave) |
| `Super + C` | Neovim |
| `Super + M` | Spotify |
| `Super + T` | Obsidian |
| `Super + L` | Lock screen |
| `Super + Print` | Screenshot area |
| `Super + N` | Toggle notifications |
| `XF86Audio*` | Media/volume controls |

## 🎨 Customization

### Colors
All colors are based on Catppuccin Mocha. You can modify the color scheme in:
- `hypr/mocha.conf` - Hyprland colors
- `nushell/config.nu` - Shell colors
- `waybar/style.css` - Status bar colors

### Wallpaper
Add new wallpapers to the `wallpaper/` directory and use the wallpaper script (`Super + W`) to cycle through them.

### Rofi Themes
Multiple Rofi themes are available in `rofi/`. Change the default in `hypr/hyprland.conf` by modifying the rofi launch command.

## 🔧 Troubleshooting

### Common Issues

1. **Wayland applications not working**
   - Ensure you're running a Wayland session
   - Check if applications have Wayland support

2. **Clipboard not working**
   - Make sure `wl-clipboard` is installed
   - Restart the clipboard services

3. **Screen sharing not working**
   - Install `xdg-desktop-portal-hyprland`
   - Add `exec-once = xdg-desktop-portal-hyprland` to Hyprland config

4. **Fonts not rendering correctly**
   - Install Nerd Fonts
   - Rebuild font cache: `fc-cache -fv`

### Performance Tips

- Disable animations on slower hardware
- Reduce blur effects in decoration settings
- Adjust workspace transition speeds

## 🤝 Contributing

Feel free to submit issues, feature requests, or pull requests to improve this configuration!

## 📄 License

This project is open source and available under the [MIT License](LICENSE).

## 🙏 Credits

- [Hyprland](https://github.com/hyprwm/Hyprland) - Amazing Wayland compositor
- [Catppuccin](https://github.com/catppuccin/catppuccin) - Beautiful color scheme
- [LazyVim](https://github.com/LazyVim/LazyVim) - Neovim configuration
- All the open source projects that make this setup possible!

---

**Enjoy your new Hyprland setup! 🎉**
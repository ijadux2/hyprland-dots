#!/bin/bash

# Interactive Hyprland Dotfiles Installation Script
# Author: Your Name
# Description: Automated setup for Hyprland desktop environment

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Configuration
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKUP_DIR="$HOME/.dotfiles_backup_$(date +%Y%m%d_%H%M%S)"
LOG_FILE="$HOME/hyprland_install.log"

# Logging function
log() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" >> "$LOG_FILE"
}

# Print colored output
print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
    log "INFO: $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
    log "SUCCESS: $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
    log "WARNING: $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
    log "ERROR: $1"
}

print_header() {
    echo -e "${PURPLE}================================${NC}"
    echo -e "${PURPLE}$1${NC}"
    echo -e "${PURPLE}================================${NC}"
}

# Check if running as root
check_root() {
    if [[ $EUID -eq 0 ]]; then
        print_error "This script should not be run as root!"
        exit 1
    fi
}

# Detect package manager
detect_package_manager() {
    if command -v dnf &> /dev/null; then
        echo "dnf"
    elif command -v pacman &> /dev/null; then
        echo "pacman"
    elif command -v apt &> /dev/null; then
        echo "apt"
    elif command -v zypper &> /dev/null; then
        echo "zypper"
    else
        echo "unknown"
    fi
}

# Install packages based on package manager
install_packages() {
    local pkg_manager=$1
    shift
    local packages=("$@")
    
    case $pkg_manager in
        "dnf")
            sudo dnf install -y "${packages[@]}"
            ;;
        "pacman")
            sudo pacman -S --noconfirm "${packages[@]}"
            ;;
        "apt")
            sudo apt update
            sudo apt install -y "${packages[@]}"
            ;;
        "zypper")
            sudo zypper install -y "${packages[@]}"
            ;;
        *)
            print_error "Unsupported package manager. Please install packages manually."
            return 1
            ;;
    esac
}

# Backup existing configuration
backup_config() {
    local config_path=$1
    if [[ -e "$config_path" ]]; then
        local backup_path="$BACKUP_DIR/$(basename "$config_path")"
        mkdir -p "$BACKUP_DIR"
        cp -r "$config_path" "$backup_path"
        print_status "Backed up $config_path to $backup_path"
    fi
}

# Create symbolic link
create_symlink() {
    local source=$1
    local target=$2
    
    # Create target directory if it doesn't exist
    mkdir -p "$(dirname "$target")"
    
    # Remove existing target
    if [[ -e "$target" ]]; then
        backup_config "$target"
        rm -rf "$target"
    fi
    
    # Create symbolic link
    ln -sf "$source" "$target"
    print_success "Linked $source -> $target"
}

# Interactive yes/no prompt
ask_yes_no() {
    local prompt=$1
    local default=${2:-n}
    
    while true; do
        echo -n -e "${CYAN}$prompt${NC} [y/N]: "
        read -r response
        response=${response:-$default}
        
        case $response in
            [Yy]|[Yy][Ee][Ss])
                return 0
                ;;
            [Nn]|[Nn][Oo]|"")
                return 1
                ;;
            *)
                echo "Please answer yes or no."
                ;;
        esac
    done
}

# Welcome message
welcome() {
    clear
    print_header "🎨 Hyprland Dotfiles Installer"
    echo
    echo -e "${CYAN}This script will install and configure a beautiful Hyprland desktop environment.${NC}"
    echo
    echo -e "${YELLOW}Features:${NC}"
    echo "  • Catppuccin Mocha theme"
    echo "  • Modern applications (Kitty, Waybar, Rofi, etc.)"
    echo "  • Productivity tools and shortcuts"
    echo "  • Neovim with LazyVim configuration"
    echo
    echo -e "${RED}⚠️  This will backup and replace existing configurations!${NC}"
    echo
    echo -e "${BLUE}Log file: $LOG_FILE${NC}"
    echo
    
    if ! ask_yes_no "Do you want to continue?"; then
        print_status "Installation cancelled."
        exit 0
    fi
}

# System update
update_system() {
    print_header "📦 Updating System"
    
    local pkg_manager=$(detect_package_manager)
    
    if ask_yes_no "Update system packages?"; then
        case $pkg_manager in
            "dnf")
                sudo dnf update -y
                ;;
            "pacman")
                sudo pacman -Syu --noconfirm
                ;;
            "apt")
                sudo apt update && sudo apt upgrade -y
                ;;
            "zypper")
                sudo zypper update -y
                ;;
        esac
        print_success "System updated"
    fi
}

# Install core packages
install_core_packages() {
    print_header "🔧 Installing Core Packages"
    
    local pkg_manager=$(detect_package_manager)
    
    # Package lists for different package managers
    case $pkg_manager in
        "dnf")
            local packages=(
                "hyprland" "waybar" "swaync" "rofi" "kitty" "nushell" "starship"
                "swww" "wl-clipboard" "grimblast" "hyprlock" "fuzzel" "thunar"
                "pavucontrol" "wireplumber" "brightnessctl" "playerctl" "neovim" "git"
                "bat" "eza" "fd-find" "ripgrep" "jetbrains-mono-fonts-all"
                "xdg-desktop-portal-hyprland" "libgtop2" "bluez" "bluez-tools"
                "NetworkManager" "gvfs" "nodejs" "gtksourceview3" "libsoup3"
            )
            ;;
        "pacman")
            local packages=(
                "hyprland" "waybar" "swaync" "rofi" "kitty" "nushell" "starship"
                "swww" "wl-clipboard" "grimblast" "hyprlock" "fuzzel" "thunar"
                "pavucontrol" "wireplumber" "brightnessctl" "playerctl" "neovim" "git"
                "bat" "eza" "fd" "ripgrep" "ttf-jetbrains-mono-nerd"
                "xdg-desktop-portal-hyprland" "libgtop" "bluez" "bluez-utils"
                "networkmanager" "gvfs" "nodejs" "gtksourceview3" "libsoup"
            )
            ;;
        "apt")
            local packages=(
                "hyprland" "waybar" "swaync" "rofi" "kitty" "nushell" "starship"
                "swww" "wl-clipboard" "grimblast" "hyprlock" "fuzzel" "thunar"
                "pavucontrol" "wireplumber" "brightnessctl" "playerctl" "neovim" "git"
                "bat" "eza" "fd-find" "ripgrep" "fonts-jetbrains-mono"
                "xdg-desktop-portal-hyprland" "libgtop-2.0-0" "bluez" "bluez-tools"
                "network-manager" "gvfs" "nodejs" "gtksourceview3" "libsoup3"
            )
            ;;
    esac
    
    print_status "Package manager detected: $pkg_manager"
    print_status "Installing ${#packages[@]} packages..."
    
    if install_packages "$pkg_manager" "${packages[@]}"; then
        print_success "Core packages installed"
    else
        print_error "Failed to install packages"
        return 1
    fi
}

# Install Flatpak applications
install_flatpaks() {
    print_header "📱 Installing Flatpak Applications"
    
    if ! command -v flatpak &> /dev/null; then
        print_warning "Flatpak not found. Skipping Flatpak applications."
        return
    fi
    
    local flatpaks=(
        "com.spotify.Client"
        "md.obsidian.Obsidian"
        "io.github.seadve.Kooha"
        "com.beavernotes.beavernotes"
    )
    
    if ask_yes_no "Install Flatpak applications?"; then
        # Add Flathub if not already added
        flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
        
        for flatpak in "${flatpaks[@]}"; do
            print_status "Installing $flatpak..."
            if flatpak install -y flathub "$flatpak"; then
                print_success "Installed $flatpak"
            else
                print_warning "Failed to install $flatpak"
            fi
        done
    fi
}

# Setup configuration files
setup_configs() {
    print_header "⚙️ Setting Up Configuration Files"
    
    # Create necessary directories
    mkdir -p "$HOME/.config"
    mkdir -p "$HOME/.local/share/applications"
    mkdir -p "$HOME/Pictures/Screenshots"
    
    # Configuration mappings
    declare -A configs=(
        ["$DOTFILES_DIR/hypr"]="$HOME/.config/hypr"
        ["$DOTFILES_DIR/waybar"]="$HOME/.config/waybar"
        ["$DOTFILES_DIR/kitty"]="$HOME/.config/kitty"
        ["$DOTFILES_DIR/nushell"]="$HOME/.config/nushell"
        ["$DOTFILES_DIR/nvim"]="$HOME/.config/nvim"
        ["$DOTFILES_DIR/rofi"]="$HOME/.config/rofi"
        ["$DOTFILES_DIR/swaync"]="$HOME/.config/swaync"
        ["$DOTFILES_DIR/fontconfig"]="$HOME/.config/fontconfig"
        ["$DOTFILES_DIR/bat"]="$HOME/.config/bat"
    )
    
    for source in "${!configs[@]}"; do
        target="${configs[$source]}"
        create_symlink "$source" "$target"
    done
    
    # Setup wallpapers
    if [[ -d "$DOTFILES_DIR/wallpaper" ]]; then
        mkdir -p "$HOME/Pictures/wallpapers"
        cp -r "$DOTFILES_DIR/wallpaper"/* "$HOME/Pictures/wallpapers/"
        
        # Make wallpaper script executable
        if [[ -f "$HOME/Pictures/wallpapers/wallpapaer.sh" ]]; then
            chmod +x "$HOME/Pictures/wallpapers/wallpapaer.sh"
        fi
    fi
    
    print_success "Configuration files setup complete"
}

# Setup scripts
setup_scripts() {
    print_header "📜 Setting Up Scripts"
    
    # Create scripts directory
    mkdir -p "$HOME/.local/bin"
    
    # Create sway scripts directory for rofi menus
    mkdir -p "$HOME/.config/sway/scripts"
    
    # Create power menu script
    cat > "$HOME/.config/sway/scripts/rofi-powermenu" << 'EOF'
#!/bin/bash

# Rofi power menu
options="Shutdown\nReboot\nLogout\nLock\nSuspend"

chosen=$(echo -e "$options" | rofi -dmenu -i -p "Power Menu:")

case "$chosen" in
    Shutdown)
        systemctl poweroff
        ;;
    Reboot)
        systemctl reboot
        ;;
    Logout)
        hyprctl dispatch exit
        ;;
    Lock)
        hyprlock
        ;;
    Suspend)
        systemctl suspend
        ;;
esac
EOF
    
    # Create clipboard script
    cat > "$HOME/.config/sway/scripts/rofi-clipboard" << 'EOF'
#!/bin/bash

# Rofi clipboard menu
clipvault list | rofi -dmenu -i -p "Clipboard:" | clipvault restore
EOF
    
    # Make scripts executable
    chmod +x "$HOME/.config/sway/scripts/rofi-powermenu"
    chmod +x "$HOME/.config/sway/scripts/rofi-clipboard"
    
    print_success "Scripts setup complete"
}

# Setup services
setup_services() {
    print_header "🔧 Setting Up Services"
    
    # Enable services
    local services=(
        "NetworkManager"
        "bluetooth"
    )
    
    for service in "${services[@]}"; do
        if systemctl is-enabled "$service" &> /dev/null; then
            print_status "$service is already enabled"
        else
            print_status "Enabling $service..."
            sudo systemctl enable "$service"
            sudo systemctl start "$service"
        fi
    done
    
    print_success "Services setup complete"
}

# Final setup
final_setup() {
    print_header "🎉 Final Setup"
    
    # Rebuild font cache
    print_status "Rebuilding font cache..."
    fc-cache -fv
    
    # Set shell to nushell
    if command -v nu &> /dev/null; then
        if ask_yes_no "Set Nushell as default shell?"; then
            if ! grep -q "$(which nu)" /etc/shells; then
                echo "$(which nu)" | sudo tee -a /etc/shells
            fi
            chsh -s "$(which nu)"
            print_success "Default shell changed to Nushell"
        fi
    fi
    
    # Install Neovim plugins
    if command -v nvim &> /dev/null; then
        print_status "Installing Neovim plugins..."
        nvim --headless "+Lazy! sync" +qa
    fi
    
    print_success "Final setup complete"
}

# Completion message
completion() {
    print_header "✅ Installation Complete!"
    echo
    echo -e "${GREEN}Your Hyprland desktop environment is ready!${NC}"
    echo
    echo -e "${YELLOW}Next steps:${NC}"
    echo "  1. Reboot your system"
    echo "  2. Select Hyprland from your login manager"
    echo "  3. Enjoy your new desktop!"
    echo
    echo -e "${CYAN}Useful keybindings:${NC}"
    echo "  • Super + Enter: Open terminal"
    echo "  • Super + D: Application launcher"
    echo "  • Super + W: Change wallpaper"
    echo "  • Super + L: Lock screen"
    echo "  • Super + Print: Screenshot area"
    echo
    echo -e "${BLUE}Backup location: $BACKUP_DIR${NC}"
    echo -e "${BLUE}Log file: $LOG_FILE${NC}"
    echo
    echo -e "${PURPLE}Thank you for using this installer! 🎨${NC}"
}

# Main installation function
main() {
    check_root
    welcome
    update_system
    install_core_packages
    install_flatpaks
    setup_configs
    setup_scripts
    setup_services
    final_setup
    completion
}

# Error handling
trap 'print_error "Installation failed at line $LINENO"' ERR

# Run main function
main "$@"
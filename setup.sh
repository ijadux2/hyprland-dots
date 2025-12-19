#!/usr/bin/bash 

echo "installation of hyprland config powerd by ijadux2"

# making folders 
mkdir -p ~/.config/hypr/
mkdir -p ~/.config/kitty 
mkdir -p ~/.config/waybar 
mkdir -p ~/.config/swaync 
mkdir -p ~/Pictures/wallpapers/ 


# organising the directories for startup 
cp -r ./hypr/* ~/.config/hypr/
cp -r ./wallpapers/* ~/Pictures/wallpapers/ 
cp -r ./swaync/* ~/.config/swaync/ 
cp -r ./waybar/* ~/.config/waybar/ 
cp -r ./kitty/* ~/.config/kitty/ 
cp -r ./zsh/* ~

echo "restart you machine ! "

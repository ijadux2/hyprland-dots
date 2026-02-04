#!/usr/bin/bash 

echo "installation of hyprland config powerd by ijadux2"

# making folders 
mkdir -p ~/.config/hypr/
mkdir -p ~/.config/kitty 
mkdir -p ~/.config/waybar 
mkdir -p ~/.config/swaync 
mkdir -p ~/Pictures/wallpapers/
mkdir -p ~/.config/nushell/


# organising the directories for startup 
cp -r ./hypr/* ~/.config/hypr/
cp -r ./wallpapers/* ~/Pictures/wallpapers/ 
cp -r ./swaync/* ~/.config/swaync/ 
cp -r ./waybar/* ~/.config/waybar/ 
cp -r ./kitty/* ~/.config/kitty/ 
cp ./starship.toml ~/.config/ 

sleep 1

echo "reqire oh-my-zsh for zsh-shell for setup"
read -p "need my config y,n >> " ans 

if [[ $ans == y ]]; then
  command cp -r ./zsh/.zshrc ~ 
else
  command echo "moving forward to nushell !"
  cp -r ./nushell/* ~/.config/nushell/
fi

echo "restart you machine ! "

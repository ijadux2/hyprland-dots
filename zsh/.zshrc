# fetches and setup commands
#fastfetch
#export PS1="%{%F{243}%}%n%{%F{245}%}@%{%F{249}%}%m %{%F{254}%}%1~ %{%f%}$ "

export ZSH="$HOME/.oh-my-zsh"
#ZSH_THEME="agnoster"
plugins=(git
  sudo
  zoxide
  starship
)
source $ZSH/oh-my-zsh.sh
# TERMINAL
export TERMINAL=kitty
export VISUAL=$TERMINAL
# EDITOR
export EDITOR=nvim
export VISUAL="$EDITOR"

# alias
alias i="sudo dnf install"
alias r="sudo dnf remove"
alias ch="chmod +x *"
alias rm="rm -rf"
alias v="nvim"
alias x="clear"
alias ls="eza --icons"
alias lt="eza --tree --icons"
alias cd="z"
alias code="opencode"
alias mk="mkdir"
alias t="touch"
alias y="yazi"
alias th="thunar ."
alias :q="exit"
alias gi="git add *"
alias gc="git commit -m "
alias gs="git status"
alias open="xdg-open"
alias cm="cmatrix"
alias gt="cd ~/git/"
alias fa="fastfetch"
alias vi="vim"
alias ai="ollama-chat"
alias jadu="ollama run jadu:coder"

# plugins for zsh
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# paths 
 export PATH="$HOME/.luarocks/bin:$PATH"
export PATH=/home/jadu/.nimble/bin:$PATH
export PATH="$PATH:/home/jadu/.local/bin"
export PATH=/home/jadu/.opencode/bin:$PATH
. /home/jadu/.nix-profile/etc/profile.d/nix.sh
if [ -e /home/jadu/.nix-profile/etc/profile.d/nix.sh ]; then . /home/jadu/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
bindkey -v

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

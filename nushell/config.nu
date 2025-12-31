source ~/.config/nushell/catppuccin_mocha.nu 
$env.config.show_banner = false
$env.config.buffer_editor = 'nvim'
mkdir ($nu.data-dir | path join "vendor/autoload")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")

$env.TRANSIENT_PROMPT_COMMAND = "❯ "
#$env.config.table.mode = "markdown" 

# vi mode 
#$env.config.edit_mode = 'vi'

#fetch

# alias's 
alias cb = cbonsai -l -M 2
alias mk = mkdir
alias x = clear 
alias v = nvim 
alias th = thunar 
alias :q = exit 
alias i = sudo dnf install 
alias r = sudo dnf remove 
alias ch = chmod +x * 
alias rm = rm -rf 
alias lt = eza --icons --tree  
alias cd = z 
alias code = opencode 
alias t = touch 
alias y = yazi
alias gi = git add * 
alias gc = git commit -m 
alias gs = git status
alias gh = flatpak run io.github.shiftey.Desktop
alias open = xdg-open 
alias cm = cmatrix 
alias la = fetch 
alias vi = vim
alias ai = ollama run jadu:coder 

# time 
export-env { $env.LANG = "C.utf8"; $env.LC_ALL = "C.utf8" }

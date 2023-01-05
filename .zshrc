# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
source /home/server/.p10k.zsh
ZSH_THEME="powerlevel10k/powerlevel10k"

# Lines configured by zsh-newuser-install
HISTFILE=/home/server/.histfile
HISTSIZE=10000
SAVEHIST=100000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/server/.zshrc'

autoload -Uz compinit
compinit
autoload -Uz promptinit
promptinit

# End of lines added by compinstall

# Some useful aliases for traversing the file system
alias ls="ls --color=auto"
alias ll="ls -l"
alias la="ls -l -a"
alias c1="cd .."
alias c2="cd ../.."
alias c3="cd ../../.."
alias c4="cd ../../../.."

# git aliases
alias gclone="git clone"
alias gadd="git add -A && git status"
alias gstat="git status"
alias gcomm="git commit -m"
alias gpush="git push"
alias gpull="git pull"

# eyecandy aliases
alias lolfortune="{fortune | cowsay -f tux} | lolcat"
alias andsoitbegins="cat /home/server/motd.txt | lolcat"

# productivity aliases
alias mountusb="udisksctl mount -b"
alias umountusb="udisksctl unmount -b"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
#[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Sleep to wait for aliases and color rendering
sleep 2

echo ""
echo ""
echo "The sudo password is 'lan'. Enter, if ready."
cd /home/server/Server/LAN-party-server
sudo /home/server/Server/LAN-party-server/start.sh

andsoitbegins
screenfetch
lolfortune

prompt elite2 yellow


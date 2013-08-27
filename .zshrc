HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd nobeep extendedglob no_bad_pattern no_nomatch notify print_exit_value

### COMPLETIONS ###
zstyle :compinstall filename '/home/user/.zshrc'
autoload -Uz compinit
compinit
# case-insensitive (uppercase from lowercase) completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# process completion
zstyle ':completion:*:processes' command 'ps -au$USER'
zstyle ':completion:*:*:kill:*:processes' list-colors "=(#b) #([0-9]#)*=36=31"
# zstyle
zstyle ':completion:*' completer _expand _complete _ignored
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' menu select=2
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
zstyle ':completion:*:descriptions' format '%U%F{yellow}%d%f%u'
source "$HOME/.rbenv/completions/rbenv.zsh"


###  KEYS SETUP  ###
bindkey -e
# bind special keys according to readline configuration
eval "$(sed -n 's/^/bindkey /; s/: / /p' /etc/inputrc)"
bindkey "^[[A" history-search-backward
bindkey "^[[B" history-search-forward
bindkey '^i' expand-or-complete-prefix
autoload -U select-word-style
select-word-style bash


### SHELL PROMPT ### # ⊞⊠⊙§¢¥€∞®∑ϴΦΩΞΨαγλμπ○◧◯◉●►▻▷▸▹▩▧▨▦▶▗▚▖▒
autoload -U promptinit && promptinit
autoload -U colors && colors
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable svn git
zstyle ':vcs_info:*' check-for-changes true
# zstyle ':vcs_info:*' get-revision true
zstyle ':vcs_info:*' stagedstr "+"
zstyle ':vcs_info:*' unstagedstr "!"
zstyle ':vcs_info:*' formats '%s:%b%F{blue}%c%u'
setopt PROMPT_SUBST
function precmd {
    vcs_info
    [[ -e `which acpi` ]] && export BAT=$(acpi|awk '{sub("Charging,","^",$3);sub("Full,","=",$3);sub("Unknown,","~",$3);sub("Discharging,","v",$3);sub(",","",$4);sub("%","%%",$4);print $3$4}')
}
function prompt_char {
    git branch >/dev/null 2>/dev/null && echo '±' && return
    hg root >/dev/null 2>/dev/null && echo '☿' && return
    echo '○'
}
case $(hostname) in
  "laptop.aguzik.net" )  export HOSTCOLOR="white" ;;
  "oak.aguzik.net" )     export HOSTCOLOR="blue"  ;;
  "firefly.aguzik.net" ) export HOSTCOLOR="blue"  ;;
  "work.aguzik.net" )    export HOSTCOLOR="green" ;;
  * )                    export HOSTCOLOR="red"   ;;
esac
case $(whoami) in
  "me" ) export USERCOLOR="white" ;;
  "root" ) export USERCOLOR="red" ;;
  * ) export USERCOLOR="green"
esac
export PS1="%F{$HOSTCOLOR}%T %B%F{cyan}%~%F{cyan}[%F{white}\${vcs_info_msg_0_}%F{cyan}] %F{$USERCOLOR}%(!.®.o)%b%f "
export RPS1="%B%F{white} \$BAT %F{$USERCOLOR}%n%f@%F{$HOSTCOLOR}%m%f%b"

#tabs -4
TERM=linux setterm -regtabs 4

### ENVIRONMENT AND STARTUP ###
# .zprofile -> at login
###############################

disable r
alias r='zeus'

alias be='bundle exec'
alias lores='xrandr --size 1280x720'
alias hires='xrandr --size 1920x1080'

alias ls='ls --color=auto'
alias l='ls -l'
alias la='ls -la'
alias man='w3mman'
alias sys='sudo systemctl'
alias gti='git'
alias vmi='vim'
alias v='vim'
alias suvim='sudo vim'
alias p='ps xf'
alias pa='ps axf'
alias s='screenlog'

alias du1='du -d 1 -h|sort -h'
alias du2='du -d 2 -h|sort -h'
alias du3='du -d 3 -h|sort -h'

alias ..2='cd ../..'
alias ..3='cd ../../..'
alias ..4='cd ../../../..'
alias ..5='cd ../../../../..'
alias ..6='cd ../../../../../..'
alias ..7='cd ../../../../../../..'
alias ..8='cd ../../../../../../../..'
alias ..9='cd ../../../../../../../../..'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias .......='cd ../../../../../..'
alias ........='cd ../../../../../../..'
alias .........='cd ../../../../../../../..'
alias ..........='cd ../../../../../../../../..'

alias ga='git add -A'
alias ga.='git add -A .'
alias grm='git rm'
alias gc='git commit'
alias gca='git commit --amend'
alias gco='git checkout'
alias gb='git branch'
alias gdiff='git diff'
alias ggrep='git grep'
alias gstag='git diff --staged'
alias gstash='git stash'
alias gpull='git pull'
alias gf='git fetch'
alias gm='git merge'
alias gff='git merge --ff-only'
alias gfff='git fetch && git merge --ff-only'
alias gr='git rebase'
alias gpull='git pull'
alias grl='git reflog'
alias greset='git reset'
alias gri='git rebase --interactive'
alias grc='git rebase --continue'
alias grs='git rebase --skip'
alias gra='git rebase --abort'
alias gclone='git clone'
alias gpush='git push'
alias gs='git status'
alias gst='git status'
alias gst.='git status .'
alias glg='git lg'
alias gl='git log'
alias gg='git grep'
alias ggui='git gui'
alias gunstage='git reset HEAD'

alias pmount='udisksctl mount -b'
alias pumount='udisksctl unmount -b'

source "$HOME/p/fork/z/z.sh"
# cat "$HOME/Documents/todo.org"

HOST_ONLY="$HOME/.zshrc.$(hostname -s)"
[ -e "${HOST_ONLY}" ] && . "${HOST_ONLY}"

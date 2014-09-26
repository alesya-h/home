HISTFILE=~/.histfile
HISTSIZE=1000000
SAVEHIST=1000000
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
alias r='$(git exec pwd)/bin/rails'
alias rr='$(git exec pwd)/bin/rake'
alias rs='$(git exec pwd)/bin/rspec'
alias be='bundle exec'
alias cap='bundle exec cap'

alias ls='ls --color=auto'
alias l='ls -lh'
alias la='ls -lah'

alias mc='LANG=en_US.UTF-8 mc'

alias pmount='udisksctl mount -b'
alias pumount='udisksctl unmount -b'

alias sys='sudo systemctl'
alias dmesg='dmesg -H -w -l info'

alias vmi='vim'
alias v='vim'
alias suvim='sudo vim'
alias cp='cp --reflink=auto'

alias p='ps -o pid,pcpu,cmd xf'
alias pa='ps -o user,pid,pcpu,cmd axf'

alias w='wicd-curses'
alias pi='ping 8.8.8.8'
alias lnc='nc localhost'

alias du1='du -d 1 -h|sort -h'
alias du2='du -d 2 -h|sort -h'
alias du3='du -d 3 -h|sort -h'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias .......='cd ../../../../../..'
alias ........='cd ../../../../../../..'
alias .........='cd ../../../../../../../..'
alias ..........='cd ../../../../../../../../..'

alias ga.='git add -A .'
alias ga='git add -A'
alias gb='git branch'
alias gc='git commit'
alias gca='git commit --amend'
alias gclean='git clean -f'
alias gclone='git clone'
alias gco.='git checkout .'
alias gco='git checkout'
alias gdiff='git diff'
alias gf='git fetch'
alias gff='git merge --ff-only'
alias gfff='git fetch && git merge --ff-only'
alias gg='git grep'
alias ggrep='git grep'
alias ggui='git gui'
alias gim='git imerge'
alias gl='git log'
alias glg='git lg'
alias glgr='(glg;echo)|tac|sed "s/\\\\/\`/g; s/\//\\\/g; s/\`/\//g;"'
alias gm='git merge'
alias gmw='git merge -Xignore-all-space'
alias gpull='git pull'
alias gpull='git pull'
alias gpush='git push'
alias gr='git rebase'
alias gra='git rebase --abort'
alias grc='git rebase --continue'
alias grh='git reset --hard'
alias gri='git rebase --interactive'
alias grl='git reflog'
alias grm='git rm'
alias grs='git reset --soft'
alias gs='git status'
alias gst.='git status .'
alias gst='git status'
alias gstag='git diff --staged'
alias gstash='git stash'
alias gstu='git status -uno'
alias gti='git'
alias gunstage='git reset HEAD'

source "$HOME/p/fork/z/z.sh"
# cat "$HOME/Documents/todo.org"

HOST_ONLY="$HOME/.zshrc.$(hostname -s)"
[ -e "${HOST_ONLY}" ] && . "${HOST_ONLY}"

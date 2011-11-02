# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd beep extendedglob nomatch notify
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/user/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall


# bind special keys according to readline configuration
eval "$(sed -n 's/^/bindkey /; s/: / /p' /etc/inputrc)"
bindkey "^[[A" history-search-backward
bindkey "^[[B" history-search-forward
bindkey '^i' expand-or-complete-prefix

autoload -U promptinit && promptinit
autoload -U colors && colors

autoload -U select-word-style
select-word-style bash

#hg_branch() {
#    hg branch 2> /dev/null | awk '{ print "[hg:" $1 }'
#}

#hg_dirty() {
#    [ $(hg status 2> /dev/null | wc -l) != 0 ] && echo -e "%F{red}*%F{green}]"
#    [ $(hg status 2>&1 | wc -l) = 0 ] && echo -e "]"
#}

autoload -Uz vcs_info
zstyle ':vcs_info:*' enable svn git
zstyle ':vcs_info:*' check-for-changes true
# zstyle ':vcs_info:*' get-revision true
zstyle ':vcs_info:*' stagedstr "+"
zstyle ':vcs_info:*' unstagedstr "!"
zstyle ':vcs_info:*' formats '[%s:%b%F{red}%c%u%F{green}]'
setopt PROMPT_SUBST

precmd () { 
    vcs_info
    [[ -e `which acpi` ]] && export BAT=`acpi|awk '{sub("Charging,","^",$3);sub("Full,","=",$3);sub("Discharging,","v",$3);sub(",","",$4);sub("%","%%",$4);print $3$4}'`
#    HG_PROMPT_PART="$(hg_branch)$(hg_dirty)"
}

function prompt_char {
    git branch >/dev/null 2>/dev/null && echo '±' && return
    hg root >/dev/null 2>/dev/null && echo '☿' && return
    echo '○'
}

export PS1='%T %B%F{cyan}%~%F{green}${vcs_info_msg_0_}%f %(!.#.$)%b '
export RPS1='%{$fg_bold[black]%} $BAT %D{%a %d.%m} %n@%m%f%b'

source $HOME/login_general.sh
source $HOME/shell_general.sh

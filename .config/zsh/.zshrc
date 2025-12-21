# INFO: profile zsh - uncomment to enable
# zmodload zsh/zprof

# Prompt
# Enable Powerlevel10k instant prompt. Should stay close to the top of .zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# vi mode
bindkey -v
function zvm_config() {
  ZVM_LINE_INIT_MODE=$ZVM_MODE_INSERT
  ZVM_VI_INSERT_ESCAPE_BINDKEY=jj  # jj to vi mode
  # syncing system clipboard with zsh-vi-mode -> y to yank, gp to paste
  ZVM_SYSTEM_CLIPBOARD_ENABLED=true
  ZVM_CLIPBOARD_COPY_CMD=wl-copy
  ZVM_CLIPBOARD_PASTE_CMD=wl-paste
}

# antidote
zstyle ':antidote:bundle' use-friendly-names 'yes'
source '/usr/share/zsh-antidote/antidote.zsh'
antidote load

# bindings

# auto-suggestions
bindkey "^Y" autosuggest-execute

# substring-history-search
bindkey "^N" history-substring-search-up
bindkey "^P" history-substring-search-down

# opts

# cd with just the location without cd
setopt autocd
setopt cdablevars

# PATH
typeset -U path PATH
# rust
path=($CARGO_HOME/bin $path)

# go scripts/hyprls
path=($GOPATH/bin $path)

# js
source $ZDOTDIR/lazyload_nvm.zsh

# aliases
source $ZDOTDIR/.zsh_aliases.zsh

# To customize prompt, run `p10k configure` or edit $ZDOTDIR/.p10k.zsh.
[[ ! -f $ZDOTDIR/.p10k.zsh ]] || source $ZDOTDIR/.p10k.zsh

# INFO: profile zsh - uncomment to enable
# zprof > zprof.log

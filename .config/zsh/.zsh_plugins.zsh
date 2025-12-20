fpath+=( "$HOME/.cache/antidote/mattmc3/ez-compinit" )
source "$HOME/.cache/antidote/mattmc3/ez-compinit/ez-compinit.plugin.zsh"
fpath+=( "$HOME/.cache/antidote/zsh-users/zsh-completions/src" )
fpath+=( "$HOME/.cache/antidote/belak/zsh-utils/completion/functions" )
builtin autoload -Uz $fpath[-1]/*(N.:t)
compstyle_zshzoo_setup
fpath+=( "$HOME/.cache/antidote/belak/zsh-utils/history" )
source "$HOME/.cache/antidote/belak/zsh-utils/history/history.plugin.zsh"
fpath+=( "$HOME/.cache/antidote/romkatv/powerlevel10k" )
source "$HOME/.cache/antidote/romkatv/powerlevel10k/powerlevel10k.zsh-theme"
source "$HOME/.cache/antidote/romkatv/powerlevel10k/powerlevel9k.zsh-theme"
fpath+=( "$HOME/.cache/antidote/zdharma-continuum/fast-syntax-highlighting" )
source "$HOME/.cache/antidote/zdharma-continuum/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh"
fpath+=( "$HOME/.cache/antidote/zsh-users/zsh-autosuggestions" )
source "$HOME/.cache/antidote/zsh-users/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh"
fpath+=( "$HOME/.cache/antidote/zsh-users/zsh-history-substring-search" )
source "$HOME/.cache/antidote/zsh-users/zsh-history-substring-search/zsh-history-substring-search.plugin.zsh"
fpath+=( "$HOME/.cache/antidote/jeffreytse/zsh-vi-mode" )
source "$HOME/.cache/antidote/jeffreytse/zsh-vi-mode/zsh-vi-mode.plugin.zsh"

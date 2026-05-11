# ── Oh My Zsh ──────────────────────────────────────────────
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME=""
plugins=(git z fzf gh)
source $ZSH/oh-my-zsh.sh

# ── History ────────────────────────────────────────────────
HISTSIZE=50000
SAVEHIST=50000
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_SPACE
setopt SHARE_HISTORY

# ── Editor ─────────────────────────────────────────────────
export EDITOR=nano

# ── Aliases ────────────────────────────────────────────────
alias ll='ls -lah'
alias la='ls -A'
alias gs='git status'
alias gl='git log --oneline -15'
alias gd='git diff'
alias gco='git checkout'
alias ..='cd ..'
alias ...='cd ../..'
alias brewup='brew update && brew upgrade && brew cleanup'

# ── Brew prefix cache (avoid repeated subshell calls) ──────
_BREW_PREFIX="$(brew --prefix)"

# ── Shell Enhancements ─────────────────────────────────────
source "$_BREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$_BREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
source "$_BREW_PREFIX/share/zsh-history-substring-search/zsh-history-substring-search.zsh"
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# ── Starship prompt ────────────────────────────────────────
eval "$(starship init zsh)"

# ── Conda (lazy) ──────────────────────────────────────────
_conda_lazy_init() {
    unfunction conda 2>/dev/null
    __conda_setup="$('/Users/i/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
    if [ $? -eq 0 ]; then
        eval "$__conda_setup"
    else
        if [ -f "/Users/i/anaconda3/etc/profile.d/conda.sh" ]; then
            . "/Users/i/anaconda3/etc/profile.d/conda.sh"
        else
            export PATH="/Users/i/anaconda3/bin:$PATH"
        fi
    fi
    unset __conda_setup
    conda "$@"
}
conda() { _conda_lazy_init "$@" }

# ── Docker completions ─────────────────────────────────────
fpath=(/Users/i/.docker/completions $fpath)

# ── PATH ──────────────────────────────────────────────────
export PATH="/Users/i/.antigravity/antigravity/bin:$HOME/.local/bin:$PATH"

# ── Secrets ────────────────────────────────────────────────
[[ -f ~/.env.secrets ]] && source ~/.env.secrets

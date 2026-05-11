#!/bin/bash
set -e

echo "==> Installing zsh shell environment"

# ── Homebrew ───────────────────────────────────────────────
if ! command -v brew &>/dev/null; then
    echo "  Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    eval "$(/opt/homebrew/bin/brew shellenv 2>/dev/null || /usr/local/bin/brew shellenv 2>/dev/null)"
fi

# ── Oh My Zsh ─────────────────────────────────────────────
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "  Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# ── Brew packages ──────────────────────────────────────────
echo "  Installing brew packages..."
brew install starship fzf zsh-autosuggestions zsh-syntax-highlighting zsh-history-substring-search gh

# ── Conda ──────────────────────────────────────────────────
if [ ! -d "$HOME/anaconda3" ]; then
    echo "  Installing Miniconda..."
    curl -fsSL https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-arm64.sh -o /tmp/miniconda.sh
    bash /tmp/miniconda.sh -b -p "$HOME/anaconda3"
    rm /tmp/miniconda.sh
fi

# ── Deploy config files ────────────────────────────────────
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "  Deploying .zshrc..."
cp "$SCRIPT_DIR/.zshrc" ~/.zshrc

echo "  Deploying starship.toml..."
mkdir -p ~/.config
cp "$SCRIPT_DIR/starship.toml" ~/.config/starship.toml

# ── Secrets template ──────────────────────────────────────
if [ ! -f ~/.env.secrets ]; then
    echo "  Creating ~/.env.secrets template — edit it with your API keys!"
    cat > ~/.env.secrets <<'SECRETS'
# Add your API keys here
# export ANTHROPIC_API_KEY="your-key-here"
SECRETS
    chmod 600 ~/.env.secrets
fi

# ── Done ───────────────────────────────────────────────────
echo ""
echo "==> Done! Open a new terminal to activate."
echo "    Don't forget to edit ~/.env.secrets with your API keys."

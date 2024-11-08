# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"


if [[ ! -v ZSH_THEME ]]; then
  # ZSH_THEME="spaceship"
  # SPACESHIP_CHAR_PREFIX=""
  # SPACESHIP_CHAR_SUFFIX=" "
  # SPACESHIP_USER_SHOW="true"
  # SPACESHIP_SHOW_TIME="true"
  ZSH_THEME="powerlevel10k/powerlevel10k"
  # ZSH_THEME="minimal"
  # ZSH_THEME="pi"
fi

ZSH_CUSTOM="$HOME/.zsh-custom"
plugins=(git colorize macos)

source $ZSH/oh-my-zsh.sh

alias ta="tmux a"

if command -v exa 1>/dev/null 2>&1; then
  alias ls="exa"
  alias la="exa -la"
fi

function wttr()
{
    local request="wttr.in/Charlotte%20Dr%20San%20Jose%20CA?1qF"
    [ "$(tput cols)" -lt 125 ] && request+='n'
    curl -H --compressed "$request"
}

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Homebrew
if [[ "$(uname)" == "Darwin" && "$(uname -m)" == "arm64" ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [[ "$(uname)" == "Darwin" ]]; then
  eval "$(/usr/local/bin/brew shellenv)"
fi

# pyenv
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

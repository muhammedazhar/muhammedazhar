# --------------------------------------------------------------------------------
# Z-Shell Configuration File
# --------------------------------------------------------------------------------
# This file is used to configure the Zsh shell environment. It is a powerful shell
# with many features and customizations. This file is used to set up the shell
# environment, including setting PATH, environment variables, aliases, and more.

# Author: Muhammed Azhar
# Date: December 2024
# --------------------------------------------------------------------------------


# --------------------------------------------------------------------------------
# 1. Powerlevel10k Instant Prompt (Keep near the top)
# --------------------------------------------------------------------------------
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# --------------------------------------------------------------------------------
# 2. Oh My Zsh Setup
# --------------------------------------------------------------------------------
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting web-search)

source $ZSH/oh-my-zsh.sh

# --------------------------------------------------------------------------------
# 3. Global Environment Variables
# --------------------------------------------------------------------------------

# - Consolidate all PATH changes into one or a few blocks.
# - Remove or comment out lines you no longer need, or put them in a separate file.

# Example consolidated PATH
export PATH="/Library/TeX/texbin:$HOME/.scripts:/Users/muhammedazhar/bin:/usr/bin/make:$PATH"

# If you regularly need MAMP, uncomment and place here:
# if [ -d "/Applications/MAMP/Library/bin" ] && [ -d "/Applications/MAMP/bin/php/php8.2.0/bin" ]; then
#     export PATH="/Applications/MAMP/Library/bin:/Applications/MAMP/bin/php/php8.2.0/bin:$PATH"
# fi

# Language environment (set LANG if needed)
# export LANG=en_US.UTF-8

# Extra environment variables for CS50 library paths
export LIBRARY_PATH="/usr/local/lib:$LIBRARY_PATH"
export C_INCLUDE_PATH="/usr/local/include:$C_INCLUDE_PATH"
export LD_LIBRARY_PATH="/usr/local/lib:$LD_LIBRARY_PATH"
export DYLD_LIBRARY_PATH="/usr/local/lib:$DYLD_LIBRARY_PATH"

# OpenMP environment variables for COMP1680-CGV
export LDFLAGS="-L/opt/homebrew/opt/libomp/lib"
export CPPFLAGS="-I/opt/homebrew/opt/libomp/include"
export SLURM_CPU_PER_TASK=8

# --------------------------------------------------------------------------------
# 4. Aliases
# --------------------------------------------------------------------------------
alias make="bash /Users/muhammedazhar/.scripts/make.sh"

# Additional aliases (commented out MAMP or example aliases)
# alias php5=/Applications/MAMP/bin/php/php5.6.37/bin/php
# alias php7=/Applications/MAMP/bin/php/php7.2.8/bin/php
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# --------------------------------------------------------------------------------
# 5. Language/Package Manager Initializations
# --------------------------------------------------------------------------------

# rbenv initialization
eval "$(rbenv init -)"

# conda initialize
__conda_setup="$('/Users/muhammedazhar/.miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/muhammedazhar/.miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/muhammedazhar/.miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/muhammedazhar/.miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup

# --------------------------------------------------------------------------------
# 6. GPG and SSH Agent
# --------------------------------------------------------------------------------
gpg_init() {
    # Start GPG agent if not running
    if ! pgrep -x -u "${USER}" gpg-agent >/dev/null 2>&1; then
        gpg-connect-agent /bye >/dev/null 2>&1
    fi
    # Set GPG TTY
    export GPG_TTY=$(tty)
    # Update GPG agent with current TTY
    gpg-connect-agent updatestartuptty /bye > /dev/null
    # Set SSH to use GPG agent
    unset SSH_AGENT_PID
    if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
        export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
    fi
}

reload_gpg_agent() {
    gpg-connect-agent reloadagent /bye > /dev/null
}

# Initialize GPG on shell start
gpg_init

# Handy alias if GPG issues occur
alias fix-gpg='gpg_init && echo "GPG environment refreshed."'

# --------------------------------------------------------------------------------
# 7. Powerlevel10k Configuration
# --------------------------------------------------------------------------------
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

# --------------------------------------------------------------------------------
# 8. Additional (Commented/Optional) Settings
# --------------------------------------------------------------------------------

# # If you come from bash you might have to change your $PATH.
# # export PATH=$HOME/bin:/usr/local/bin:$PATH

# # Uncomment the following line to use case-sensitive completion.
# # CASE_SENSITIVE="true"

# # Uncomment the following line to use hyphen-insensitive completion.
# # HYPHEN_INSENSITIVE="true"

# # Uncomment one of the following lines to change the auto-update behavior
# # zstyle ':omz:update' mode disabled  # disable automatic updates
# # zstyle ':omz:update' mode auto      # update automatically without asking
# # zstyle ':omz:update' mode reminder  # just remind me to update when it's time
# # zstyle ':omz:update' frequency 13

# # Uncomment the following line to enable command auto-correction.
# # ENABLE_CORRECTION="true"

# # Uncomment the following line to display red dots whilst waiting for completion.
# # COMPLETION_WAITING_DOTS="true"

# # Uncomment the following line if you want to disable marking untracked files.
# # DISABLE_UNTRACKED_FILES_DIRTY="true"

# # Uncomment the following line to change the command execution timestamp format.
# # HIST_STAMPS="mm/dd/yyyy"

# # Unset or override custom folder for oh-my-zsh if needed
# # ZSH_CUSTOM=/path/to/new-custom-folder

# # Additional manual environment variables or custom commands can go here.

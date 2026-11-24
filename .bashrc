# === STARTUP ===
# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# === SHELL OPTS ===
# See bash(1) for more options
HISTCONTROL=ignoreboth  # ignore redundant history entries
HISTSIZE=1000
HISTFILESIZE=2000

# Append to the history file, don't overwrite it
shopt -s histappend

# Check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar
# ===============

# === SHELL DECORATION ===
# Set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# Make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# Enable color support of (regular) ls
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

# Catppuccin Mocha for the raw tty
if [ "$TERM" = "linux" ]; then
	printf %b '\e[40m' '\e[8]' # set default background to color 0 (base)
	printf %b '\e[37m' '\e[8]' # set default foreground to color 7 (text)
	printf %b '\e]P01e1e2e'    # black          -> base
	printf %b '\e]P8585b70'    # bright-black   -> surface2
	printf %b '\e]P1f38ba8'    # red            -> red
	printf %b '\e]P9eba0ac'    # bright-red     -> maroon
	printf %b '\e]P2a6e3a1'    # green          -> green
	printf %b '\e]PA94e2d5'    # bright-green   -> teal
	printf %b '\e]P3f9e2af'    # brown          -> yellow
	printf %b '\e]PBfab387'    # bright-brown   -> peach
	printf %b '\e]P489b4fa'    # blue           -> blue
	printf %b '\e]PCb4befe'    # bright-blue    -> lavender
	printf %b '\e]P5cba6f7'    # magenta        -> mauve
	printf %b '\e]PDf5c2e7'    # bright-magenta -> pink
	printf %b '\e]P689dceb'    # cyan           -> sky
	printf %b '\e]PE74c7ec'    # bright-cyan    -> sapphire
	printf %b '\e]P7cdd6f4'    # white          -> text
	printf %b '\e]PFbac2de'    # bright-white   -> subtext1
	clear
fi

export MANPAGER="/usr/bin/less -s -M +Gg"
export LESS_TERMCAP_mb=$'\e[1;31m'      # begin bold
export LESS_TERMCAP_md=$'\e[1;34m'      # begin blink
export LESS_TERMCAP_so=$'\e[01;45;37m'  # begin reverse video
export LESS_TERMCAP_us=$'\e[01;36m'     # begin underline
export LESS_TERMCAP_me=$'\e[0m'         # reset bold/blink
export LESS_TERMCAP_se=$'\e[0m'         # reset reverse video
export LESS_TERMCAP_ue=$'\e[0m'         # reset underline
export GROFF_NO_SGR=1                   # for konsole

eval "$(oh-my-posh init bash --config "$HOME/.config/oh-my-posh/powerlevel10k_catppuccin_mocha.omp.json")"
eval "$(oh-my-posh enable upgrade)"

# Zoxide support (better version of cd)
eval "$(zoxide init bash)"

# Catppuccin Mocha for Docker BuildKit (run=mauve, cancel/warning=yellow, error=red)
export BUILDKIT_COLORS="run=203,166,247:cancel=249,226,175:error=243,139,168:warning=249,226,175"

# Colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
# ========================

# === Cmd line QoL ===
# Alias definitions
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Path modifications
if [ -f ~/.bash_paths ]; then
    . ~/.bash_paths
fi

# Enable programmable completion features (you don't need to
# enable this, if it's already enabled in /etc/bash.bashrc and
# /etc/profile sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Neovim (editor) env vars
export EDITOR="nvim"
export NVIMRC="$HOME/.config/$EDITOR/init.lua"

# Nvm (Node.js) package management
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
# ====================

# === Crypto stuff ===
# Start gpg-agent if not already running
if ! pgrep -x -u "${USER}" gpg-agent &> /dev/null; then
   gpg-connect-agent /bye &> /dev/null
fi

# Set SSH to use gpg-agent (see 'man gpg-agent', section EXAMPLES)
unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
  # export SSH_AUTH_SOCK="/run/user/$UID/gnupg/S.gpg-agent.ssh"
  export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
fi

# Set GPG TTY as stated in 'man gpg-agent'
export GPG_TTY=$(tty)

# Refresh gpg-agent tty in case user switches into an X session
gpg-connect-agent updatestartuptty /bye > /dev/null
# =================

# Terminal multiplexing
if [[ -z "$ZELLIJ" ]]; then
    sessions=$(zellij list-sessions --short 2>/dev/null)
    if [[ -n "$sessions" ]]; then
        zellij attach "$(head -n 1 <<< "$sessions")"
    else
        zellij attach --create Environment
    fi
fi

# Display cool art
fastfetch

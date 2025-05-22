# ~/.profile: executed by Bourne-compatible login shells.

if [ "$BASH" ]; then
  if [ -f ~/.bashrc ]; then
    . ~/.bashrc
  fi
fi

mesg n || true

export EDITOR=nano # Support staff often prefer nano
alias ll='ls -alhF --color=auto'
alias lt='ls -lt --color=auto' # Sort by time, newest first
alias mycases='cd ~/cases && ls -lt'
alias kb='less ~/kb_articles/main_index.txt' # kb for knowledge base
alias checknet='ping -c 3 8.8.8.8 && echo "Internet OK" || echo "Internet connection issue!"'

# PATH="$HOME/bin:$HOME/.local/bin:$PATH"

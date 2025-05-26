# ~/.profile: executed by Bourne-compatible login shells.

if [ "$BASH" ]; then
  if [ -f ~/.bashrc ]; then
    . ~/.bashrc
  fi
fi

mesg n || true

export EDITOR=vim
alias ll='ls -alhF --color=auto'
alias lsa='ls -d .* --color=auto'
alias update='sudo apt update && sudo apt full-upgrade -y && sudo apt autoremove -y'
alias checkfw='sudo ufw status verbose'
alias myprocesses="ps auxf"

# PATH="$HOME/bin:$HOME/.local/bin:$PATH"

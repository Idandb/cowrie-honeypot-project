# ~/.profile for dev02 (Backend Developer)

if [ "$BASH" ]; then
  if [ -f ~/.bashrc ]; then
    . ~/.bashrc
  fi
fi

mesg n || true

export EDITOR=nano # Maybe dev02 prefers nano
export FLASK_APP=~/projects/project_gamma_backend/app.py
export FLASK_ENV=development

alias ll='ls -alhF --color=auto'
alias gamma_backend_run='cd ~/projects/project_gamma_backend && flask run --host=0.0.0.0'
alias gamma_test_all='cd ~/projects/project_gamma_backend && pytest'
alias dcup='docker-compose -f ~/projects/project_gamma_backend/docker-compose.dev.yml up -d'
alias dcdown='docker-compose -f ~/projects/project_gamma_backend/docker-compose.dev.yml down'

echo "dev02 - Project Gamma Backend Environment Loaded"
# PATH="$HOME/bin:$HOME/.local/bin:$PATH"


# ~/.profile

if [ "$BASH" ]; then
  if [ -f ~/.bashrc ]; then
    . ~/.bashrc
  fi
fi
echo "Welcome, Test User! Your lucky number today is $RANDOM"
export TEMP_DIR=/tmp/testuser_temp
alias c='clear'

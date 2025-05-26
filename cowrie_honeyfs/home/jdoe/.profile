# ~/.profile: executed by Bourne-compatible login shells.
if [ "$BASH" ]; then
  if [ -f ~/.bashrc ]; then
    . ~/.bashrc
  fi
fi
mesg n 
export EDITOR=nano
alias my_backup='rsync -avz /home/jdoe/documents/ /mnt/backup_drive/jdoe/'
export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64

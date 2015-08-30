eval "$(rbenv init -)"

if [ -f /Applications/MacVim.app/Contents/MacOS/Vim ]; then
  alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
  alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
fi

if [ -f ~/.bashrc ] ; then
    . ~/.bashrc
fi

export ORACLE_HOME=/usr/local/oracle/instantclient_11_2

if [ -n "$DYLD_LIBRARY_PATH" ]; then
DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:$ORACLE_HOME
else
DYLD_LIBRARY_PATH=$ORACLE_HOME
fi

export DYLD_LIBRARY_PATH
export PATH=$PATH:/Applications/MAMP/bin/php/php5.6.2/bin



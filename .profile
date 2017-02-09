##
# DELUXE-USR-LOCAL-BIN-INSERT
# (do not remove this comment)
##
echo $PATH | grep -q -s "/usr/local/bin"
if [ $? -eq 1 ] ; then
    PATH=$PATH:/usr/local/bin
    export PATH
fi
export PATH=${PATH}:${HOME}/Library/android-sdk-mac/tools
test -r /sw/bin/init.sh && . /sw/bin/init.sh

"alias tun= 'ssh -L3283:127.0.0.1:3283 -L5900:127.0.0.1:5900'"

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

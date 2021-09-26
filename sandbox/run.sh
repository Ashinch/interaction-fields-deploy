#!/bin/sh

# $1:    The target language Number:
#               - 1:    java
#               - 2:    python2
#               - 3:    python3
#               - 4:    javascript
#               - 5:    c
#               - 6:    c++
#
# $2:    The path to the source file in the container.

bin=
fullName=

# Loop read symbolic link.
#       $1:    Which bin
loopReadLink(){
    bin=`which $1`
    while [ -L "$1" ]; do
        bin=`readlink $bin`
    done
}

case $1 in
    # python2
    2)
        loopReadLink "python2"
        fullName=$2".py"
        mv $2 $fullName
        ;;

    # python3
    3)
        loopReadLink "python3"
        fullName=$2".py"
        mv $2 $fullName
        ;;

    # ...
    *)
        echo "Unsupported language";
        exit -1
        ;;
esac

# Call the sandbox runner as the commit user.
su commit -c "/commit/run $bin $fullName"
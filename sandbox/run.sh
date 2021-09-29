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

# Loop read symbolic link.
#       $1:    Which bin
getBin(){
    bin=`which $1`
    while [ -L "$1" ]; do
        bin=`readlink $bin`
    done
}

case $1 in
    # java
    1)
        getBin "javac"
        mv $2 "$2.java"
        compiler=$bin
        compilerArgs="$bin -d . $2.java"
        runner="${bin%/*}/java"
        runnerArgs="$runner -cp $CLASSPATH:${2%/*} -Djava.security.manager -Dfile.encoding=UTF-8 -Djava.security.policy==/etc/java_policy -Djava.awt.headless=true Main"
        ;;

    # python2
    2)
        getBin "python2"
        mv $2 "$2.py"
        compiler=
        compilerArgs=
        runner=$bin
        runnerArgs="$bin $2.py"
        ;;

    # python3
    3)
        getBin "python3"
        mv $2 "$2.py"
        compiler=
        compilerArgs=
        runner=$bin
        runnerArgs="$bin $2.py"
        ;;

    # C
    5)
        getBin "gcc"
        mv $2 "$2.c"
        compiler=$bin
        compilerArgs="$bin -O2 -w -std=c99 -lm -o $2 $2.c"
        runner=$2
        runnerArgs=
        ;;

    # C++
    6)
        getBin "g++"
        mv $2 "$2.c"
        compiler=$bin
        compilerArgs="$bin -O2 -w -std=c++11 -lm -o $2 $2.c"
        runner=$2
        runnerArgs=
        ;;

    # ...
    *)
        echo "Unsupported language";
        exit -1
        ;;
esac

# Is debug
if [ ! -z "$3" ]; then
    echo "compiler: $compiler"
    echo "compilerArgs: $compilerArgs"
    echo "runner: $runner"
    echo "runnerArgs: $runnerArgs"
fi

# If it needs to compile
if [ ! -z "$compiler" ]; then
    compileResult=`/commit/run -b $compiler -p "$compilerArgs"`
    if [ $? -ne 0 ]; then
        echo "Compile error: $compileResult"
        exit -1
    fi
fi

# If it needs to run arguments
if [ ! -z "$runnerArgs" ]; then
    su commit -c "/commit/run -s -b $runner -p '$runnerArgs'"
else
    su commit -c "/commit/run -s -b $runner"
fi
#!/bin/bash
if [ ! -d 'src' ] || [ ! -d 'target' ] || [ ! -f 'pom.xml' ]
then
    echo 'We appear to be in the wrong directory, this must be ran from the project root'
    echo $(dir)
    exit -1
fi
mvn package
java -jar target/java-asm-obfuscator-*.jar \
     --verbose \
     --keep com/github/jasmo/Bootstrap \
     --package com/github/jasmo \
     target/classes \
     target/result.jar
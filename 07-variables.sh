#!/bin/bash

#### Special variables ####
echo "ALL args passed to script: $@"
echo "Number of vars passed to script: $#"
echo "Script name: $0"
echo "Present directory: $PWD"
echo "who is running: $USER"
echo "Home directory of current user: $HOME"
echo "PID of this script: $$"
sleep 100 &m
echo "PID of recently exuted background process:$!"
echo: All args passed to script: $*"
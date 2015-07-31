#!/usr/bin/env bash

### Basic
alias ll="ls -alh --color=auto"

### Git
alias g="git"
alias gs="git status"
alias gm="git merge"
alias ga="git add && git status"
alias gau="git add . && git status"
alias gaa="git add -A && git status"
alias gc="git commit -m"
alias gfa="git fetch --all"
alias gps="git push"
alias gpl="git pull"
alias gk="gitk &"
alias gkall="gitk --all &"

### Vagrant
alias v="vagrant"
alias vup="vagrant up"
alias vssh="vagrant ssh"
alias vsus="vagrant suspend"
alias vst="vagrant global-status"

### Tool
alias edit="notepad++.exe"
alias editalias="edit ~/.bash_it/custom/hiephm.aliases.bash &"
alias composer="composer.phar"
alias sync="syncthing.exe"

### Remote
alias dev="ssh hiephm@dev"
alias snkrdev="ssh banksgroupsnkr@ced1.smartosc.com"
alias snkrtest="ssh banksgroupsnkrtest@ced1.smartosc.com"
alias jira="ssh root@jira.smartosc.com"

### n98-magerun
alias mcc="mag cache:clean"
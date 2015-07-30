#!/usr/bin/env bash

THEME_PROMPT_HOST='\H'

function git_prompt_info {
  GIT=false
  if [[ -f .git/HEAD ]]; then GIT=true
  elif which git &> /dev/null && [[ -n "$(git symbolic-ref HEAD 2> /dev/null)" ]]; then GIT=true
  fi
  
  if [[ "$GIT" = true ]]; then
    git_prompt_vars
    echo -e "${yellow}$SCM_BRANCH${reset_color}"
  fi
}

function git_prompt_vars {
  local ref=$(git symbolic-ref -q HEAD 2> /dev/null)
  if [[ -n "$ref" ]]; then
    SCM_BRANCH=${ref#refs/heads/}
  else
    ref=$(git describe --tags --exact-match 2> /dev/null)
    if [[ -n "$ref" ]]; then
      SCM_BRANCH="[${ref}]"
    else
      ref=$(git rev-parse HEAD)
      SCM_BRANCH="(${ref:0:7})"
    fi
  fi
  
  #GIT_HASH=$(git rev-parse HEAD 2>/dev/null)
}

function current_user {
  echo $(id -un)
}
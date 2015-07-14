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
    SCM_BRANCH=${SCM_THEME_BRANCH_PREFIX}${ref#refs/heads/}
  else
    ref=$(git describe --tags --exact-match 2> /dev/null)
    if [[ -n "$ref" ]]; then
      SCM_BRANCH=${SCM_THEME_TAG_PREFIX}${ref}
    else
      local commit_re='(^remotes/)?(.+-g[a-zA-Z0-9]+)$'
      local remote_re='^remotes/(.+)$'
      ref=$(git describe --tags --all --always 2> /dev/null)
      if echo "$ref" | grep -E ${commit_re} > /dev/null; then
        SCM_BRANCH=${SCM_THEME_COMMIT_PREFIX}${BASH_REMATCH[2]}
      elif echo "$ref" | grep -E ${remote_re} > /dev/null; then
        SCM_BRANCH=${SCM_THEME_REMOTE_PREFIX}${BASH_REMATCH[1]}
      fi
    fi
  fi
  
  #GIT_HASH=$(git rev-parse HEAD 2>/dev/null)
}
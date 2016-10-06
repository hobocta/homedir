#!/bin/bash

function _gitmultipull() {
  local cur
  COMPREPLY=()
  cur=${COMP_WORDS[COMP_CWORD]}
  case "$cur" in
    *)
    COMPREPLY=( $( compgen -W '-a --all -f --force' -- $cur ) );;
  esac

  return 0
}

complete -F _gitmultipull gitmultipull

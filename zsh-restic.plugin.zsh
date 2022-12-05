# Return immediately if restic is not found
if (( ! $+commands[restic] )); then
  return
fi

# If the completion file doesn't exist yet, we need to autoload it and
# bind it to `restic`. Otherwise, compinit will have already done that.
if [[ ! -f "$ZSH_CACHE_DIR/completions/_restic" ]]; then
  typeset -g -A _comps
  autoload -Uz _restic
  _comps[restic]=_restic
fi

restic generate --zsh-completion "$ZSH_CACHE_DIR/completions/_restic" &>/dev/null &|

#!/usr/bin/env zsh

# source local env vars
[[ -f ${0:h}/env_local.zsh ]] && source ${0:h}/env_local.zsh

# source secrets if available
[[ -f ${0:h}/env_secret.zsh ]] && source ${0:h}/env_secret.zsh

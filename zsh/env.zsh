#!/usr/bin/env zsh

export PATH="$HOME/.local/bin:$PATH"

# MacPorts Installer addition on 2017-12-10_at_23:48:31: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

export PATH=/opt/homebrew/bin:${PATH}

# Python
export PATH="$(brew --prefix)/opt/python@3.12/libexec/bin:$PATH"

# doom emacs
export PATH="$HOME/.emacs.d/bin:$PATH"
export DOOMDIR="$HOME/.config/doom"

# rust lang
export PATH="$HOME/.cargo/bin:$PATH"

# go lang
export PATH="$HOME/.cargo/bin:$PATH"

# local install directory
export SOFTWARE_PATH=${HOME}/local
export PATH=${SOFTWARE_PATH}/bin:${PATH}
export CPATH=${SOFTWARE_PATH}:${CPATH}
export LD_LIBRARY_PATH=${SOFTWARE_PATH}/lib:${LD_LIBRARY_PATH}
export DYLD_LIBRARY_PATH=${SOFTWARE_PATH}/lib:${DYLD_LIBRARY_PATH}
#export PYTHONPATH=${SOFTWARE_PATH}/lib:${PYTHONPATH}
#export PYTHONPATH=${SOFTWARE_PATH}/lib/python3.7/site-packages:${PYTHONPATH}

# boost
export Boost_DIR=/opt/local
export BOOST_ROOT=${Boost_DIR}

## library paths for my working directories
#export DYLD_LIBRARY_PATH=/Users/nick/physics/analysis/jet_analysis/build/install/lib:${DYLD_LIBRARY_PATH}
#export DYLD_LIBRARY_PATH=/Users/nick/physics/analysis/dijetcore/build/install/lib:${DYLD_LIBRARY_PATH}

## ROOT 6
export ROOTSYS=/opt/local/libexec/root6
export PATH=${ROOTSYS}/bin:${PATH}
#export PYTHONPATH=${ROOTSYS}/lib:${PYTHONPATH}
export LD_LIBRARY_PATH=${ROOTSYS}/lib:${LD_LIBRARY_PATH}
export DYLD_LIBRARY_PATH=${ROOTSYS}/lib:${DYLD_LIBRARY_PATH}

## and one quick one for eventStructure
export STARPICOPATH=${SOFTWARE_PATH}/include/eventStructuredAu

## pythia8
export PYTHIA8DIR=${SOFTWARE_PATH}

# fastjet
export FASTJETDIR=${SOFTWARE_PATH}

# torch
export TORCHDIR=${SOFTWARE_PATH}/torch
export TORCH_INSTALL_PREFIX=${TORCHDIR}
export PATH=${TORCHDIR}/bin:${PATH}

# roounfold
export ROOUNFOLD_PATH=${SOFTWARE_PATH}

# doom emacs
export PATH=~/.config/emacs/bin/:${PATH}

# source secrets if available
[[ -f ${0:h}/env_secret.zsh ]] && source ${0:h}/env_secret.zsh

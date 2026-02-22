#!/usr/bin/env zsh

#alias

#if type nvim > /dev/null 2>&1; then
#  alias vim='nvim'
#fi

alias vim="nvim"

export EDITOR=vim
alias ssh='ssh -Y'
alias ll='ls -lh --color=auto'
alias ls='ls -Fh --color=auto'
alias la='ls -lFha --color=auto'
alias root='root -l'
alias vi=vim
alias edit='open -a xcode'
alias tu='top -U nickelsey'
alias aqua='open -a aquamacs'
alias pycharm='open -a PyCharm'
alias sub='open -a sublime\ text'
alias atom='open -a atom'
alias vs='open -a Visual\ Studio\ Code'
alias zed='open -a Zed'
alias zcli='/Applications/Zed.app/Contents/MacOS/cli'
#alias emacs='emacs -nw'

# wayne state machines
alias rhic21='ssh nickelsey@rhic21.physics.wayne.edu'
alias rhic121='ssh -X -C nickelsey@rhic121.physics.wayne.edu'
alias rhic121IP='ssh -C nickelsey@141.217.131.36'
alias racf='ssh -Y -2 nelsey@racf-ssh'
alias wsugrid='ssh -X dx5412@warrior.grid.wayne.edu'
alias pdsf='ssh elsey@pdsf.nersc.gov'

# personal machines
alias einstein='ssh -X nick@192.168.86.112 -p 35464'
alias einstein-nb='ssh -N -p 35464 -L localhost:8888:localhost:8899 nick@192.168.86.112'
#alias einstein-tb='ssh -L 16006:127.0.0.1:6006 -p 35464 nick@192.168.86.112'
#alias einstein-nb='ssh -L 18888:127.0.0.1:8888 -p 35464 nick@192.168.86.112'
alias einstein-wan='ssh nick@71.147.47.57 -p 35464'
alias einstein-firefox='ssh -C2qTnN -D 8080 nick@71.147.47.57 -p 35464'
alias einstein-wan-tb='ssh -L 16006:127.0.0.1:6006 -p 35464 nick@71.147.47.57'
alias turing='ssh -o PubKeyAuthentication=no nicho@10.0.0.151'
alias turing2='ssh -X nick@192.168.68.69'
alias turing3='ssh -X nick@192.168.68.70'
# Linode serverus
alias ares_root='ssh -Y root@45.79.146.130'
alias ares='ssh -Y nick@45.79.146.130'
alias odin_root='ssh -Y root@66.175.208.172'
alias odin='ssh -Y nick@66.175.208.172'

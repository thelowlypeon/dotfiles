set -o vi

# ~/.bashrc: executed by bash(1) for non-login shells.
function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit, working directory clean" ]] && echo -e '*'
}
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1$(parse_git_dirty)/"
}

export PS1='\w[\[\033[0;33m\]$(parse_git_branch)\[\033[0m\]]$ '
#export LD_LIBRARY_PATH="$HOME/local/lib"
export PATH=~/.bin:$PATH #add local scripts to PATH
export PATH="/usr/local/bin:/usr/local/etc:/usr/local/sbin:~/bin:$PATH"
export PATH=/Library/Developer/Toolchains/swift-latest.xctoolchain/usr/bin:"${PATH}"
export EDITOR='vim'

function ttmux() {
    if tmux has-session -t "$1"; then 
        tmux attach-session -t $1
    else
        tmux new-session -s "$1"
    fi
}

alias cgrep='find . -type f -name "*.php" -print0 | xargs -0 grep'

#thanks andy!
alias graphp='grep -Er --color --include=*.php'
alias graprb='grep -Er --color --include=*.rb'

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

source ~/.bin/git-completion

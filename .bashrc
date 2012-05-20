# ~/.bashrc: executed by bash(1) for non-login shells.
function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo -e '\E[1;31m*'
}
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1$(parse_git_dirty)/"
}
export PS1='\w[\[\033[0;33m\]$(parse_git_branch)\[\033[0m\]]$ '
export LD_LIBRARY_PATH="$HOME/local/lib"
export PATH="$HOME/local/bin:$PATH"

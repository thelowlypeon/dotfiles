# My Dotfiles

A repo for my config files so I can easily jump to different machines and still have things work.

## Installation

Installation is made possible by [@bentomas](https://github.com/bentomas). He's awesome.

```
curl https://raw.githubusercontent.com/thelowlypeon/dotfiles/master/install.sh | bash
```

This will grab a modified version of his install script and pipe it into bash. The script will fetch all files in this repo, back up existing dotfiles, and mv the new ones.

To see what changes will be made, run the install script with the `--diff` option first. There are lots of [options](./install.sh#L51) available.

## My own personal install steps

1. Install environment: `curl https://raw.githubusercontent.com/thelowlypeon/dotfiles/master/install.sh | bash`
2. Install homebrew: `/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`
3. Update git: `brew install git`
4. Install tmux: `brew install tmux`

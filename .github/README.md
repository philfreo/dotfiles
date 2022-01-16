Using git to manage dotfiles 

Setup environment in a new computer:
- Make sure to have git installed
- `git clone --bare git@github.com:philfreo/dotfiles.git $HOME/.dotfiles`
- `alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'`
- `dotfiles checkout`
- `dotfiles config --local status.showUntrackedFiles no`

Now replace 'git' commands with 'dotfiles' commands.

See https://medium.com/toutsbrasil/how-to-manage-your-dotfiles-with-git-f7aeed8adf8b for more details.


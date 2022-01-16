Using git to manage dotfiles 

Setup environment in a new computer:
- Make sure to have git installed
- `git clone --bare https://github.com/philfreo/dotfiles.git $HOME/.dotfiles`
- `alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'`
- `dotfiles checkout`

Now replace 'git' commands with 'dotfiles' commands.

See https://medium.com/toutsbrasil/how-to-manage-your-dotfiles-with-git-f7aeed8adf8b for more details.


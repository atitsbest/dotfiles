DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

ln -sf $DIR/vimrc $HOME/.vimrc 
ln -sf $DIR/agignore $HOME/.agignore 
ln -sf $DIR/aliases $HOME/.aliases 
ln -sf $DIR/gemrc $HOME/.gemrc 
ln -sf $DIR/gitconfig $HOME/.gitconfig 
ln -sf $DIR/gitignore $HOME/.gitignore 
ln -sf $DIR/gitmessage $HOME/.gitmessage 
ln -sf $DIR/gvimrc $HOME/.gvimrc 
ln -sf $DIR/psqlrc $HOME/.psqlrc 
ln -sf $DIR/tmux.conf $HOME/.tmux.conf 
ln -sf $DIR/vimrc $HOME/.vimrc 
ln -sf $DIR/vimrc.bundles $HOME/.vimrc.bundles 
ln -sf $DIR/zlogin $HOME/.zlogin 
ln -sf $DIR/zshrc $HOME/.zshrc 

ln -sf $DIR/vim $HOME/.vim 
ln -sf $DIR/zsh $HOME/.zsh 

# Vundle installieren
if [ -d "~/.vim/bundle/vundle"  ]; then
    git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
fi


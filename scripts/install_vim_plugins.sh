rm -rf $HOME/.vim
mkdir -p $HOME/.vim/autoload
ln -s $HOME/office/pathogen.vim $HOME/.vim/autoload/pathogen.vim
mkdir -p $HOME/.vim/bundle
cd $HOME/.vim/bundle
git clone https://github.com/scrooloose/nerdtree.git
git clone https://github.com/bling/vim-bufferline
git clone https://github.com/airblade/vim-gitgutter.git
git clone https://github.com/scrooloose/syntastic.git
git clone https://github.com/ctrlpvim/ctrlp.vim
git clone https://github.com/easymotion/vim-easymotion.git
# git clone https://github.com/editorconfig/editorconfig-vim.git
git clone https://github.com/junegunn/goyo.vim.git
git clone https://github.com/plasticboy/vim-markdown.git
git clone https://github.com/reedes/vim-pencil.git
git clone https://github.com/tpope/vim-surround.git
git clone https://github.com/jelera/vim-javascript-syntax.git
git clone https://github.com/groenewege/vim-less.git

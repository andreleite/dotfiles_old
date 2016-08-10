mkdir -p ~/local
wget --no-check-certificate https://github.com/vim/vim/archive/v7.4.1977.tar.gz -O vim.tar.gz
tar -xvzf vim.tar.gz
cd vim-7.4.1977
./configure --prefix=$HOME/local
make
make install
cd
rm vim.tar.gz
rm -rf vim-7.4.1977

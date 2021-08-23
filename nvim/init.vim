" Refer to existing .vimrc
set runtimepath^=~/.vim runtimepath+=~/.vim/autoload
let &packpath=&runtimepath
source ~/.vimrc


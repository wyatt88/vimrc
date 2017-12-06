set nocompatible              " be iMproved, required
filetype on                   " required
set history=1000
syntax enable
set autoindent
set tabstop=4
set softtabstop=4
set number
set shiftwidth=4
set expandtab
set nobackup
set noswapfile
set ignorecase
set showmatch
set matchtime=1
set background=dark
colorscheme solarized
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936
set fileencoding=utf-8
" font
if has('gui_running')
    set background=light
else
    set background=dark
endif

let g:solarized_termcolors=256

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'fatih/vim-go'
Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'

Bundle 'chase/vim-ansible-yaml'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" YCM settings
let g:ycm_key_list_select_completion = ['', '']
let g:ycm_key_list_previous_completion = ['']
let g:ycm_key_invoke_completion = ''
let g:ycm_server_python_interpreter = '/usr/bin/python'

" UltiSnips setting
let g:UltiSnipsExpandTrigger="<Tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

au BufNewFile,BufRead *.yaml,*.yml so ~/.vim/yaml.vim

let g:ansible_options = {'ignore_blank_lines': 0}

autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

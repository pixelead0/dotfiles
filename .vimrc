"================== VUNDLE CONF ==========================
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"::::::::::::::::::    PLUGS      :::::::::::::::::::::::::::
Plugin 'fugitive.vim'
Plugin 'ctrlp.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'scrooloose/nerdTree'
map <C-n> :NERDTreeToggle<CR>
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'Yggdroot/indentLine'
Plugin 'jvanja/vim-bootstrap4-snippets'

" Track the engine.
 Plugin 'SirVer/ultisnips'
"
" " Snippets are separated from the engine. Add this if you want them:
"" Plugin 'honza/vim-snippets'
"
" " Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
 let g:UltiSnipsExpandTrigger="<tab>"
 let g:UltiSnipsJumpForwardTrigger="<c-b>"
 let g:UltiSnipsJumpBackwardTrigger="<c-z>"
"
" " If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetDirectories=["MySnippets", "UltiSnips"]
let g:UltiSnipsSnippetsDir ="~/.vim/MySnippets/"
autocmd BufRead,BufNewFile *.html.erb set filetype=html.eruby
autocmd BufRead,BufNewFile *.scss set filetype=css

Plugin 'JamshedVesuna/vim-markdown-preview'
let vim_markdown_preview_hotkey='<C-m>'

" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
filetype plugin on

"OPTIONAL This enables automatic indentation as you type.
filetype indent on

" OPTIONAL Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'

"FUZZY SEARCH ON WITH CTRLP 
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPLastMode'
let g:ctrlp_extensions = ['buffertag', 'tag', 'line', 'dir']
"::::::::.:..::::::::::.::::::::::::::::::::::::::::::::::::
  
  " All of your Plugins must be added before the following line
  call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"

"=================== GLOBAL CONF ===================
"
syntax on
set updatetime=100
"colorscheme colorsbox-material
"colorscheme smyck
"colorscheme basic-light
"colorscheme basic-dark
""colorscheme hybrid_reverse
"colorscheme industry
"colorscheme papaya
"colorscheme lucariox
"colorscheme macvim-light
set nu
set rnu
set clipboard=unnamed
set mouse=a
" Change leader to a comma because the backslash is too far away
" That means all \x commands turn into ,x
" The mapleader has to be set before vundle starts loading all 
" the plugins.
let mapleader=","
"set timeout timeoutlen=1500

inoremap ii <Esc>
"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

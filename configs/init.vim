:let packagedir = $VIM_PLUGIN_PATH
:let basedir = $VIM_BASE_PATH

let g:vimwiki_list = [
    \{'path': basedir . '/wiki/index.wiki'}
\]

" let &runtimepath.=','.string(packagedir)
let &runtimepath.=','.escape(expand('<sfile>:p:h'), '\,')
let g:loaded_python_provide=1
let g:python_host_prog = '/usr/local/bin/python2'

syntax on
filetype plugin indent on

call plug#begin(packagedir)

Plug 'vimwiki/vimwiki', { 'branch': 'dev' }
Plug 'scrooloose/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'leafgarland/typescript-vim'
Plug 'Quramy/tsuquyomi'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'Valloric/YouCompleteMe', {'do' : './install.py'}
Plug 'jpo/vim-railscasts-theme'
Plug 'vim-scripts/FuzzyFinder'
Plug 'vim-scripts/L9'
Plug 'junegunn/goyo.vim'
Plug 'yuttie/comfortable-motion.vim'
Plug 'tomasr/molokai'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'vim-airline/vim-airline'
Plug 'easymotion/vim-easymotion'
Plug 'ryanoasis/vim-devicons'
Plug 'airblade/vim-gitgutter'
Plug 'mxw/vim-jsx'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'vim-airline/vim-airline-themes'
Plug 'w0rp/ale'

call plug#end()

let g:jsx_ext_required = 0
autocmd FileType octave setlocal keywordprg=xterm\ -fa\ 'DejaVu\ Sans\ Mono:style=Book'\ -fs\ 12\ -geometry\ 80x50\ -e\ info\ octave\ --vi-keys\ --index-search

set lbr						" Enable line breaks
set showbreak=+++	" Wrap-broken line prefix
set textwidth=100	" Line wrap (number of cols)
set showmatch	    " Highlight matching brace
set visualbell	  " Use visual bell (no beeping)
set incsearch 		" Makes search act like search in modern browsers
set lazyredraw		" Don't redraw while executing macros (good performance config)
set foldcolumn=1  " Add a bit extra margin to the left
set ruler
set pastetoggle=<F2>
set background=dark
set autoread
set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines
" colorscheme railscasts
" colorscheme molokai
" colorscheme dracula
:set number
:set tabstop=2
:set shiftwidth=2
:set expandtab
:set hlsearch
set nobackup
set noswapfile
" set wildignore=*.swp,*.bak,*.pyc,*.class
:set hlsearch 
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
set t_Co=256
set backspace=2 " make backspace work like most other apps
let g:solarized_termcolors=256
let mapleader = ","
let g:airline#extensions#tabline#enabled = 1


"if &term =~ '^screen'
    " tmux knows the extended mouse mode
    "set ttymouse=xterm2
"endif
function! ToggleMouse()
    " check if mouse is enabled
    if &mouse == 'a'
        " disable mouse
        set mouse=
    else
        " enable mouse everywhere
        set mouse=a
    endif
endfunc
set mouse=a

" Key bindings
:nmap <Leader>m :call ToggleMouse()<CR>
:nmap <Leader>n :NERDTreeToggle<CR>
:nmap <Leader>df :Goyo<CR>
:nmap <Leader>b :FufBuffer<CR>
:nmap <C-n> :tabnew<CR>
:nmap <Leader>l :tabnext<CR>
nnoremap <leader>d "_d

" change editor line instead of actual line
nnoremap j gj
nnoremap k gk

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" remove search highlights"
nmap <silent> ,/ :nohlsearch<CR>

" edit file as sudo
cmap w!! w !sudo tee % >/dev/null

" learner mode
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

let g:WebDevIconsNerdTreeGitPluginForceVAlign = 0

" setup YCM to run on .
if !exists("g:ycm_semantic_triggers")
  let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers['typescript'] = ['.']

" Fast saving
nmap <leader>w :w!<cr>

" :W sudo saves the file 
" (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null

" A buffer becomes hidden when it is abandoned
set hid

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500
set colorcolumn=100

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <c-space> ?

" Close the current buffer
map <leader>bd :Bclose<cr>:tabclose<cr>gT
" Close all the buffers
map <leader>ba :bufdo bd<cr>

map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove 
map <leader>t<leader> :tabnext 

" Escape search with esc
nnoremap <silent> <Esc> :nohlsearch<Bar>:echo<CR>

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers 
try
 set switchbuf=useopen,usetab,newtab
 set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe
"normal! g'\"" | endif

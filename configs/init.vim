:let packagedir = $VIM_PLUGIN_PATH
:let basedir = $VIM_BASE_PATH

let g:vimwiki_list = [
    \{'path': '~/wiki/index.wiki'}
\]

" let &runtimepath.=','.string(packagedir)
let &runtimepath.=','.escape(expand('<sfile>:p:h'), '\,')
let g:loaded_python_provide=1
" let g:python_host_prog = '/usr/bin/python'
let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-tsserver', 'coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-yank', 'coc-prettier']

syntax on
filetype plugin indent on

call plug#begin(packagedir)

Plug 'vimwiki/vimwiki', { 'branch': 'dev' }
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-markdown'
Plug 'junegunn/goyo.vim'
Plug 'yuttie/comfortable-motion.vim'
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
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
Plug 'w0rp/ale'
Plug 'morhetz/gruvbox'
Plug 'vim-scripts/SyntaxRange'
Plug 'leafgarland/typescript-vim'
Plug 'ianks/vim-tsx'
Plug 'dikiaap/minimalist'
Plug 'altercation/vim-colors-solarized'
Plug 'liuchengxu/vim-which-key'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'pbrisbin/vim-mkdir'

call plug#end()

let g:jsx_ext_required = 0
autocmd FileType octave setlocal keywordprg=xterm\ -fa\ 'DejaVu\ Sans\ Mono:style=Book'\ -fs\ 12\ -geometry\ 80x50\ -e\ info\ octave\ --vi-keys\ --index-search

"set lbr						" Enable line breaks
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
set scrolloff=999
" colorscheme railscasts
" colorscheme molokai
" colorscheme dracula
" colorscheme gruvbox
colorscheme solarized
highlight Normal ctermbg=NONE
:set number
:set tabstop=2
:set shiftwidth=2
:set expandtab
:set hlsearch
set nobackup
set noswapfile
let g:comfortable_motion_friction = 80.0
let g:comfortable_motion_air_drag = 2.0
" set wildignore=*.swp,*.bak,*.pyc,*.class
:set hlsearch 
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
set t_Co=256
set backspace=2 " make backspace work like most other apps
let g:solarized_termcolors=256
let mapleader = ","
nnoremap <silent> <leader> :WhichKey ','<CR>
let g:airline#extensions#tabline#enabled = 1
let g:NERDTreeWinPos = "right"

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
nmap <Leader>mt :call ToggleMouse()<CR>
nmap <Leader>q :bd<CR>
nmap <Leader>nt :NERDTreeToggle<CR>
nmap <Leader>df :Goyo<CR>
nnoremap <leader>d "_d
:nnoremap <Leader>zz :let &scrolloff=999-&scrolloff<CR>

nmap <leader>fw :w!<cr>
nmap <Leader>fo :Files<CR>

" Close the current buffer
map <leader>bd :bd<cr>
" Close all the buffers
map <leader>ba :bufdo bd<cr>

" Escape search with esc
nnoremap <silent> <Esc> :nohlsearch<Bar>:echo<CR>

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Switch CWD to the directory of the open buffer
map <leader>dc :cd %:p:h<cr>:pwd<cr>

" Remap keys for gotos
nmap <silent> cgd <Plug>(coc-definition)
nmap <silent> cgy <Plug>(coc-type-definition)
nmap <silent> cgi <Plug>(coc-implementation)

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
vmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ca  <Plug>(coc-codeaction)
" Fix autofix problem of current line
" Show all diagnostics
nnoremap <silent> <leader>cdn  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <leader>cem  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <leader>ccs  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <leader>cso  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>css :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <leader>cj  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <leader>ck  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>cr  :<C-u>CocListResume<CR>
nmap <leader>cqf  <Plug>(coc-fix-current)
nmap <silent> crf <Plug>(coc-references)
" Remap for rename current word
nmap <leader>cr <Plug>(coc-rename)

" change editor line instead of actual line
" nnoremap j gj
" nnoremap k gk

nnoremap j jzz
nnoremap k kzz

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

" Specify the behavior when switching between buffers 
try
 set switchbuf=useopen,usetab,newtab
 set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe
"normal! g'\"" | endif

" add yaml stuffs
au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml foldmethod=indent
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab



"""" BEGIN COG CONFIG

" Better display for messages
set cmdheight=2

" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> for trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> for confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>

" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Use `:Format` for format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` for fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)


" Add diagnostic info for https://github.com/itchyny/lightline.vim
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status'
      \ },
      \ }




"""""" END COG CONFIG

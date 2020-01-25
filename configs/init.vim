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
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

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
Plug 'severin-lemaignan/vim-minimap'
Plug 'pbrisbin/vim-mkdir'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'pbogut/fzf-mru.vim'
Plug 'jreybert/vimagit'
Plug 'lifepillar/vim-solarized8'

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
set foldcolumn=1
set ruler
set pastetoggle=<F2>
set background=dark
set autoread
set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines
set scrolloff=999
set timeoutlen=500
" colorscheme railscasts
" colorscheme molokai
" colorscheme dracula
" colorscheme gruvbox
highlight Normal ctermbg=NONE
set number relativenumber
set nu rnu
set tabstop=2
set shiftwidth=2
set expandtab
set hlsearch
set nobackup
set noswapfile
let g:comfortable_motion_friction = 80.0
let g:comfortable_motion_air_drag = 2.0
" set wildignore=*.swp,*.bak,*.pyc,*.class
set hlsearch 
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
set t_Co=256
set backspace=2 " make backspace work like most other apps
let g:solarized_termcolors=256
let mapleader = ","
let g:airline#extensions#tabline#enabled = 1
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 0
let g:NERDTreeWinPos = "right"
let g:bookmark_auto_close = 1
let g:bookmark_auto_save = 1
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '>'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '^'
let g:gitgutter_sign_modified_removed = '<'
let g:gitgutter_override_sign_column_highlight = 1
let g:gitgutter_map_keys = 0

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

" ===========================
" Non-leader keybindings
" ===========================

nnoremap <silent> <leader> :WhichKey ','<CR>
nmap <C-p> :Files<CR>
" Escape search with esc
nnoremap <silent> <Esc> :nohlsearch<Bar>:echo<CR>
" move among buffers with Meta
map <M-k> :bnext<CR>
map <M-j> :bprev<CR>
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

nmap s <Plug>(easymotion-s2)

" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>


" ===========================
" Leader keybindings
" ===========================

call which_key#register(',', "g:which_key_map")
let g:which_key_map = {}

let g:which_key_map['w'] = { 'name': 'wiki' }
let g:which_key_map['h'] = { 'name': 'which_key_ignore' }
let g:which_key_map[','] = { 'name': 'which_key_ignore' }
let g:which_key_map['/'] = { 'name': 'which_key_ignore' }
let g:which_key_map['a'] = { 'name': 'which_key_ignore' }

let g:which_key_map['!'] = 'ripgrep'
nnoremap <Leader>!  :Rg!<cr>

let g:which_key_map['q'] = { 'name': 'close-buffer' }
nmap <Leader>q :bd<CR>

let g:which_key_map['n'] = { 'name': 'nerdtree' }
let g:which_key_map.n.t = 'Toggle nerdtree'
nmap <Leader>nt :NERDTreeToggle<CR>

let g:which_key_map['d'] = { 'name': 'display' }
let g:which_key_map.d.f = 'distraction-free'
nmap <Leader>df :Goyo<CR>

let g:which_key_map['f'] = { 'name': 'files' }
let g:which_key_map.f.w = 'Save file'
nmap <leader>fw :w!<cr>
let g:which_key_map.f.o = 'Find file'
nmap <Leader>fo :Files<CR>
let g:which_key_map.f.c = 'Change PWD to dir of current buffer'
map <leader>fc :cd %:p:h<cr>:pwd<cr>
let g:which_key_map.f.r = 'find-recent-file'
nnoremap <silent> <Leader>fr :FZFMru<CR>

let g:which_key_map['b'] = { 'name': 'buffers' }
let g:which_key_map.b.f = 'find buffer'
nmap <leader>bf :Buffers<CR>
let g:which_key_map.b.d = 'close current buffer'
map <leader>bd :bd<cr>
let g:which_key_map.b.a = 'close all buffers'
map <leader>ba :bufdo bd<cr>


let g:which_key_map['m'] = { 'name': 'misc' }
let g:which_key_map.m.t = 'Toggle mouse'
nmap <Leader>mt :call ToggleMouse()<CR>
let g:which_key_map.m.z = 'Toggle centering'
nnoremap <Leader>mz :let &scrolloff=999-&scrolloff<CR>
let g:which_key_map.m.p = 'Toggle paste mode'
map <leader>mp :setlocal paste!<cr>
let g:which_key_map.m.s = 'Toggle spell checking'
map <leader>ms :setlocal spell!<cr>

let g:which_key_map['g'] = { 'name': 'git' }
let g:which_key_map.g.n = 'git-next-hunk'
nmap <leader>gn :GitGutterNextHunk<cr>
let g:which_key_map.g.p = 'git-prev-hunk'
nmap <leader>gp :GitGutterPrevHunk<cr>
let g:which_key_map.g.a = 'git-stage-hunk'
nmap <leader>ga :GitGutterStageHunk<cr>
let g:which_key_map.g.u = 'git-undo-hunk'
nmap <leader>gu :GitGutterUndoHunk<cr>
let g:which_key_map.g.s = 'git-status'
nnoremap <leader>gs :Magit<CR>

let g:which_key_map['c'] = { 'name': 'coc actions' }
nmap <silent> <leader>cgd <Plug>(coc-definition)
nmap <silent> <leader>cgy <Plug>(coc-type-definition)
nmap <silent> <leader>cgi <Plug>(coc-implementation)

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
nnoremap <silent> <leader>cr  :<C-u>CocListResume<CR>
nmap <leader>cfc  <Plug>(coc-fix-current)
nmap <leader>cfa <Plug>(coc-codeaction)
nmap <silent> csr <Plug>(coc-references)
" Remap for rename current word
nmap <leader>cr <Plug>(coc-rename)

nnoremap <silent> <Leader>v+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>v- :exe "resize " . (winheight(0) * 2/3)<CR>

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

function! s:goyo_enter()
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status off
    silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  endif
  set number relativenumber
  set nu rnu
endfunction

function! s:goyo_leave()
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status on
    silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  endif
endfunction
autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

colorscheme solarized8

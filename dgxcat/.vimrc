syntax on
filetype plugin indent on
autocmd FileType python setlocal completeopt-=preview
set hls
nmap <F4> :set hls! <cr>

let &titlestring = "vim - " . expand("%:t")
if &term == "screen"
  set t_ts=^[k
  set t_fs=^[\
endif
if &term == "screen" || &term == "rxvt-unicode-256color"
  set title
endif

set expandtab
set showmatch
let python_highlight_all = 1

autocmd BufEnter,BufNew *.html setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab
autocmd FileType html setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab
autocmd FileType css setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab
autocmd FileType javascript setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab
autocmd FileType tex setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd BUfEnter,BufNew *.ts setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd BufEnter,BufNew *.md setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab
autocmd BufEnter,BufNew *.cpp setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab

set ruler
set clipboard=unnamed
:let mapleader = "\<Space>"

:nmap j gj
:nmap k gk

nnoremap <leader>d "_dd
vnoremap <leader>d "_dd

:set incsearch
:set ignorecase
:set smartcase
:set hlsearch

:nmap <C-e> :e#<CR>
:nmap <C-n> :bnext<CR>
:nmap <C-p> :bprev<CR>

:nmap ; :CtrlPBuffer<CR>

:nmap <C-b> :NERDTreeToggle<CR>

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

:let g:ctrlp_map = '<Leader>t'
:let g:ctrlp_match_window_bottom = 0
:let g:ctrlp_match_window_reversed = 0
:let g:ctrlp_custom_ignore = '\v\~$|\.(o|swp|pyc|wav|mp3|ogg|blend)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|__init__\.py'
:let g:ctrlp_working_path_mode = 0
:let g:ctrlp_dotfiles = 0
:let g:ctrlp_switch_buffer = 0

execute pathogen#infect()
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': ['*'],'passive_filetypes': ['html'] }
nnoremap <C-a> :SyntasticCheck<CR>

set backspace=indent,eol,start

vmap "+y :!xclip -f -sel clip
map "+p :r!xclip -o -sel clip

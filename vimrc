call plug#begin('~/.vim/plugged')

Plug 'mattn/emmet-vim'
Plug 'pangloss/vim-javascript'
Plug 'kchmck/vim-coffee-script'
Plug 'leafgarland/typescript-vim'
Plug 'Lokaltog/vim-easymotion'
Plug 'leafOfTree/vim-vue-plugin'
Plug 'bling/vim-airline'
Plug 'https://github.com/mkitt/tabline.vim.git'
Plug 'dense-analysis/ale'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'chrisbra/NrrwRgn'
Plug 'https://github.com/wesQ3/vim-windowswap'

if has('nvim')
  " Dark-powered Async completion (needs python3)
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" for vim 8 with python
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'

  " the path to python3 is obtained through executing `:echo exepath('python3')` in vim
  let g:python3_host_prog = "/usr/local/bin/python3"
endif

let g:deoplete#enable_at_startup = 1

" Function argument completion for Deoplete
Plug 'Shougo/neosnippet'
Plug 'vizio360/neosnippet-snippets'

" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif


call plug#end()


" forcing vim to save swap files in a specific folder
:set directory=$HOME/.vim/swapfiles//

"ALE config
let g:ale_fixers = {'javascript': ['prettier', 'eslint']}
let g:ale_javascript_prettier_options = '--single-quote --trailing-comma'
let g:ale_fix_on_save = 1

let mapleader = ","
let g:user_emmet_leader_key=','


nnoremap <Leader>f :Explore<CR>
" `gf` opens file under cursor in a new vertical split
nnoremap gf :vertical wincmd f<CR>


" Show file options above the command line
set wildmenu

" Don't offer to open certain files/directories
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png,*.ico
set wildignore+=*.pdf,*.psd
set wildignore+=node_modules/*,bower_components/*
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']


"powerline status bar
"let g:Powerline_symbols = 'fancy'
" show status bar always, even if only one window open
set laststatus=2


set t_Co=256
colorscheme jellybeans
"Tabline settings
hi TabLine      ctermfg=Black  ctermbg=Green     cterm=NONE
hi TabLineFill  ctermfg=Black  ctermbg=Green     cterm=NONE
hi TabLineSel   ctermfg=White  ctermbg=DarkBlue  cterm=NONE
"##############
syntax on
filetype plugin indent on
set tabstop=2
set shiftwidth=4
set expandtab
set relativenumber
set bs=2
set foldmethod=syntax
set foldnestmax=10
set nofoldenable
set foldlevel=2
set cmdheight=3


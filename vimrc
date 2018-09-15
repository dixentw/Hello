" VIM setting
" Dixen Cheng

let $LANG = 'en'
set langmenu=en     "set menu's language of gvim. no spaces beside '='
set nocompatible    " be iMproved

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

"------------------------------------------------------------------------------
" vim-plug setting
" https://github.com/junegunn/vim-plug
"------------------------------------------------------------------------------

call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'altercation/vim-colors-solarized'

" Full path fuzzy file, buffer, mru, tag, ... finder for Vim
Plug 'ctrlpvim/ctrlp.vim'

" Motion enhancement
Plug 'easymotion/vim-easymotion'

" Git wrapper for Vim
Plug 'tpope/vim-fugitive'

" Golang support for Vim
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }

Plug 'scrooloose/syntastic'

Plug 'Chiel92/vim-autoformat'

Plug 'mileszs/ack.vim'

Plug 'airblade/vim-gitgutter'

" All of your Plugins must be added before the following line
call plug#end()

"------------------------------------------------------------------------------
" General Settings
"------------------------------------------------------------------------------

filetype off          " necessary to make ftdetect work on Linux
syntax on
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins

" Set mouse
set mouse=a

set number relativenumber
" Show command line
set showcmd
set showmode
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:.

" Backups
set nobackup
set noswapfile


" Indent
set expandtab
set smarttab
set tabstop=4
set shiftwidth=4
set autoindent
set smartindent
set wrap
" Highlight search results
set hlsearch
" Makes search act like search in modern browsers
set incsearch
set laststatus=2
set backspace=2
set wildmenu

set cpo-=<
set wcm=<C-Z>

"set  foldmethod=indent
"set  foldnestmax=5
set formatoptions=mtcql
set scrolloff=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=

set encoding=utf-8
set clipboard=unnamed

autocmd FileType php setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120
autocmd FileType ruby setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120
autocmd FileType php setlocal tabstop=4 shiftwidth=4 softtabstop=4 textwidth=120
autocmd FileType yaml setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120
autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4 textwidth=120
autocmd FileType html,htmldjango,xhtml,haml setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=0
autocmd FileType sass,scss,css setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120


let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

set background=dark
let g:solarized_termcolors=256
let g:solarized_contrast = "high"
let g:solarized_termtrans=1
let g:solarized_visibility="normal"
colorscheme solarized
"------------------------------------------------------------------------------
" Key Mapping
"
" Commands                        Mode
" --------                        ----
" nmap, nnoremap, nunmap          Normal mode
" imap, inoremap, iunmap          Insert and Replace mode
" vmap, vnoremap, vunmap          Visual and Select mode
" xmap, xnoremap, xunmap          Visual mode
" smap, snoremap, sunmap          Select mode
" cmap, cnoremap, cunmap          Command-line mode
" omap, onoremap, ounmap          Operator pending mode
"------------------------------------------------------------------------------
map tn              :tabnext<CR>
map tp              :tabprev<CR>
map te              :tabnew 
map tc              :tabclose<CR>
map vs              :vsplit 
map gv              :bp<CR>
map gb              :bn<CR>
map <c-e>           :Explore<CR>

nmap <Tab>          :bn<CR>
nmap <S-tab>        :bp<CR>
nnoremap <A-J>      :m+<CR>==
nnoremap <A-K>      :m-2<CR>==
nnoremap <Space>    za

inoremap <A-J>      <Esc>:m+<CR>==gi
inoremap <A-K>      <Esc>:m-2<CR>==gi

vmap <Tab>          >gv
vmap <S-Tab>        <gv
vnoremap <A-J>      :m'>+<CR>gv=gv
    vnoremap <A-K>      :m-2<CR>gv=gv
vnoremap <Space>    zf

cmap <C-A>          <Home>
cmap <C-E>          <End>
cnoremap <C-B>      <Left>
cnoremap <C-D>      <Del>
cnoremap <C-F>      <Right>
cnoremap <C-N>      <Down>
cnoremap <C-P>      <Up>
cnoremap <Esc><C-B> <S-Left>
cnoremap <Esc><C-F> <S-Right>

"------------------------------------------------------------------------------
" vim-airline
"------------------------------------------------------------------------------
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#syntastic#enabled = 1

let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

"------------------------------------------------------------------------------
" vim-indent-guides
"------------------------------------------------------------------------------
let g:indent_guides_auto_colors = 0
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=233
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=236

"------------------------------------------------------------------------------
" CtrlP
"------------------------------------------------------------------------------
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_open_new_file = 'r'
let g:ctrlp_custom_ignore = '\v[\/](\.(git|hg|svn)|(vendor|bower_components|node_modules|__pycache__))$'

"------------------------------------------------------------------------------
" netrw
"------------------------------------------------------------------------------
let g:netrw_banner = 0
let g:netrw_liststyle = 3
" let g:netrw_winsize = 25
" let g:netrw_browse_split = 2
"------------------------------------------------------------------------------
" tagbar
"------------------------------------------------------------------------------
nnoremap <silent> <F9> :TagbarToggle<CR>

"------------------------------------------------------------------------------
" nerdtree
"------------------------------------------------------------------------------
map <F8> :NERDTreeToggle<CR>
let g:NERDTreeWinPos = "left"
let NERDTreeDirArrows = 1

"------------------------------------------------------------------------------
" syntastic
"------------------------------------------------------------------------------
let g:syntastic_python_python_exec = '/usr/local/bin/python3'
" let g:syntastic_ignore_files = ['\.py$']
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exe = '$(npm bin)/eslint'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_error_symbol = '❌'
let g:syntastic_style_error_symbol = '⁉️'
let g:syntastic_warning_symbol = '⚠️'
let g:syntastic_style_warning_symbol = '💩'
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': ['javascript'] }

"------------------------------------------------------------------------------
" AutoFormat
"------------------------------------------------------------------------------
let g:formatdef_eslint = '"SRC=eslint-temp-${RANDOM}.js; cat - >$SRC; eslint --fix $SRC >/dev/null 2>&1; cat $SRC | perl -pe \"chomp if eof\"; rm -f $SRC"'
let g:formatters_javascript = ['eslint']
"------------------------------------------------------------------------------
" YouCompleteMe
"------------------------------------------------------------------------------
let g:ycm_complete_in_comments = 1
set completeopt-=preview
let g:ycm_seed_identifiers_with_syntax = 1

"------------------------------------------------------------------------------
" Python-mode
"------------------------------------------------------------------------------
let g:pymode_python = 'python3'
let g:pymode_rope_completion = 0
let g:pymode_rope_complete_on_dot = 0
"let g:pymode_rope_completion_bind = '<C-k>'
let g:pymode_rope_goto_definition_bind = "<C-]>"
let g:pymode_lint_checkers = ['python', 'pyflakes', 'pep8']

"------------------------------------------------------------------------------
" jedi-vim
"------------------------------------------------------------------------------
let g:jedi#force_py_version = 3
let g:jedi#use_splits_not_buffers = "top"
let g:jedi#goto_definitions_command = "<C-]>"
let g:jedi#completions_command = "<C-k>"

"------------------------------------------------------------------------------
" vim-go
"------------------------------------------------------------------------------
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_fmt_experimental = 1
let g:go_fmt_command = "goimports"

"-----------------------------------
"ag with ack.vim
"-----------------------------------
let g:ackprg = 'ag --nogroup --column'

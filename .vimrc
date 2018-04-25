syntax on
set nocompatible

set backspace=indent,eol,start
let mapleader=','
set number relativenumber
set ruler
set cursorline
set wildmenu
" custom split line

"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

"--------visuals------------
set t_CO=256
set guifont=Sauce_Code_Pro_Nerd_Font_Complete:h12
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
set ts=2 sts=2 sw=2 expandtab
set lsp=2
set laststatus=2
set nobackup
set noswapfile

"---------Searching----------
set hlsearch
set incsearch

"---------Plugins-------------
call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'kern/vim-es7'
Plug 'tpope/vim-surround'
Plug 'rakr/vim-one'
Plug 'tpope/vim-unimpaired'
Plug 'junegunn/seoul256.vim'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'digitaltoad/vim-pug'
Plug 'dNitro/vim-pug-complete'
Plug 'ryanoasis/vim-devicons'
Plug 'tomtom/tlib_vim'
Plug 'tomtom/tcomment_vim'
Plug 'w0rp/ale'
Plug 'NLKNguyen/papercolor-theme'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'mattn/emmet-vim'
Plug 'michalliu/sourcebeautify.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'tpope/vim-fugitive'
Plug 'alvan/vim-closetag'
Plug 'valloric/MatchTagAlways'
Plug 'tyrannicaltoucan/vim-deep-space'
call plug#end()

"---------theme-------------
"colorscheme PaperColor
set background=dark
set termguicolors
colorscheme deep-space
hi VertSplit guibg=bg guifg=grey
set conceallevel=3
"---------Plugins options----
let g:fzf_files_options =
  \ '--preview "(coderay {} || cat {}) 2> /dev/null | head -'.&lines.'"'

let g:deepspace_italics=1

let g:ale_sign_error = '★'

let NERDTreeShowHidden=1
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'

let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1
let g:webdevicons_conceal_nerdtree_brackets = 1
let g:WebDevIconsNerdTreeAfterGlyphPadding = ''
let g:WebDevIconsUnicodeGlyphDoubleWidth = 1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
"---------ultisnips-----------
"let g:UltiSnipsExpandTrigger="<c-M>"

"---------jsx-----------------
let g:jsx_ext_required = 0

"---------matchTagAlways------
let g:mta_filetypes = {
  \ 'javascript.jsx': 1,
  \ 'html' : 1,
  \ 'xhtml' : 1,
  \ 'xml' : 1,
  \ 'jinja' : 1,
  \}

"---------closetag------------
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.js'
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.js'

"---------airline-------------
"let g:airline_theme='papercolor'
let g:airline_theme='deep_space'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

if !exists('g:airline_powerline_fonts')
  let g:airline#extensions#tabline#left_sep = ' '
  let g:airline#extensions#tabline#left_alt_sep = '|'
  let g:airline_left_sep          = '▶'
  let g:airline_left_alt_sep      = '»'
  let g:airline_right_sep         = '◀'
  let g:airline_right_alt_sep     = '«'
  let g:airline#extensions#branch#prefix     = '⤴' "➔, ➥, ⎇
  let g:airline#extensions#readonly#symbol   = '⊘'
  let g:airline#extensions#linecolumn#prefix = '¶'
  let g:airline#extensions#paste#symbol      = 'ρ'
  let g:airline_symbols.linenr    = '␊'
  let g:airline_symbols.branch    = '⎇'
  let g:airline_symbols.paste     = 'ρ'
  let g:airline_symbols.paste     = 'Þ'
  let g:airline_symbols.paste     = '∥'
  let g:airline_symbols.whitespace = 'Ξ'
else
  let g:airline#extensions#tabline#left_sep = ''
  let g:airline#extensions#tabline#left_alt_sep = ''
  " powerline symbols
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
  let g:airline_symbols.branch = ''
  let g:airline_symbols.readonly = ''
  let g:airline_symbols.linenr = ''
endif

"" Split
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

"---------Mappings------------

nmap <Leader>ev :tabedit $MYVIMRC<cr>
nmap <Leader><space> :nohlsearch<cr>

" highlight last inserted text
nnoremap gV `[v`]

"" Switching windows
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

"nerdtree
nmap <Leader>n :NERDTreeToggle<cr>

"maps
imap jj <esc>

"fzf

nmap <Leader>f :Files<cr>
"------------auto-commands-----

"auto source vimrc on save
augroup autosourcing
  autocmd!
  autocmd BufWritePost .vimrc source %
augroup END

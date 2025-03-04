" ~/.config/nvim/init.vim
" Neovim configuration

" Set data directories
set undodir=~/.config/nvim/undo
set directory=~/.config/nvim/swap
set backupdir=~/.config/nvim/backup

" Automatically install vim-plug if not present
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" --- Plugin Management with vim-plug ---
call plug#begin('~/.local/share/nvim/plugged')

" Development
Plug 'psf/black', { 'branch': 'stable' }
Plug 'fisadev/vim-isort'
Plug 'sheerun/vim-polyglot'          " Language pack
Plug 'tmhedberg/SimpylFold'          " Code folding for Python
Plug 'chiel92/vim-autoformat'        " Autoformat code
Plug 'dense-analysis/ale'            " Asynchronous lint engine
Plug 'tpope/vim-commentary'          " Comment stuff out
Plug 'tpope/vim-fugitive'            " Git integration
Plug 'airblade/vim-gitgutter'        " Git diff in the sign column

" UI Enhancements
Plug 'shaunsingh/solarized.nvim'
Plug 'vim-airline/vim-airline'       " Status line
Plug 'vim-airline/vim-airline-themes'
Plug 'yuttie/comfortable-motion.vim' " Smooth scrolling

" Navigation and Search
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'              " Fuzzy finding
Plug 'preservim/nerdtree'            " File explorer
Plug 'easymotion/vim-easymotion'     " Jump anywhere

" Productivity
Plug 'tpope/vim-surround'            " Manipulate surroundings
Plug 'windwp/nvim-autopairs'         " Auto-close pairs
Plug 'editorconfig/editorconfig-vim' " Honor editor config files

" Neovim-specific plugins
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'

call plug#end()

" --- Basic Editing Configuration ---

" General
let mapleader = " "
set backspace=indent,eol,start
set history=1000
set showcmd
set showmode
set autoread
set hidden

" User Interface
set laststatus=2
set ruler
set wildmenu
set wildmode=list:longest,full
set tabpagemax=40
set cursorline
set number
set relativenumber
augroup toggle_relative_number
  autocmd!
  autocmd InsertEnter * :setlocal norelativenumber
  autocmd InsertLeave * :setlocal relativenumber
augroup END
set noerrorbells
set visualbell
set background=dark
set title
set lazyredraw
set signcolumn=yes

" Indentation
set autoindent
filetype plugin indent on
set tabstop=4
set softtabstop=4
set shiftwidth=2
set expandtab
set nowrap

" Search
set incsearch
set hlsearch
set ignorecase
set smartcase
nnoremap n nzz
nnoremap N Nzz
nmap <silent> <leader>/ :nohlsearch<CR>

" Text Rendering
set encoding=utf-8
set linebreak
set scrolloff=3
set sidescrolloff=5
syntax enable

" Remove trailing whitespace automatically
augroup cleanup_group
  autocmd!
  autocmd BufWritePre * :%s/\s\+$//e
augroup END

" Highlight trailing whitespace
match ErrorMsg '\s\+$'

" --- Key mappings ---

" Save shortcut with leader w
noremap <Leader>w :w<CR>

" Python debugger shortcut
map <Leader>d otry:<CR>except BaseException as error:<CR>import pdb<CR>pdb.set_trace()<CR><ESC>

" Use space to toggle folds
nnoremap <space> za
vnoremap <space> zf

" Window navigation
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Force using hjkl
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Mouse support
set mouse=a

" Better line navigation
nnoremap j gj
nnoremap k gk

" Visual mode indentation
vnoremap < <gv
vnoremap > >gv

" Visual mode movements
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Jump to start and end of line using the home row keys
map H ^
map L $

" Quick buffer navigation
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>

" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" Neovim-specific settings
if has('nvim')
  " Enable terminal mode escape
  tnoremap <Esc> <C-\><C-n>

  " Terminal mode split navigation
  tnoremap <C-h> <C-\><C-n><C-w>h
  tnoremap <C-j> <C-\><C-n><C-w>j
  tnoremap <C-k> <C-\><C-n><C-w>k
  tnoremap <C-l> <C-\><C-n><C-w>l

  " Incremental substitute
  set inccommand=split
endif

" Load Neovim plugin configurations if available
if filereadable(expand("~/.config/nvim/lua/plugins.lua"))
  luafile ~/.config/nvim/lua/plugins.lua
endif

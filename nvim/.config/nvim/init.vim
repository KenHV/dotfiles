let mapleader=','

" Auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

" Plugins
call plug#begin(expand('~/.config/nvim/plugged'))
    Plug 'arcticicestudio/nord-vim'
    "Plug 'luochen1990/rainbow'
    Plug 'norcalli/nvim-colorizer.lua'
    Plug 'psliwka/vim-smoothie'
    Plug 'vim-airline/vim-airline'
    Plug 'lukas-reineke/indent-blankline.nvim'
    Plug 'sbdchd/neoformat'
call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
    \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
    \| PlugInstall --sync | q
    \| endif

" Colors and theming
syntax on
set termguicolors
set t_Co=256
set background=dark
colorscheme nord

hi Comment gui=italic cterm=italic
hi CursorLineNr gui=bold

" Changes to allow transparency
hi DiffAdd ctermbg=NONE guibg=NONE
hi DiffChange ctermbg=NONE guibg=NONE
hi DiffDelete ctermbg=NONE guibg=NONE
hi SignColumn ctermbg=NONE guibg=NONE
hi Normal ctermbg=NONE guibg=NONE
hi NonText ctermbg=NONE guibg=NONE

" General configs
filetype plugin indent on
set noerrorbells
set number relativenumber
set nowrap
set noswapfile nobackup nowritebackup
set undodir=~/.config/nvim/undodir
set undofile
set incsearch ignorecase smartcase hlsearch
set mouse=a
set scrolloff=3 sidescrolloff=15 sidescroll=1
set encoding=utf-8
set emoji
set title
set noshowcmd
set cursorline
set whichwrap+=<,>,[,],h,l
set hidden
set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=yes
set modeline

" Tabs
set shiftwidth=4
set softtabstop=4
set expandtab
function TabToggle()
    if &expandtab
        set shiftwidth=8
        set softtabstop=0
        set noexpandtab
    else
        set shiftwidth=4
        set softtabstop=4
        set expandtab
    endif
endfunction
nmap <F9> mz:execute TabToggle()<CR>'z

" Disable auto commenting
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
set formatoptions-=cro

" Use system clipboard
"set clipboard+=unnamedplus

"nnoremap c "_c
"nnoremap d "_d
"nnoremap x "_x
"vnoremap c "_c
"vnoremap d "_d
"vnoremap p "_dP

" Custom mappings
nmap <leader>q :bd<CR>
nmap <leader>r :so ~/.config/nvim/init.vim<CR>
nmap <leader>w :w<CR>
nmap <leader>x :noa w<CR>
nmap <leader>z :noa q!<CR>
nmap <S-Tab> :bprevious<CR>
nmap <Tab> :bnext<CR>
noremap <expr> <Down> (v:count == 0 ? 'gj' : 'j')
noremap <expr> <Up> (v:count == 0 ? 'gk' : 'k')
vmap <leader>s :sort iu<CR>
nnoremap ; :
vnoremap ; :

" Airline
let g:airline_theme='nord'
let g:airline_skip_empty_sections = 1
let g:airline_section_warning = ''
let g:airline_section_x=''
let g:airline_section_z = airline#section#create(['%3p%% ', 'linenr', ':%c'])
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_min_count = 2
let g:airline#extensions#tabline#fnamemod = ':t'

" Color highligher
lua require'colorizer'.setup()

" Rainbow parantheses
"let g:rainbow_active = 1

" Indent blankline
let g:show_end_of_line = 'true'

" Clear highlights with 2 Esc presses
noremap <silent><esc><esc> :<C-U>noh<CR><esc>

" Trim whitespaces
au BufWritePre * :%s/\s\+$//e
nnoremap <F2> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

" Return to last edit position when opening files
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

" Custom rules for projects and certain filetypes

"-- General
"-- Remap <Leader> to SPACE
let mapleader = " "
let maplocalleader = " "

syntax on

set number
set nocompatible
set termguicolors
set nohlsearch
set ruler
set nowrap
set noswapfile
set autoread
set ignorecase
set smartcase
set noerrorbells
set shiftwidth=2
set tabstop=2
set softtabstop=2
set expandtab
set autoindent
set scrolloff=8
set hidden
set signcolumn=yes
set splitright
set cmdheight=1
set relativenumber
set spell

filetype plugin indent on
filetype indent on
set backspace=indent,eol,start


"--- Load plugins
source ~/.vim/rcfiles/plugins.vim

"--- Source statusline
source ~/.vim/rcfiles/statusline.vim

source ~/.vim/rcfiles/nvim.vim

"--- Theme 
" set background=dark
colorscheme gruvbox
" colorscheme nord
" colorscheme tokyonight

" Review this
" hi Normal guibg=NONE ctermbg=NONE
" hi LineNr term=NONE
" hi SignColumn guibg=NONE ctermbg=NONE
" hi VertSplit guibg=NONE guifg='#444444' ctermbg=NONE
" hi StatusLine guibg=black guifg=white ctermbg=black

hi Normal guibg=none ctermbg=none
hi LineNr guibg=none ctermbg=none
hi Folded guibg=none ctermbg=none
hi NonText guibg=none ctermbg=none
hi SpecialKey guibg=none ctermbg=none
hi VertSplit guibg=none ctermbg=none
hi SignColumn guibg=none ctermbg=none
hi EndOfBuffer guibg=none ctermbg=none

hi DiagnosticSignHint guibg=none ctermbg=none
hi DiagnosticSignError guibg=none ctermbg=none
hi DiagnosticSignInfo guibg=none ctermbg=none
hi DiagnosticSignWarn guibg=none ctermbg=none

"-- Formatting
let g:neoformat_try_node_exe = 1

let useformatting=1

if useformatting
    autocmd BufWritePre *.md Neoformat
    autocmd BufWritePre *.js Neoformat
    autocmd BufWritePre *.jsx Neoformat
    autocmd BufWritePre *.ts Neoformat
    autocmd BufWritePre *.tsx Neoformat
    autocmd BufWritePre *.html Neoformat
endif


command! ToggleFormatting let useformatting = (useformatting == 0 ? 1 : 0)

"--- NERDTree
" -- Open nerdtree on leader t
set encoding=UTF-8
nmap <silent> <leader>t :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
let NERDTreeWinSize=48

"--- Remaps
" Format
nnoremap <silent>ff    <cmd>Neoformat<CR><Esc>:w<CR>
" Go to Def
nnoremap <silent>gd    <cmd>lua vim.lsp.buf.definition()<CR>
" nnoremap <silent>gi    <cmd>lua vim.lsp.buf.implementation()<CR>
" Find references - replaced by telescope
" nnoremap <silent>gr    <cmd>lua vim.lsp.buf.references()<CR>
" Docs pls
nnoremap <silent>K     <cmd>lua vim.lsp.buf.hover()<CR>
" Params pls
inoremap <silent><C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>

"--- Commentary
noremap <Leader>cc :Commentary<CR>

"--- Git 
:highlight GitSignsAdd guibg=NONE
:highlight GitSignsChange guibg=NONE
:highlight GitSignsDelete guibg=NONE

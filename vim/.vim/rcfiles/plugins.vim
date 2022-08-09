" Get Plug if not installed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/bundle')

"--- Theme
Plug 'ellisonleao/gruvbox.nvim'
Plug 'arcticicestudio/nord-vim'

"--- Theming
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-lualine/lualine.nvim'

"--- Treesitter
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'nvim-treesitter/playground'

"--- Functional
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-surround'
Plug 'sbdchd/neoformat'
Plug 'AckslD/nvim-neoclip.lua'

"--- Webdev
Plug 'jonsmithers/vim-html-template-literals'
Plug 'ap/vim-css-color'

"--- Debugging
Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'
" Plug 'Pocco81/dap-buddy'
Plug 'David-Kunz/jester'


"--- LSP
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/lsp-status.nvim'
Plug 'jose-elias-alvarez/typescript.nvim'
" Plug 'mfussenegger/nvim-jdtls'

" Plug 'jose-elias-alvarez/null-ls.nvim'
" Plug 'jose-elias-alvarez/nvim-lsp-ts-utils'


"--- Completion
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'f3fora/cmp-spell'

Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

Plug 'windwp/nvim-autopairs'
Plug 'windwp/nvim-ts-autotag'

Plug 'lewis6991/spellsitter.nvim'

"--- Tellyscope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-ui-select.nvim'

"--- Git
Plug 'lewis6991/gitsigns.nvim'
Plug 'kdheepak/lazygit.nvim'

let g:AutoPairsShortcutToggle = ''
let g:AutoPairsShortcutBackInsert = '<M-0>'

"--- VSCode Features
Plug 'tpope/vim-commentary'

call plug#end()

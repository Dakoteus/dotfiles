if empty(glob(stdpath('data').'/site/autoload/plug.vim'))
silent execute '!curl -fLo '.shellescape(stdpath('data')).'/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
if v:shell_error
autocmd VimEnter * echohl WarningMsg | echom 'Automatic plugin installation failed.' | echohl None
else
autocmd VimEnter * PlugClean! | PlugUpdate --sync | q | qa
endif
endif
if !empty(glob(stdpath('data').'/site/autoload/plug.vim'))
command Update PlugUpgrade | PlugClean! | PlugUpdate --sync | q | qa
call plug#begin(stdpath('data').'/plugged')
Plug 'https://github.com/chrisbra/unicode.vim.git'
Plug 'vim-airline/vim-airline'
Plug 'https://github.com/vim-airline/vim-airline-themes'
let g:Unicode_URL = 'https://www.unicode.org/Public/UNIDATA/UnicodeData.txt'
Plug 'https://github.com/gruvbox-community/gruvbox.git'
Plug 'https://github.com/majutsushi/tagbar.git', { 'on': ['Tagbar', 'TagbarClose', 'TagbarCurrentTag', 'TagbarDebug', 'TarbarDebugEnd', 'TagbarGetTypeConfig', 'TagbarOpen', 'TagbarOpenAutoClose', 'TagbarSetFoldlevel', 'TagbarShowTag', 'TagbarToggle', 'TagbarTogglePause'] }
let g:tagbar_compact = 1
let g:tagbar_zoomwidth = 0
Plug 'https://github.com/xolox/vim-easytags.git'
let b:easytags_auto_highlight=1
Plug 'https://github.com/xolox/vim-misc.git'
Plug 'https://github.com/octol/vim-cpp-enhanced-highlight'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.8' }
call plug#end()
silent! colorscheme gruvbox
endif

autocmd BufWrite * filetype detect
autocmd FileType python setlocal omnifunc=python3complete#Complete
autocmd BufEnter *.cpp :HighlightTags
let g:netrw_banner=0
let g:netrw_dirhistmax=0
set background=dark
set clipboard=unnamedplus
set formatoptions+=j
set hidden
set list
set listchars=nbsp:⍽,tab:⇥·,trail:␣
set mouse=a
set nobackup
set noswapfile
set nowritebackup
set rnu
set numberwidth=1
set omnifunc=syntaxcomplete#Complete
set path+=**
set secure
set shada=
filetype plugin indent on
set shiftwidth=4
set tabstop=4
set expandtab
set spell
set termguicolors
set wildmode=longest:full,full
set ignorecase
inoremap <C-S> <C-O>:update<CR>
noremap <C-S> :update<CR>
nmap <F8> :TagbarToggle<CR>
inoremap <silent><expr> <C-tab> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
inoremap <F5> <C-O>:!g++ --std=c++17 % -o out && ./out<CR>
noremap <F5> :!g++ --std=c++17 % -o out && ./out<CR>
noremap <silent> K :call ShowDocumentation()<CR>
function! ShowDocumentation()
	if CocAction('hasProvider', 'hover')
		call CocActionAsync('doHover')
	else
		call feedkeys('K','in')
	endif
endfunction

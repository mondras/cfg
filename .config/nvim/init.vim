" General
set encoding=utf-8          " The encoding displayed
set fileencoding=utf-8      " The encoding written to file
syntax on                   " Enable syntax highlight
set ttyfast                 " Faster redrawing
set lazyredraw              " Only redraw when necessary
set ignorecase              " Case-insensitive searching.
set smartcase               " But case-sensitive if expression contains a capital letter.

" Plugins
call plug#begin()

Plug 'neomake/neomake'                    " Neomake, async stuff
Plug 'tpope/vim-eunuch'                   " :Move file for renaming
Plug 'altercation/vim-colors-solarized'   " My color scheme
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' } " semantic-based completion
Plug 'w0rp/ale'                                         " Highligting
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rails'
Plug 'slim-template/vim-slim'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'janko/vim-test'

" .editorconfig
Plug 'editorconfig/editorconfig-vim'

call plug#end()

" Neomake async hooks
call neomake#configure#automake('w')

" fix files on save
let g:ale_fix_on_save = 1

" lint after 1000ms after changes are made both on insert mode and normal mode
let g:ale_lint_on_text_changed = 'always'
let g:ale_lint_delay = 1000

" fixer configurations
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\}

" disable auto_triggering ycm suggestions pane and instead
" use semantic completion only on Ctrl+n
"let ycm_trigger_key = '<C-n>'
"let g:ycm_auto_trigger = 0
"let g:ycm_key_invoke_completion = ycm_trigger_key
"
"" this is some arcane magic to allow cycling through the YCM options
"" with the same key that opened it.
"" See http://vim.wikia.com/wiki/Improve_completion_popup_menu for more info.
"let g:ycm_key_list_select_completion = ['<TAB>', '<C-j>']
"inoremap <expr> ycm_trigger_key pumvisible() ? "<C-j>" : ycm_trigger_key;


"""""""""""""""""""""""""""""""""""""""""""""""
" Visual Config
"""""""""""""""""""""""""""""""""""""""""""""""
set t_Co=256                " 256 colors
set background=dark         " Solarized dark
colorscheme solarized       " Solarized dark
"set number                  " Show line numbers.
set ruler                   " Show cursor position.
set colorcolumn=81          " Display 80 chars column

"""""""""""""""""""""""""""""""""""""""""""""""
" => Keymappings
"""""""""""""""""""""""""""""""""""""""""""""""

" dont use arrowkeys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" really, just dont
inoremap <Up>    <NOP>
inoremap <Down>  <NOP>
inoremap <Left>  <NOP>
inoremap <Right> <NOP>

" copy and paste to/from vIM and the clipboard
nnoremap <C-y> +y
vnoremap <C-y> +y
nnoremap <C-p> +P
vnoremap <C-p> +P

" access system clipboard
set clipboard=unnamed

" map fzf to ctrl+p
nnoremap <C-P> :Files<CR>

" YouCompleteMeMappings
nnoremap ,dl    :YcmCompleter GoToDeclaration<CR>
nnoremap ,df    :YcmCompleter GoToDefinition<CR>
nnoremap ,#     :YcmCompleter GoToReferences<CR>


"""""""""""""""""""""""""""""""""""""""""""""""
" => Indentation
"""""""""""""""""""""""""""""""""""""""""""""""

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
" :help smarttab
set smarttab

" 1 tab == 2 spaces
set shiftwidth=2
" set tabstop=2
set softtabstop=2                 " Use 2 tabs

" Auto indent
" Copy the indentation from the previous line when starting a new line
set ai

" Smart indent
" Automatically inserts one extra level of indentation in some cases, and works for C-like files
" set si

"set softtabstop=2           " Use 2 tabs
"set tabstop=2               " Global tab width.
"set shiftwidth=2            " And again, related.
"set expandtab               " Use spaces instead of tabs
"

if (executable('ag'))
    let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
endif

"""""""""""""""""""""""""""""""""""""""""""""""
" => Utils (a.k.a. mess I can't categorize)
"""""""""""""""""""""""""""""""""""""""""""""""

" :W sudo saves the file
" (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null

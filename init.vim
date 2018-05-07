:set shell=/bin/bash
:set autoread
call plug#begin('~/.local/share/nvim/plugged')
    
    Plug 'Valloric/YouCompleteMe', {'dir': '~/.local/share/nvim/plugged/YouCompleteMe/', 'do': './install.py --clang-completer'}
    
    " Nerd commenter
    Plug 'scrooloose/nerdcommenter'

    " Color Scheme
    Plug 'morhetz/gruvbox'
    
    " Fuzzy finder (files, mru, etc)
    Plug 'ctrlpvim/ctrlp.vim'

    " A pretty statusline, bufferline integration
    Plug 'itchyny/lightline.vim'
    Plug 'bling/vim-bufferline'

    " Undo history visualizer
    Plug 'mbbill/undotree'

    " Autoclose (, " etc
    "Plug 'somini/vim-autoclose'
    Plug 'jiangmiao/auto-pairs'

    " UNIX shell command helpers, e.g. sudo, chmod, remove etc.
    Plug 'tpope/vim-eunuch'

    " Handle surround chars like ''
    Plug 'tpope/vim-surround'

    " Align your = etc.
    Plug 'junegunn/vim-easy-align'
    
    " Reformat/Reindent whole file with single line
    Plug 'Chiel92/vim-autoformat'
    
    " Nerd Tree File explorer
    Plug 'scrooloose/nerdtree'
    
    " Color Scheme vim-one
    Plug 'rakr/vim-one'

    " Plugin for C++ syntax highlighting
    Plug 'octol/vim-cpp-enhanced-highlight'

    " For taking vim notes
    Plug 'xolox/vim-notes'
    Plug 'xolox/vim-misc'
    
    "Plugins for \LaTeX
    Plug 'lervag/vimtex'
call plug#end()

" Indent configuration in VIM
filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

" Turn syntax highlighting on
set t_Co=256
syntax on

" Highlighting for OCTOL PLUGIN
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let c_no_curly_error=1

" Reformat the code
let b:formatdef_custom_cpp='"clang-format -style=\"{IndentWidth: 4, TabWidth: 4}\" "'
let b:formatters_cpp = ['custom_cpp']

" TABS REMAPPING
nnoremap tn :tabnew<Space>
nnoremap tk :tabnext<CR>
nnoremap tj :tabprev<CR>
nnoremap th :tabfirst<CR>
nnoremap tl :tablast<CR>

" YouCompleteMe configs
" let g:ycm_key_invoke_completion = 'Tab'
set number 
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_show_diagnostics_ui = 0 " Turning off the linter diagnostics
nnoremap go :YcmCompleter GoTo<CR>
set completeopt-=preview

autocmd BufEnter *.cpp :let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf_cpp.py'
autocmd BufEnter *.cc :let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf_cpp.py'
autocmd BufEnter *.c :let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf_c.py'

" Terminal Colors SETTINGS
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" Show whitespaces as characters
:set list

" Grubox configs
 colorscheme gruvbox
 let g:gruvbox_contrast_dark = 'hard'

" ColorScheme one
"colorscheme one
"let g:one_allow_italics = 1
set bg=dark

" LightLine vim configuration
let g:lightline = {
      \ 'colorscheme': 'one',
      \ }

" Remapping for Copying and Pasting to and from system clipboard
vmap <C-c> "+y

" Keybindings C++ build system -Wall -Werror -Wfatal-errors
nnoremap <F2> :wa<CR>:!make '%:r' && timeout 4s ./a.out < ~/Documents/inputf.in > ~/Documents/outputf.in <CR>

" Remapping for movements between windows
"execute "set <M-j>=\ej"
"execute "set <M-k>=\ek"
"execute "set <M-l>=\el"
"execute "set <M-h>=\eh"
nnoremap <M-j> <C-w>j
nnoremap <M-k> <C-w>k
nnoremap <M-h> <C-w>h
nnoremap <M-l> <C-w>l
inoremap <M-j> <Esc><C-w>j
inoremap <M-k> <Esc><C-w>k
inoremap <M-h> <Esc><C-w>h
inoremap <M-l> <Esc><C-w>l

"--------------Keybindings------------------
"
"Saving Files
nnoremap <C-s>  :w<CR>
"Disable Highlighting
nnoremap <F1>   :noh<CR>
"Reloading the .vimrc file
nnoremap <F3>   :source ~/.config/nvim/init.vim <CR>
"------------------------------------------
"
"
"whichwrap config file
:set whichwrap+=>,l "For Normal Mode wrapping after right"
:set whichwrap+=<,h "For Normal Mode wrapping after left"
:set whichwrap+=[,]  "For Insert Mode wrapping"


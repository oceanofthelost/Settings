" Lets vim know to use Vi improved mode. This needs to be on
set nocompatible
" Command is needed for vundle. Reason is because of the way 
" that vim is implemented. 
filetype off

" The following checks to see if vundle is installed. If
" it is not installed then we install it. 
 
" Variable used to see if vundle is installed

let installPlugins = 0
" Check to see if the file is on the system
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
" If the above file is not on the system do not execute the following loop
if !filereadable(vundle_readme)
    " Install vundle
    echo "Installing Vundle.."
    echo ""
    " Create the directory where the vim plugins will be stored
    silent !mkdir -p ~/.vim/bundle
    " Get the current version of vundle from github
    silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
    " We now need to install vim plugins
    let installPlugins = 1
endif
set rtp+=~/.vim/bundle/vundle/

" The begin/end commands give vundle the list of plugins that are to be managed
call vundle#begin()
    " This is the plugin manager for vim
    Plugin 'gmarik/vundle'
    " Eclipse style open-close character completion 
    Plugin 'Townk/vim-autoclose' 
    " Adds better C++ syntax highlighting for c++11/14
    Plugin 'octol/vim-cpp-enhanced-highlight'
    " Git wrapper usable within vim
    Plugin 'tpope/vim-fugitive'
    " All completion can be done with the tab key 
    Plugin 'ervandew/supertab'
    " Gives matching parentheses a coler. coler changes for each nested parentheses
    Plugin 'luochen1990/rainbow'
    " Displays the structure of the file. Generated fome a tag file
    Plugin 'majutsushi/tagbar'
    " Autocompletion of C/C++ using clang
    Plugin 'Rip-Rip/clang_complete'
    " Helps with aligning text 
    Plugin 'tommcdo/vim-lion'
    " A Theme for vim
    Plugin 'w0ng/vim-hybrid'
    " A theme for vim
    Plugin 'michalbachowski/vim-wombat256mod'
    " Syntax cherker frontend for vim
    Plugin 'scrooloose/syntastic'
    " Haskell syntax & type checking plugin
    Plugin 'bitc/vim-hdevtools'
    " Gives a customizable status & buffer line 
    Plugin 'bling/vim-airline'
call vundle#end()

" This is needed for vundle because of how vim is configured
"  This command automaticly determins the type of indent by filetype
filetype plugin indent on

" Settings for each package
" Plugin 'gmarik/vundle'
" None

" Plugin 'Townk/vim-autoclose' 
" None

" Plugin 'octol/vim-cpp-enhanced-highlight'
" Enable syntax highliting for classes and templates
let g:cpp_class_scope_highlight = 1
let g:cpp_experimental_template_highlight = 1

" Plugin 'tpope/vim-fugitive'
" None

" Plugin 'ervandew/supertab'
" Use context aware tab completion 
let g:SuperTabDefaultCompletionType = "context"
" This gets rid of the scratchpad window.
set completeopt=menu,menuone
" Plugin 'luochen1990/rainbow'
" None

" Plugin 'majutsushi/tagbar'
" Set the toggle key for tagbar
nmap <F8> :TagbarToggle<CR>

" Plugin 'Rip-Rip/clang_complete'
" Open quickfix window on error
let g:clang_complete_copen                 = 1
" Highlight errors like clang
let g:clang_hl_errors                      = 1
" Close preview windows after a completion
let g:clang_close_preview                  = 1
" Additional clang compile flags
let g:clang_user_options = '-std=c++11'
" Use libclang directly
let g:clang_use_library = 1

" Plugin 'tommcdo/vim-lion'
" None

" Plugin 'w0ng/vim-hybrid'
" None

" Plugin 'michalbachowski/vim-wombat256mod' 
" None
set t_Co=256
colorscheme wombat256mod


" Bundle 'scrooloose/syntastic'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_cpp_compiler_options = '-std=c++11'

" Bundle 'bitc/vim-hdevtools'
" None 

" Bundle 'bling/vim-airline'
set laststatus=2 
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts=1
let g:airline_detect_modified=1
let airline_mode_map = {
      \ '__' : '-',
      \ 'n'  : 'N',
      \ 'i'  : 'I',
      \ 'R'  : 'R',
      \ 'c'  : 'C',
      \ 'v'  : 'V',
      \ 'V'  : 'V',
      \ ' '  : 'V',
      \ 's'  : 'S',
      \ 'S'  : 'S',
      \ ' '  : 'S',
      \ } 

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif




let airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.linenr = ''



let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#tagbar#enabled=1
let g:airline_section_b = '%{getcwd()}'
let g:airline_section_c = '%t'


"syntax will be on  by default
syntax on

"line numbers on by default

set number


"Git gutter plugin
filetype plugin on
filetype indent on

"auto complete and the tagcomplete options
set ofu=syntaxcomplete#Complete
let g:SuperTabDefaultCompletionType = "context"

"the , will act like : in command mode. after are my defined commands
let mapleader = ","
nmap <leader>w :w!<cr>
nmap <leader>q :q!<cr>
nmap <leader>x :x!<cr>
nmap <leader>s :sh<cr>
"these are for auto indent and how it is defined
set expandtab
set shiftwidth=4
set tabstop=4
set smarttab
set lbr
set tw=500
set ai "Auto indent
set si "Smart indet
set wrap

"able to use the mouse in vim 
set mouse=a

"sets the working directory
set autochdir

set foldmethod=indent

set foldlevel=99  
    
let $PATH = "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/home/sean"
" If the install plugin flag is set then we have just installed vundle, now we need
" to install all of the vim plugins
if installPlugins == 1
    echo "Installing Bundles, please ignore key map error messages"
    echo ""
    " This command install all of the plugins 
    :BundleInstall

endif

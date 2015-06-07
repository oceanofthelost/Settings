set nocompatible               " be iMproved
filetype off                   " required!

 " Setting up Vundle - the vim plugin bundler
    let iCanHazVundle=1
    let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
    if !filereadable(vundle_readme)
        echo "Installing Vundle.."
        echo ""
        silent !mkdir -p ~/.vim/bundle
        silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
        let iCanHazVundle=0
    endif
    set rtp+=~/.vim/bundle/vundle/
    call vundle#rc()
    Bundle 'gmarik/vundle'

    Bundle 'Townk/vim-autoclose'
    Bundle 'octol/vim-cpp-enhanced-highlight'

    Bundle 'tpope/vim-fugitive'

    Bundle 'michalbachowski/vim-wombat256mod'

    Bundle 'ervandew/supertab'

    Bundle 'kien/rainbow_parentheses.vim'
    let g:rbpt_colorpairs = [
      \ [ '13', '#6c71c4'],
      \ [ '5',  '#d33682'],
      \ [ '1',  '#dc322f'],
      \ [ '9',  '#cb4b16'],
      \ [ '3',  '#b58900'],
      \ [ '2',  '#859900'],
      \ [ '6',  '#2aa198'],
      \ [ '4',  '#268bd2'],
      \ ]
 
    " Enable rainbow parentheses for all buffers
    augroup rainbow_parentheses
      au!
      au VimEnter * RainbowParenthesesActivate
      au BufEnter * RainbowParenthesesLoadRound
      au BufEnter * RainbowParenthesesLoadSquare
      au BufEnter * RainbowParenthesesLoadBraces
    augroup END


    Bundle 'majutsushi/tagbar'
    "use the F<F8> key to call tagbar
    nmap <F8> :TagbarToggle<CR>

    Bundle 'Rip-Rip/clang_complete'
    let g:clang_library_path='/usr/lib/llvm-3.2/lib'
    let g:clang_close_preview = 1

    Bundle 'godlygeek/tabular'

    Bundle 'w0ng/vim-hybrid'
    "these are for the theme for gvim
    let g:hybrid_use_Xresources = 1
    "colorscheme hybrid
    
    set t_Co=256
    colorscheme wombat256mod

    Bundle 'bling/vim-airline'
    set laststatus=2 
    
    let g:airline#extensions#tabline#enabled = 1
    "let g:airline_theme='hybrid'
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
          \ 's'  : 'S',
          \ 'S'  : 'S',
          \ } 
    
    if !exists('g:airline_symbols')
        let g:airline_symbols = {}
    endif

    let g:airline_left_sep = '▶'
    let g:airline_right_sep = '◀'
    let g:airline_symbols.paste = 'ρ'
    let g:airline#extensions#syntastic#enabled = 1
    let g:airline#extensions#tagbar#enabled=1
    let g:airline_section_b = '%{getcwd()}'
    let g:airline_section_c = '%t'

    Bundle 'scrooloose/syntastic'
    let g:syntastic_error_symbol = '✗'
    let g:syntastic_warning_symbol = '⚠'
    let g:syntastic_cpp_compiler_options = '-std=c++11'
    "let g:syntastic_haskell_checkers = ['']

    Bundle 'bitc/vim-hdevtools'

    "syntax will be on  by default
    syntax on

    "line numbers on by default
    set number



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
    
    let $PATH = "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/home/sean/.scripts:/home/sean/.cabal/bin"

    if iCanHazVundle == 0
        echo "Installing Bundles, please ignore key map error messages"
        echo ""
        :BundleInstall
    endif
" Setting up Vundle - the vim plugin bundler end

" let Vundle manage Vundle
" required! 

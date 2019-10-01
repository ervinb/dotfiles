" Vundle Settings
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#rc()

"""""""""""
" Bundles "
"""""""""""
Bundle "Lokaltog/vim-easymotion"
Bundle "altercation/vim-colors-solarized"
Bundle "elzr/vim-json"
Bundle "gmarik/vundle"
Bundle "godlygeek/tabular"
Bundle "gregsexton/MatchTag"
Bundle "jelera/vim-javascript-syntax"
Bundle "jpalardy/vim-slime"
Bundle "kana/vim-textobj-user"
Bundle "kchmck/vim-coffee-script"
Bundle "kien/ctrlp.vim"
Bundle "mattn/gist-vim"
Bundle "mattn/webapi-vim"
Bundle "nelstrom/vim-textobj-rubyblock"
Bundle "renderedtext/vim-bdd"
Bundle "scrooloose/nerdcommenter"
Bundle "scrooloose/nerdtree"
Bundle "terryma/vim-smooth-scroll"
Bundle "thisivan/vim-bufexplorer"
Bundle "tpope/vim-cucumber"
Bundle "tpope/vim-endwise"
Bundle "tpope/vim-fugitive"
Bundle "tpope/vim-ragtag"
Bundle "tpope/vim-rails"
Bundle "tpope/vim-repeat"
Bundle "tpope/vim-surround"
Bundle "vim-scripts/Auto-Pairs"
Bundle "junegunn/fzf.vim"
Bundle "/usr/local/opt/fzf"

filetype plugin indent on

" reaching preferences
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -l -g ""'
nnoremap <C-p> :Files<CR>
nnoremap <Leader>p :Fi <c-r><c-w><CR>
vnoremap <leader>p y:Fi <c-r>"<CR>

nnoremap <C-f> :Rg<space>
nnoremap <leader>f :Rg <c-r><c-w><CR>
vnoremap <leader>f y:Rg <c-r>"<CR>

command! -bang -nargs=* Fi call fzf#vim#files('.', {'options':'--query '.shellescape(<q-args>)})
command! -bang -nargs=* Rg call fzf#vim#grep('rg --line-number --hidden --no-heading --color=always --smart-case '.shellescape(<q-args>),1, fzf#vim#with_preview({'options': '--delimiter : --nth 3..'}), <bang>0)

runtime! bundle/snipmate-snippets/support_functions.vim
runtime macros/matchit.vim

" autocmd BufWritePre * :%s/\s\+$//e

set title
set hidden

" Numbers
set number
set numberwidth=4
set ruler

exe "set path=".expand("$PATH")

syntax enable
set nomodeline
set backspace=indent,eol,start                          " Backspace will delete EOL chars, as well as indents
set matchpairs+=<:>                                     " For characters that forms pairs for using % commands, this is for HTML Tags
set shortmess=atToOI                                    " To avoid the 'Hit Enter' prompts caused by the file messages
set iskeyword+=_,$,@,%,#                                " Keywords are use to searching and recognized with many commands
set history=1000
set undolevels=1000
set confirm
set updatetime=1500

set mousehide                                           " Hide the mouse cursor when typing
set mouse=a

" Encoding "
set encoding=utf-8
set termencoding=utf-8

" Instantly leave insert mode when pressing <ESC>"
" This works by disabling the mapping timeout completely in normal
" mode, and enabling it in insert mode with a very low timeout length.
augroup fastescape
	autocmd!

	set notimeout
	set ttimeout
	set timeoutlen=10

	au InsertEnter * set timeout
	au InsertLeave * set notimeout
augroup END


" Define , as map leader"
let mapleader = ' '
let g:mapleader = ' '

" Disable all bells"
set noerrorbells visualbell t_vb=

" Color column at 80
set colorcolumn=80

" Wild menu (Autocompletion)"
set wildmenu
set wildignore=*/vendor/*,.svn,CVS,.git,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.jpeg,*.png,*.xpm,*.gif
set wildmode=full

" Backup and Swap"
set nobackup
set nowritebackup
set noswapfile

" Search Options"
set hlsearch   " Highlight search
set incsearch  " Incremental search
set magic      " Set magic on, for regular expressions
set ignorecase " Searches are Non Case-sensitive
set smartcase

" FOLDING
set foldenable
set foldmethod=marker
set foldlevel=0
set foldcolumn=0

" Look and Feel settings
set background=dark
set t_Co=16
colorscheme solarized

" Display extra whitespace
set list listchars=tab:»·,trail:·

" General UI Options"
set laststatus=2       " Always show the statusline
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)

set showmatch          " Shows matching brackets when text indicator is over them
set scrolloff=5        " Show 5 lines of context around the cursor
set sidescrolloff=20
set lazyredraw         " The screen won't be redrawn unless actions took place
set cursorline
set scrolljump=10
set showcmd
set ttyfast            " Improves redrawing for newer computers
set pumheight=10
set diffopt+=context:3
set nostartofline      " when moving thru the lines, the cursor will try to stay in the previous columns

" LAYOUT / TEXT FORMATTING
" Formatting Options
set wrap	" Soft Wrap in all files, while hard wrap can be allow by filetype
set linebreak " It maintains the whole words when wrapping

" Indentation"
set autoindent
set cindent
set smartindent

" Tab Options"
set shiftwidth=2
set tabstop=2
set expandtab

" Fix terminal timeout when pressing escape
if ! has('gui_running')
  set ttimeoutlen=10
  augroup FastEscape
    autocmd!
    au InsertEnter * set timeoutlen=0
    au InsertLeave * set timeoutlen=1000
  augroup END
endif

nnoremap <silent><leader>s :A<CR>
nnoremap <silent><leader>v :AV<CR>
nnoremap <silent><leader>\ :vs<CR>
nnoremap <silent><leader>- :split<CR>
nnoremap <silent><leader>1 :e ~/.vimrc<CR>
nnoremap <silent><leader>2 :source ~/.vimrc<CR>

" MAPPINGS

" General
	" Clear search highlighting
  nnoremap <silent><leader>c :nohlsearch<CR>

  " Start BufExplorer
  nnoremap <silent><leader>l :BufExplorer<CR>

  " Start ctrlp.vim
  nnoremap <silent><leader>t :CtrlP<CR>

  " Paste
  let paste_mode = 0 " 0 = normal, 1 = paste

  func! Paste_on_off()
    if g:paste_mode == 0
      set paste
      let g:paste_mode = 1
    else
      set nopaste
      let g:paste_mode = 0
    endif
    return
  endfunc

  " Paste Mode <F3>
  nnoremap <silent> <F3> :call Paste_on_off()<CR>
  set pastetoggle=<F3>

	" Repurpose left and right arrow keys to move between the buffers
	nnoremap <silent> <Down>   :bn<CR>
	nnoremap <silent> <Up>  :bp<CR>

	" Indent visual selected code without unselecting
	" As seen in vimcasts.org
	vmap > >gv
	vmap < <gv
	vmap = =gv

" 3RD-PARTY PLUGINS SETTINGS

  let g:ragtag_global_maps = 1

  " Buffer Explorer
  let g:bufExplorerDefaultHelp=0       " Do not show default help.
  let g:bufExplorerShowRelativePath=1  " Show relative paths.

  " NERD tree
    let g:NERDTreeChristmasTree = 1
    let g:NERDTreeCaseSensitiveSort = 1
    let g:NERDTreeQuitOnOpen = 1
    let g:NERDTreeWinPos = 'left'
    let g:NERDTreeWinSize = 50
    let g:NERDTreeShowBookmarks = 1
    let g:NERDTreeDirArrows=0
    map <F2> :NERDTreeToggle<CR>

  " Slime
  let g:slime_target = "tmux"
  let g:slime_paste_file = "$HOME/.slime_paste"

  " vim-smooth-scroll
  noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
  noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
  noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
  noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>

  command W w
  command Q q
  command Wq wq

  " Auto-set syntax to ruby for CAP files
  au! BufNewFile,BufRead */Cap/* set filetype=ruby
  au! BufNewFile,BufRead *cap set filetype=ruby

  " Magic
  nnoremap ; :

  " Make sure all markdown files have the correct filetype set and setup
  " " wrapping and spell check
  au BufRead,BufNewFile *.{md,md.erb,markdown,mdown,mkd,mkdn,txt} setf markdown | call s:setupWrappingAndSpellcheck()

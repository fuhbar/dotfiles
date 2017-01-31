" Bundles ---------------------------------------------------------------------
" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)

let g:python2_host_prog = '/usr/local/bin/python'

call plug#begin('~/.local/share/nvim/plugged')

" My Bundles here:

" Selection of color schemes 
Plug 'flazz/vim-colorschemes'

" Solarized color scheme for vim
Plug 'altercation/vim-colors-solarized'

" lean & mean status/tabline for vim that's light as air
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Vim plugin that displays tags in a window, ordered by scope
Plug 'majutsushi/tagbar'

" A tree explorer plugin for vim.
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Tabs fully integrated with nerdtree
Plug 'jistr/vim-nerdtree-tabs'

" Tabs fully integrated with nerdtree
Plug 'ap/vim-buftabline'

" Fuzzy search in buffer list 
Plug 'kien/ctrlp.vim'

" On target movement with little as possible keystrokes
Plug 'Lokaltog/vim-easymotion'

" Ruby support in vim
Plug 'vim-ruby/vim-ruby'

" Be ansible/yaml aware
Plug 'chase/vim-ansible-yaml'

" Go support
Plug 'fatih/vim-go'

" awesome Python autocompletion with VIM
Plug 'davidhalter/jedi-vim'

Plug 'myhere/vim-nodejs-complete'

" Butane provides only one simple command, the Bclose command, which closes a
" buffer without changing the layout of your windows
Plug 'Soares/butane.vim'

" Automated tag file generation and syntax highlighting of tags in Vim
Plug 'xolox/vim-easytags'

" Dependency of easytags
Plug 'xolox/vim-misc'

" A JavaScript code analyzer for deep, cross-editor language support
Plug 'ternjs/tern_for_vim'

" CoffeeScript 
"Plug 'kchmck/vim-coffee-script.git'

" YouCompleteMe is a fast, as-you-type, fuzzy-search code completion engine
Plug 'Valloric/YouCompleteMe'

" A Sublime-like minimap for VIM, based on the Drawille console-based drawing
" library
" Plug 'severin-lemaignan/vim-minimap'

" basic vim/terraform integration http://hashivim.github.io/vim-terraform
Plug 'hashivim/vim-terraform'

" Shows a git diff in the gutter (sign column) and stages/undoes hunks.
Plug 'airblade/vim-gitgutter'


" Initialize plugin system
call plug#end()

" Required:
filetype plugin indent on

"End Plug Scripts--------------------------------------------------------


" General settings ------------------------------------------------------
set tw=0
set nu
set ts=4
set sw=4
set et 
set ls=2
set modeline
set nocompatible      " We're running Vim, not Vi!
syntax on             " Enable syntax highlighting

filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins

set incsearch         " Find the next match as we type the search
set hlsearch          " Highlight searches by default
set ignorecase        " Ignore case when searching...
set smartcase         " ...unless we type a capital

set autoindent
set smartindent
set smarttab

set noswapfile
set nobackup
set nowb

" yank to systems clipboard
set clipboard=unnamedplus

" Wrap long lines between words
"set wrap lbr
"noremap  <buffer> <silent> <Up>   gk
"noremap  <buffer> <silent> <Down> gj
"noremap  <buffer> <silent> <Home> g<Home>
"noremap  <buffer> <silent> <End>  g<End>
"inoremap <buffer> <silent> <Up>   <C-o>gk
"inoremap <buffer> <silent> <Down> <C-o>gj
"inoremap <buffer> <silent> <Home> <C-o>g<Home>
"inoremap <buffer> <silent> <End>  <C-o>g<End>
" leader key which triggers custom key bindings 
let mapleader = ","

"nmap <leader>.  @:


autocmd Filetype yaml setlocal ts=2 sw=2 et

"EasyMotion Scripts-----------------------------------------------------------
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Bi-directional find motion
" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap <Leader>s <Plug>(easymotion-s)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap <Leader>t <Plug>(easymotion-s2)

" Turn on case sensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)

" Gif config
map  <Leader>/ <Plug>(easymotion-sn)
omap <Leader>/ <Plug>(easymotion-tn)

" These `n` & `N` mappings are options. You do not have to map `n` & `N` to EasyMotion.
" Without these mappings, `n` & `N` works fine. (These mappings just provide
" different highlight method and have some other features )
map  <Leader>n <Plug>(easymotion-next)
map  <Leader>N <Plug>(easymotion-prev)
"End EasyMotion Scripts-----------------------------------------------

" Solarized color scheme -----------------------------------------------
syntax enable
set background=light
set t_Co=256
let g:solarized_termcolors=256
let g:solarized_termtrans=1
let g:solarized_italic = 1
let g:solarized_bold = 1
let g:solarized_underlined = 1
let g:solarized_contrast = 'high'
colorscheme solarized

" airline
" ---------------------------------------------------------------------

let g:airline_powerline_fonts = 1
let g:airline_theme='solarized'

" CTPLP ------------------------------------------------------------------

map <Leader>b <Esc>:CtrlPBuffer<CR>
map <Leader>c <Esc>:CtrlPMixed<CR>

imap <S-CR>    <CR><CR>end<Esc>-cc

" Powerline --------------------------------------------------------------

" Setup: https://powerline.readthedocs.org/en/latest/usage/other.html#vim-statusline

" set rtp+=~/Library/Python/2.7/lib/python/site-packages/powerline/bindings/vim/
" python from powerline.vim import setup as powerline_setup
" python powerline_setup()
" python del powerline_setup

" vim-go --------------------------------------------------------------------
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

let g:go_fmt_command = "goimports"

let g:go_auto_type_info = 1

" vim-go has several <Plug> mappings which can be used to create custom
" mappings. Below are some examples you might find useful:
" 
" Run commands such as go run for the current file with <leader>r or go build
" and go test for the current package with <leader>b and <leader>t
" respectively. Display beautifully annotated source code to see which
" functions are covered with <leader>c.
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)

" By default the mapping gd is enabled, which opens the target identifier in
" current buffer. You can also open the definition/declaration, in a new
" vertical, horizontal, or tab, for the word under your cursor:
au FileType go nmap <Leader>d <Plug>(go-def)
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)

" Open the relevant Godoc for the word under the cursor with <leader>gd or
" open it vertically with <leader>gv
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)

" Or open the Godoc in browser
au FileType go nmap <Leader>gb <Plug>(go-doc-browser)

" Show a list of interfaces which is implemented by the type under your cursor
" with <leader>s
au FileType go nmap <Leader>si <Plug>(go-implements)

" Show type info for the word under your cursor with <leader>i (useful if you
" have disabled auto showing type info via g:go_auto_type_info)
au FileType go nmap <Leader>i <Plug>(go-info)

" Rename the identifier under the cursor to a new name
au FileType go nmap <Leader>e <Plug>(go-rename)

" More <Plug> mappings can be seen with :he go-mappings. Also these are just
" recommendations, you are free to create more advanced mappings or functions
" based on :he go-commands.

" NERDTree ------------------------------------------------------------------
nmap <Leader>nf :NERDTreeFind<CR>
nmap <Leader>nt :NERDTreeToggle<CR>

" On Switching buffers send focus to last window instead of NERDTree window
"autocmd BufNew * if &filetype ==# 'nerdtree' | wincmd p | endif

" http://codeyarns.com/2014/05/05/how-to-highlight-current-file-in-nerdtree/
" Check if NERDTree is open or active
function! IsNERDTreeOpen()        
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
function! SyncTree()
  if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction

" Highlight currently open buffer in NERDTree
"autocmd BufEnter * call SyncTree()

" tagbar --------------------------------------------------------------------
nmap <Leader>tb :TagbarToggle<CR>
"nmap <F8> :TagbarToggle<CR>

let g:tagbar_sort = 0
let g:tagbar_compact = 1
let g:tagbar_expand = 1
let g:tagbar_autoshowtag = 1

" Javascript ------------------------------------------------------

" Using NerdTREE and Tagbar in developing node.js and javascript
" 
" Tagbar and Javascript " (https://github.com/majutsushi/tagbar/wiki#javascript): 
"
" It works as expected and thanks to Tern, it recognizes the return value of
" functions and variable types, which comes extremely handy in a loosely-typed
" language. jsctags, by default, outputs a JSON file, but with the -f flag,
" the resulting file is ctags-compatible.
"
" 1) Install tern_for_vim using the pathogen, neobundle, vundle, etc.
" 2) Navigate to the tern folder and execute in the shell, the following command:
"       npm install (if it doesn't work, try prepending sudo).
" 3) Follow the install instruction from ramitos/jsctags.

"autocmd Filetype javascript NERDTree
"autocmd Filetype javascript Tagbar
autocmd FileType javascript set ts=2 sw=2 et ai

" CoffeScript / Litcoffee ---------------------------------------------------

autocmd FileType litcoffee runtime ftplugin/coffee.vim

" Minimap 
let g:minimap_highlight='Visual'

" Git Gutter - Show git modifications ----------------------------------------
set updatetime=250
let g:gitgutter_max_signs = 500
let g:gitgutter_map_keys = 0
let g:gitgutter_enabled = 1
nmap <Leader>gg :GitGutterToggle<CR>
nmap <Leader>ggn <Plug>GitGutterNextHunk
nmap <Leader>ggp <Plug>GitGutterPrevHunk

" Buftabline -----------------------------------------------------------------
let g:buftabline_show=1
let g:buftabline_numbers=2
let g:buftabline_separators='on'
nmap <leader>1 <Plug>BufTabLine.Go(1)
nmap <leader>2 <Plug>BufTabLine.Go(2)
nmap <leader>3 <Plug>BufTabLine.Go(3)
nmap <leader>4 <Plug>BufTabLine.Go(4)
nmap <leader>5 <Plug>BufTabLine.Go(5)
nmap <leader>6 <Plug>BufTabLine.Go(6)
nmap <leader>7 <Plug>BufTabLine.Go(7)
nmap <leader>8 <Plug>BufTabLine.Go(8)
nmap <leader>9 <Plug>BufTabLine.Go(9)
nmap <leader>10 <Plug>BufTabLine.Go(10)
nmap <leader>11 <Plug>BufTabLine.Go(11)
nmap <leader>12 <Plug>BufTabLine.Go(12)
nmap <leader>13 <Plug>BufTabLine.Go(13)
nmap <leader>14 <Plug>BufTabLine.Go(14)
nmap <leader>15 <Plug>BufTabLine.Go(15)
nmap <leader>16 <Plug>BufTabLine.Go(16)
nmap <leader>17 <Plug>BufTabLine.Go(17)
nmap <leader>18 <Plug>BufTabLine.Go(18)
nmap <leader>19 <Plug>BufTabLine.Go(19)
nmap <leader>20 <Plug>BufTabLine.Go(20)

" Butane ---------------------------------------------------------------------
noremap <leader>bd :Bclose<CR>      " Close the buffer.

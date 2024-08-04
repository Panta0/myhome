" Configuration file for vim
" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible	" Use Vim defaults instead of 100% vi compatibility

""LD_PRELOAD setup is not needed anymore for YCM.
""YCM's rpath was manually configured to include this path for runtime library.
if (v:version >= 800)
    let $LD_PRELOAD .= ':/home/utils/gcc-8.1.0/lib64/libstdc++.so'
endif

syntax on
set backspace=2		" more powerful backspacing
set cindent
set background=dark
set ruler
set nu 
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set showmatch
set autoindent
set smartindent
set textwidth=500
set t_vb=
set tm=500
set colorcolumn=+1
set mouse=a
set hlsearch
set noerrorbells
set novisualbell
let $LANG='en'
" set encoding=utf-8
" set termencoding=utf-8
" 
" set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr
" set fileencoding=utf-8
" Use Unix as the standard file type
set ffs=unix,dos,mac
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L

set autoread
au FocusGained,BufEnter * checktime
" Configure backspace so it acts as it should act
set backspace=eol,start,indent

" Enable 256 colors palette in Gnome Terminal
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif
" Bash like keys for the command line
cnoremap <C-A>		<Home>
cnoremap <C-E>		<End>
cnoremap <C-K>		<C-U>

cnoremap <C-P> <Up>
cnoremap <C-N> <Down>

" Add a bit extra margin to the left
set foldcolumn=1

set foldenable              " ????
set foldcolumn=0            " ?????????
setlocal foldlevel=1        " ???????
" set foldclose=all           " ?????????                            
set foldmethod=indent
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
                            " ?????????
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General abbreviations
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
iab xdate <C-r>=strftime("%d/%m/%y %H:%M:%S")<cr>

""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
" set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

" Colorscheme
set background=dark
colorscheme desert


"mapping config 
map <F2> :w<CR>
imap <F2> <ESC>:w<CR>
map <C-s> :w<CR>
map <A-q> :q<CR>
map <F4> :NERDTreeToggle<CR>
vmap <A-1> "+y
vmap <C-c> "+y
map <A-2> "+gP
imap <C-v> "+gP
imap <A-2> <ESC><A-2>a
" Switch CWD to the directory of the open buffer
map cd :cd %:p:h<cr>:pwd<cr>
map <F3> ==<DOWN>
    
" Remove the Windows ^M - when the encodings gets messed up
noremap rm mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Turn persistent undo on 
"    means that you can undo even when you close a buffer/VIM
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
try
    set undodir=~/.vim/temp_dirs/undodir
    set undofile
catch
endtry

""""""""""""""""""""""""""""""
" => Python section
""""""""""""""""""""""""""""""
" let python_highlight_all = 1
" au FileType python syn keyword pythonDecorator True None False self
" 
" au BufNewFile,BufRead *.jinja set syntax=htmljinja
" au BufNewFile,BufRead *.mako set ft=mako
" 
" au FileType python map <buffer> F :set foldmethod=indent<cr>
" 
" au FileType python inoremap <buffer> $r return 
" au FileType python inoremap <buffer> $i import 
" au FileType python inoremap <buffer> $p print 
" au FileType python inoremap <buffer> $f # --- <esc>a
" au FileType python map <buffer> <leader>1 /class 
" au FileType python map <buffer> <leader>2 /def 
" au FileType python map <buffer> <leader>C ?class 
" au FileType python map <buffer> <leader>D ?def 

""""""""""""""""""""""""""""""
" => Shell section
""""""""""""""""""""""""""""""
if exists('$TMUX') 
    if has('nvim')
        set termguicolors
    else
        set term=screen-256color 
    endif
endif



""""""""""""""""""""""""""""""
" => Markdown
""""""""""""""""""""""""""""""
let vim_markdown_folding_disabled = 1


""""""""""""""""""""""""""""""
" => YAML
""""""""""""""""""""""""""""""
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab


" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" Plugin 'altercation/vim-colors-solarized'
" Plugin 'jnurmine/Zenburn'
" vim scripts
" Plugin 'vim-scripts/python.vim'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'Yggdroot/indentLine'
Plugin 'jiangmiao/auto-pairs'
Plugin 'Lokaltog/vim-powerline'
Plugin 'maralla/completor.vim'
" Plugin 'nvie/vim-flake8'
" Plugin 'tell-k/vim-autopep8'
" Plugin 'kien/ctrlp.vim'
Plugin 'jlanzarotta/bufexplorer'
" Plugin 'Valloric/YouCompleteMe'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'vim-scripts/taglist.vim'
Plugin 'camspiers/lens.vim'
Plugin 'camspiers/animate.vim'

call vundle#end()            " required
filetype plugin indent on    " required

"plugin config begin
""""""""""""""""""""""""""""""
" completor
""""""""""""""""""""""""""""""
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"

""""""""""""""""""""""""""""""
" ctags
""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""
" Taglist
let Tlist_Ctags_Cmd = 'ctags'           "??ctags?????
let Tlist_Show_One_File = 1             "??????????tag
let Tlist_Exit_OnlyWindow = 1           "??taglist????????????vim
let Tlist_Use_Right_Window = 1          "??????????????>??
let Tlist_Sort_Type='name'              "??Tlist????????????????????
let Tlist_Use_SingleClick=1             "??????tag????????????
"let Tlist_Auto_Open = 1                "????vim????Tlist
"let Tlist_Close_On_Select = 1          "?????tag?????Tlist}
let Tlist_Process_File_Always=1         "????Tlist???????tags
nnoremap <silent> <F5> :TlistToggle<CR> "??F8??????Tlist????(?normal???)

""""""""""""""""""""""""""""""""""
set tags=/home/taop/.ctags.d/tags
set autochdir
""""""""""""""""""""""""""""""
" BufExplorer
""""""""""""""""""""""""""""""
let g:bufExplorerDefaultHelp=0       " Do not show default help.
let g:bufExplorerShowRelativePath=1  " Show relative paths.
let g:bufExplorerSortBy='mru'        " Sort by most recently used.
let g:bufExplorerSplitRight=0        " Split left.
let g:bufExplorerSplitVertical=1     " Split vertically.
let g:bufExplorerSplitVertSize = 30  " Split width
let g:bufExplorerUseCurrentWindow=0  " Open in new window.
let g:bufExplorerDisableDefaultKeyMapping =0 " Do not disable default key mappings.
" Buffers??????!
nnoremap <C-RETURN> :bnext<CR>
nnoremap <C-S-RETURN> :bprevious<CR>
" Close the current buffer
map bc :Bclose<cr>
" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
    let l:currentBufNum = bufnr("%")
    let l:alternateBufNum = bufnr("#")

    if buflisted(l:alternateBufNum)
        buffer #
    else
        bnext
    endif

    if bufnr("%") == l:currentBufNum
        new
    endif

    if buflisted(l:currentBufNum)
        execute("bdelete! ".l:currentBufNum)
    endif
endfunction



" MiniBufExpl Colors
" hi MBENormal               guifg=#808080 guibg=fg
" hi MBEChanged              guifg=#CD5907 guibg=fg
" hi MBEVisibleNormal        guifg=#5DC2D6 guibg=fg
" hi MBEVisibleChanged       guifg=#F1266F guibg=fg
" hi MBEVisibleActiveNormal  guifg=#A6DB29 guibg=fg
" hi MBEVisibleActiveChanged guifg=#F1266F guibg=fg

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Nerd Tree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDTreeWinPos = "left"
let NERDTreeShowHidden=1
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
let g:NERDTreeWinSize=35
let g:NERDTreeShowLineNumbers=1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&b:NERDTreeType == "primary") | q | endif
map nb :NERDTreeFromBookmark<Space>
map nf :NERDTreeFind<cr>

" "for jedi
" let g:completor_python_binary = '/path/to/python/with/jedi/installed'
" autocmd FileType python noremap <buffer> <F8> :call Autopep8()<CR>
"for indentLine
let g:indentLine_char = "|"
let g:indentLine_enabbled = 1
"plugin config end

let g:Powerline_symbols='fancy'
let g:indentLine_enabled = 1
let g:airline_powerline_fonts = 1
" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup nobackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup nobackup

"auto add pyhton header --start  
autocmd BufNewFile *.py 0r ~/.vim/vim_template/vim_python_header  
autocmd BufNewFile *.py ks|call HeaderKey()|'s  
fun HeaderKey()  
    if line("$") > 10  
        let l = 10  "?????L ????1   
    else  
        let l = line("$")  
    endif   
    exe "1," . l . "g/File Name:.*/s/File Name:.*/File Name: " .expand("%")    
    exe "1," . l . "g/Author:.*/s/Author:.*/Author: " .system('whoami')->trim()   
    exe "1," . l . "g/Created Time:.*/s/Created Time:.*/Created Time: " .strftime("%Y-%m-%d %T")   
endfun   
"auto add python header --end  
""""""""""""""""""""""""""""""
" => auto resize
""""""""""""""""""""""""""""""
set lines=35 columns=120
winpos 300 100
let g:lens#disabled_filetypes = ['nerdtree','minibufexpl']
let g:lens#animate = 0

set guifont=Menlo:h16


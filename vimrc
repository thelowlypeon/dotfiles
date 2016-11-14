" this is peter's vimrc. it's changed a lot over the years. some of this is 
"   experimental still, but a good chunk of it is what makes me feel at home in vim.

set nocompatible               " be iMproved

" =================== Powerline =====================      
set encoding=utf-8               "Enable utf8              
let g:Powerline_symbols='unicode'  "Enable patched fonts

" load pathogen at submodule-friendly path
:source ~/.vim/bundle/pathogen/autoload/pathogen.vim 

" and more awesomeness continues...
syntax on

:set background=dark

" i can't believe people would want to wrap
:set nowrap

"oh i love me some delek
:colorscheme delek 

"line numbers
:set nu

" set shift to 4 spaces
:set expandtab
:set tabstop=4
:set shiftwidth=4
autocmd Filetype *.erb setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
autocmd Filetype ruby setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab

" t_Co=256 is necessary for tmux
:set t_Co=256
:set formatoptions+=r
:set formatoptions+=o
:set formatoptions+=c

" folding. i rarely use this because i haven't quite figured out the best solution. 
"   folding is awesome, but it doesn't always fold doc block comments, which makes the
"   whole file just look like comments
:set foldmethod=indent
:set nofoldenable
:set foldlevel=99

"sometimes smartindent is annoying, but mostly it's useful
:set smartindent
"always show tabs at top
:set laststatus=2
"show percent complete in file (location in file)
":set ruler
" display incomplete commands in the status line
set showcmd

"for less.css syntax
au BufRead,BufNewFile *.less set filetype=less
au! Syntax less source $VIM/less.vim

" allows you to match more than just single characters using %
":source ~/.vim/plugin/matchit.vim 

" NERDTree stuff
"autocmd vimenter * NERDTree
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
"autocmd vimenter * if !argc() | NERDtree |endif
let NERDTreeShowHidden=1
let g:NERDTreeDirArrows=1
let g:NERDTreeDirArrowExpandable='▸'
let g:NERDTreeDirArrowCollapsible='▾'
let g:NERDTreeGlyphReadOnly='RO'

" Press Shift+P while in visual mode to replace the selection without
" overwriting the default register
vmap P p :call setreg('"', getreg('0')) <CR>

"One of the nicer minor features of TextMate is its treatment of highlighted text.
"If you have something highlighted and type a, it replaces the text, like other editors.
"If you type (, however, it wraps the selected text in parentheses.
"This is enormously useful. Luckily, it's very easy to recreate in Vim:
vnoremap ((  <ESC>`>a)<ESC>`<i(<ESC>
vnoremap ))  <ESC>`<i(<ESC>`>a)<ESC>xp
"vnoremap {{  <ESC>`>a}<ESC>`<i{<ESC>
"vnoremap }}  <ESC>`<i{<ESC>`>a}<ESC>xp
vnoremap ""  <ESC>`>a"<ESC>`<i"<ESC>
vnoremap ''  <ESC>`>a'<ESC>`<i'<ESC>
vnoremap ``  <ESC>`>a`<ESC>`<i`<ESC>
vnoremap [[  <ESC>`>a]<ESC>`<i[<ESC>
vnoremap ]]  <ESC>`<i[<ESC>`>a]<ESC>xp

" always try and show lines above and below the cursor
set scrolloff=2
" always try and show 3 characters to the left and right of the cursor
set sidescrolloff=3
" makes scrolling with long lines easier. jump by seven characters as opposed
" to half the screen...
set sidescroll=7

" Tab completion options
" (only complete to the longest unambiguous match, and show a menu)
" to be honest, i'm not so sure about this. default behavior is to cycle through alphabetically.
" solution: use ctrlp!
set completeopt=longest,menu
set wildmode=list:longest

" highlight search results
set hlsearch
" briefly highlight matching bracket/brace/etc when completing a match
set showmatch
" only highlight match for 600 milliseconds
set matchtime=3
" hitting space clears current search
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

"allow scrolling with mouse. WHAA. note: this doesn't work natively in OS X. google that shit.
set mouse=a


" better tab completion. aka, if at the beginning of a line, then do a normal
" tab otherwise tab complete
function! BetterTab()
    if (strpart(getline('.'),col('.')-2,1)=~'^\W\?$')
        return "\<Tab>"
    else
        return "\<C-n>"
    endif
endfunction
imap <Tab> <C-R>=BetterTab()<CR>

" keep swap files elsewhere so they don't fuck up git stuff
set backupdir=~/\.vim/tmp
set directory=~/\.vim/tmp


" hit f5 before and after pasting from system clipboard to avoid that annoying autotab bullshit
set pastetoggle=<F5>

"case sensitivity:
" /copyright      " Case insensitive
" /Copyright      " Case sensitive
" /copyright\C    " Case sensitive
" /Copyright\c    " Case insensitive
:set smartcase



"===================== ctags shit ======================
set tags=~/.vim/ctags/elevated

"{{{taglist options
"" set the names of flags
let tlist_php_settings = 'php;c:class;f:function;d:constant;p:property'
" close all folds except for current file
let Tlist_File_Fold_Auto_Close = 1
" make tlist pane active when opened
let Tlist_GainFocus_On_ToggleOpen = 1
" width of window
let Tlist_WinWidth = 60
" close tlist when a selection is made
let Tlist_Close_On_Select = 1
" show the prototype
let Tlist_Display_Prototype = 1
" show tags only for current buffer
let Tlist_Show_One_File = 1
"}}}
"{{{html options
let html_use_css = 1
"}}}
"===================== end ctags shit ======================

"remove lines that are only white space
nnoremap <silent> <F6> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" pathogen for autoloading anything in ~/.vim/bundle (https://github.com/tpope/vim-pathogen)
execute pathogen#infect()

" Vim-signify settings
highlight SignColumn            ctermbg=black ctermfg=black
highlight DiffAdd    cterm=bold ctermbg=green ctermfg=black
highlight DiffDelete cterm=bold ctermbg=red   ctermfg=black
highlight DiffChange cterm=bold ctermbg=blue  ctermfg=black
let g:signify_vcs_list = [ 'git' ]
let g:signify_sign_add               = '+'
let g:signify_sign_change            = '*'
let g:signify_sign_delete            = '-'
let g:signify_sign_delete_first_line = '_'

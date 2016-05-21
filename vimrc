syntax on
:set background=dark
:set nowrap
:colorscheme delek
:set nu
:set expandtab
:set tabstop=4
:set shiftwidth=4
:set t_Co=256
"always show tabs at top
:set laststatus=2
"show percent complete in file (location in file)
:set ruler


"autocmd vimenter * NERDTree
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
"autocmd vimenter * if !argc() | NERDtree |endif

"let NERDTreeShowHidden=1

:set smartindent
:set background=light
:set number
:set softtabstop=4
:set ruler
:set hlsearch
:set showmatch
:set tags+=tags,../tags,../../tags
:set backspace=indent,eol,start
:set et
:set backup
:set backupdir=~/backup_vim
:set cinoptions=g0
:set cindent shiftwidth=4
:set cinoptions=l1
:set cinoptions=t0
filetype plugin indent on
syntax on
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

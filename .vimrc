" configure expanding of tabs for various file types
au BufRead,BufNewFile *.py set noexpandtab
au BufRead,BufNewFile *.c set expandtab
au BufRead,BufNewFile *.h set expandtab
au BufRead,BufNewFile Makefile* set noexpandtab


set tabstop=4
set visualbell
set cindent

set softtabstop=4
set shiftwidth=4


set autoindent
set smartindent
set smarttab


set incsearch
set ruler
set hlsearch
set number

set laststatus=2

syntax on
filetype on

"colorscheme molokai
"colorscheme darkblue

"colorscheme desert
"colorscheme elflord
colorscheme evening
"colorscheme koehler
"colorscheme peachpuff
"colorscheme ron

set mouse=a

nmap <S-s> a/*<CR>LGE_CHANGE_S<CR>Comment :<CR><C-R>=strftime("%Y-%m-%d")<CR>, <C-R>=$USER<CR>@lge.com<CR>*/<CR><Esc>
nmap <S-e> a/* LGE_CHANGE_E */<CR><Esc>


nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nmap <F3>  :tp<CR>
nmap <F4>  :tn<CR>

nmap <F8>  :TlistToggle<CR>

nmap <F9>  :NERDTreeToggle<CR>

nmap <F5> :NERDTreeFind<CR>
nmap <F7> :MRU<CR>

let g:NERDTreeWinPos = "right"

nmap <F11>  :MBEToggle<CR>


"noremap <C-TAB>   :MBEbn<CR>
"noremap <C-S-TAB> :MBEbp<CR>

nmap <TAB>   :MBEbn<CR>
nmap <S-TAB> :MBEbp<CR>

nmap <F6>   :MBEbd<CR>

" // The switch of the Source Explorer 
nmap <F10> :SrcExplToggle<CR> 

" // Set the height of Source Explorer window 
let g:SrcExpl_winHeight = 10

" // Set 100 ms for refreshing the Source Explorer 
let g:SrcExpl_refreshTime = 100 

" // Set "Enter" key to jump into the exact definition context 
let g:SrcExpl_jumpKey = "<ENTER>" 

" // Set "Space" key for back from the definition context 
let g:SrcExpl_gobackKey = "<SPACE>" 

" // In order to avoid conflicts, the Source Explorer should know what plugins
" // except itself are using buffers. And you need add their buffer names into
" // below listaccording to the command ":buffers!"
let g:SrcExpl_pluginList = [ 
        \ "__Tag_List__", 
        \ "_NERD_tree_" 
    \ ] 

" // Enable/Disable the local definition searching, and note that this is not 
" // guaranteed to work, the Source Explorer doesn't check the syntax for now. 
" // It only searches for a match with the keyword according to command 'gd' 
let g:SrcExpl_searchLocalDef = 1 

" // Do not let the Source Explorer update the tags file when opening 
let g:SrcExpl_isUpdateTags = 0 

" // Use 'Exuberant Ctags' with '--sort=foldcase -R .' or '-L cscope.files' to 
" // create/update the tags file 
let g:SrcExpl_updateTagsCmd = "ctags --sort=foldcase -R ." 

" // Set "<F12>" key for updating the tags file artificially 
let g:SrcExpl_updateTagsKey = "<F12>" 

" // Set "<F3>" key for displaying the previous definition in the jump list 
let g:SrcExpl_prevDefKey = "<F3>" 

" // Set "<F4>" key for displaying the next definition in the jump list 
let g:SrcExpl_nextDefKey = "<F4>"



" Use alt + hjkl to resize windows
nnoremap <M-j>      :resize -2<CR>
nnoremap <M-k>      :resize +2<CR>
nnoremap <M-h>      :vertical resize -2<CR>
nnoremap <M-l>      :vertical resize +2<CR>

" Avoid using escape
inoremap kj <ESC>

" Easy CAPS
inoremap <c-u> <ESC>viwUi
nnoremap <c-u> viwU<ESC>

" TAB in general mode will move to text buffer
nnoremap <TAB>    :bnext<CR>
" SHIFT-TAB will go back
nnoremap <S-TAB>  :bprevious<CR>

" Alternative way to save
nnoremap <C-s> :w<CR>
" Alternative way to quit
nnoremap <C-Q> :wq!<CR>
" Use control-c instead of escape
nnoremap <C-c> <ESC>
" <TAB>: completion
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" Better tabbing
vnoremap < <gv
vnoremap > >gv

" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l


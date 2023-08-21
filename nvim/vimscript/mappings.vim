" tilde for wsl
nmap <F8> ~
imap <F8> ~
cmap <F8> ~
vmap <F8> ~

nmap <silent> <leader>gd :silent! call ToDefinition("<C-r><C-w>")<cr>

" general improvements (search, ergonomics, easy netrw startup)
nmap <silent> <leader>e :Dirvish<cr>
" au FileType dirvish nmap <silent> <buffer> u -:silent! exe "bw!" bufnr()-1 ""<cr>:silent e<cr>
" au FileType dirvish nnoremap <silent> <buffer> <cr> :silent call dirvish#open("edit", 0)<cr>:silent! exe "bw!" bufnr()-1 ""<cr>:silent e<cr>
au FileType dirvish nmap <silent> <buffer> u :let g:last_dirvish_buffer=buffer_name()<cr>-:exe 'bw' .g:last_dirvish_buffer<cr>:e<cr>
au FileType dirvish nnoremap <silent> <buffer> <cr> :let g:last_dirvish_buffer=buffer_name()<cr>:silent call dirvish#open("edit", 0)<cr>:exe 'bw!' .g:last_dirvish_buffer<cr>:e<cr>
au FileType dirvish nnoremap <silent> <buffer> e "syy<C-w>l:e <C-r>s<cr>"
" au BufNew,FileType dirvish silent! cd %
au BufNew,FileType dirvish setl nornu
" au FileType dirvish nnoremap <buffer> D /.*\/$<C-b>
au FileType dirvish nnoremap <buffer> D /\ze[^/]*[/]\=$<left>\/<C-b>
au FileType dirvish nnoremap <buffer> f /\ze[^/]*[/]\=$<left>[^/]<C-b>
" create, copy, move, rename, delete files/folders
au FileType dirvish nnoremap <buffer> t :silent! !touch 
au FileType dirvish nnoremap <buffer> mk :silent! !mkdir 
au FileType dirvish nnoremap <buffer> yy "syy:silent! !cp -a <C-r>s 
au FileType dirvish nnoremap <buffer> mv "syy:silent! !mv <C-r>s 
au FileType dirvish nnoremap <silent> <buffer> dd "syy:silent! !rm -rf <C-r>s<cr>

" Nvim built-in terminal
nmap <silent> <leader>t:(term)<CR>:set nonu nornu<CR>i
tmap <Esc> <C-\><C-n>k$ " Making <esc> working inside the built-in term

" run files
au FileType python nmap <leader>r :sp<cr>:set nornu<cr>:term python3 %<cr>A
au FileType c nmap <leader>r :sp<cr>:set nornu<cr>:term gcc %;./a.out;rm a.out<cr>A
au FileType cpp nmap <leader>r :sp<cr>:set nornu<cr>:term g++ %;./a.out;rm a.out<cr>A

" comment lines
au FileType python nmap <silent> <buffer> <leader>c ml:norm I# <cr>`l2l
au FileType python vmap <silent> <buffer> <leader>c ml:norm I# <cr>`l2l
au FileType c,cpp nmap <silent> <buffer> <leader>c ml:norm I// <cr>`l3l
au FileType c,cpp vmap <silent> <buffer> <leader>c ml:norm I// <cr>`l3l
au FileType lua nmap <silent> <buffer> <leader>c ml:norm I-- <cr>`l3l
au FileType lua vmap <silent> <buffer> <leader>c ml:norm I-- <cr>`l3l
" uncomment lines
au FileType python nmap <silent> <buffer> <leader>u ml:norm _2x<cr>:set virtualedit=all<cr>`l2h:set virtualedit=<cr>
au FileType python vmap <silent> <buffer> <leader>u ml:norm _2x<cr>:set virtualedit=all<cr>`l2h:set virtualedit=<cr>
au FileType c,cpp nmap <silent> <buffer> <leader>u ml:norm _3x<cr>:set virtualedit=all<cr>`l3h:set virtualedit=<cr>
au FileType c,cpp vmap <silent> <buffer> <leader>u ml:norm _3x<cr>:set virtualedit=all<cr>`l3h:set virtualedit=<cr>
au FileType lua nmap <silent> <buffer> <leader>u ml:norm _3x<cr>:set virtualedit=all<cr>`l3h:set virtualedit=<cr>
au FileType lua vmap <silent> <buffer> <leader>u ml:norm _3x<cr>:set virtualedit=all<cr>`l3h:set virtualedit=<cr>

" mappings for regexp
cnoremap <C-g> \(\)<left><left>

" mappings for cmdline mode
cmap <C-s> ")<C-b><right><backspace>echo Sys("<cr>

command! -complete=customlist,Find -bang -nargs=1 FuzzyFind edit<bang> <args>|silent! exe "silent! cd " . cwd
nnoremap <leader>ff :FuzzyFind 

cmap <c-n> <Plug>CmdlineCompleteForward
cmap <c-p> <Plug>CmdlineCompleteBackward

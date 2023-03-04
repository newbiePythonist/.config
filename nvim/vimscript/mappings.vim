" netrw
" fu! Explore()
"     if getline(".")[col("$")-2] == "/"
"         call feedkeys("\<cr>")
"     else
"         call feedkeys("\"fyy:rightb vsp \<C-r>f\<cr>\<C-w>l\<C-w>q")
"     endif
"     return ""
" endfunction
fu! BufferDelete()
    call feedkeys(":b#|bd#")
    call feedkeys("\<cr>")
    return
endfunction

fu! VsplitDirvish()
    Dirvish
endfunction

" general improvements (search, ergonomics, easy netrw startup)
" use :b#|bd# to avoid :Le to become fullscreen
nmap <silent> <leader>q :silent! call BufferDelete()<cr>
nmap <silent> <leader>e :call VsplitDirvish()<cr>
au FileType dirvish nmap <silent> <buffer> u -
au FileType dirvish nmap <silent> <buffer> <cr> :call dirvish#open("edit", 0)<cr>
au BufNew,FileType dirvish silent! cd %
au BufNew,FileType dirvish setl nornu
" au FileType dirvish cnoremap <silent> <buffer> <cr> <cr>:redraw!<cr>:call feedkeys("\<C-l>")<cr>
au FileType dirvish nnoremap <buffer> D /.*\/$<C-b>
au FileType dirvish nnoremap <buffer> f /.*[^/]$<C-b>
" create, copy, move, rename, delete files/folders
au FileType dirvish nnoremap <buffer> t :silent! !touch 
au FileType dirvish nnoremap <buffer> mk :silent! !mkdir 
au FileType dirvish nnoremap <silent> <buffer> dd "syy:silent! !rm -rf <C-r>s<cr>:call feedkeys("\<C-l>")<cr>
au FileType dirvish nnoremap <buffer> yy "syy:silent! !cp -a <C-r>s 
au FileType dirvish nnoremap <buffer> mv "syy:silent! !mv <C-r>s 

" Nvim built-in terminal
nmap <silent> <leader>t :term<CR>:set nonu nornu<CR>i
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

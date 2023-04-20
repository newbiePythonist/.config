fu! Sys(arg1)
    return substitute(system(a:arg1), ".*J", "", "")
endf

fu! Fuzzy()
    enew
    read !find -type f
    cnoremap <buffer> / \/
    nnoremap <buffer> <cr> gf:bd! #<cr>
endf

fu! Find(A,L,P)
    if a:A =~ "/"
        return split(Sys("fd -H -tf | grep " . a:A), "\n")
    else   
        return split(Sys("fd -H -tf -g " . a:A), "\n")
    endif
endf

fu! Cd(path = ".")
    if a:path != "."
        exe "cd " . a:path
        return
    endif
    cd .
endf

fu! FuzzyFindMaps()
    cnoremap <space> <cr>:silent! call Cr()<cr>:FuzzyFind 
    fu! Unmap()
        cnoremap <space> <space>
        cnoremap <cr> <cr>
        cnoremap <C-c> <C-c>
        cnoremap <Esc> <Esc>
    endf
    cnoremap <C-c> <C-c>:silent! call Unmap()<cr><cr>
    cnoremap <Esc> <Esc>:silent! call Unmap()<cr><cr>
    fu! Cr()
        cnoremap <space> <space>
        cnoremap <silent> <cr> <cr>:silent! call Unmap()<cr><cr>
    endf
endf

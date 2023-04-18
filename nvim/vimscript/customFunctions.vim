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
    return split(Sys("fd -H -tf --full-path | grep " . a:A), "\n")
endf

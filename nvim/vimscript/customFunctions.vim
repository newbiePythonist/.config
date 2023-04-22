fu! Sys(arg1)
    return substitute(system(a:arg1), ".*J", "", "")
endfu

fu! Fuzzy()
    enew
    read !find -type f
    cnoremap <buffer> / \/
    nnoremap <buffer> <cr> gf:bd! #<cr>
endfu

fu! ToDefinition(funcname)
    let l:keyword = input("Func definition keyword: ")
    let l:ft = &ft
    " let l:rawDef = Sys("grep -nr " . keyword . "'.*" . a:funcname . "(' | head -n 1 | sed 's/\\(^[^:]*\\):\\([0-9]*\\)/\\2 \\1/'")
    " let l:filename = substitute(rawDef, "^\\d* \\|:.*", "", "g")
    " let l:linenr = substitute(rawDef, "\\(^\\d*\\).*", "\\1", "")

    let l:rawDef = Sys("rg -. --no-heading -t " . ft . " -ne '" . keyword . ".*" . a:funcname . "\\(' | head -n 1 | sed 's/\\(^[^:]*\\):\\([0-9]*\\)/\\2 \\1/'")
    let l:filename = substitute(rawDef, "^\\d* \\|:.*", "", "g")
    let l:linenr = substitute(rawDef, "\\(^\\d*\\).*", "\\1", "")

    exe "e! " . filename
    exe linenr
endfu

fu! Find(A,L,P)
    if a:A =~ "/"
        return split(Sys("fd -H -tf | grep " . a:A), "\n")
    else   
        return split(Sys("fd -H -tf -g " . a:A), "\n")
    endif
endfu

fu! Cd(path = ".")
    if a:path != "."
        exe "cd " . a:path
        return
    endif
    cd .
endfu

fu! FuzzyFindMaps()
    cnoremap <space> <cr>:silent! call Cr()<cr>:FuzzyFind 
    cnoremap <C-c> <C-c>:silent! call Unmap()<cr><cr>
    cnoremap <Esc> <C-c>:silent! call Unmap()<cr><cr>
    fu! Cr()
        cnoremap <space> <space>
        cnoremap <silent> <cr> <cr>:silent! call Unmap()<cr><cr>
    endfu
    fu! Unmap()
        exe "cunmap <Esc>"
        cnoremap <space> <space>
        cnoremap <cr> <cr>
        cnoremap <C-c> <C-c>
    endfu
endfu

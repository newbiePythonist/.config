" fu! Sys(arg1)
"     return substitute(system(a:arg1), ".*J", "", "")
" endfu

fu! Fuzzy()
    enew
    read !find -type f
    cnoremap <buffer> / \/
    nnoremap <buffer> <cr> gf:bd! #<cr>
endfu

" ripgrep function to delete (indentation issues due to py filetype instead of python)
fu! ToDefinition(funcname)
    let l:keyword = input("Func definition keyword: ")

    let l:rawDef = Sys("rg -. --no-heading -t " . &ft . " -ne '" . keyword . ".*" . a:funcname . "\\(' | head -n 1 | sed 's/\\(^[^:]*\\):\\([0-9]*\\)/\\2 \\1/'")
    let l:filename = substitute(rawDef, "^\\d* \\|:.*", "", "g")
    let l:linenr = substitute(rawDef, "\\(^\\d*\\).*", "\\1", "")

    exe "e! " . filename
    exe linenr
endfu

fu! Find(A,L,P)
    if a:A =~ "/" || a:A =~ "$" || a:A =~ "\\"
        return split(Sys("fd -H -tf | grep " . a:A), "\n")
    else   
        return split(Sys("fd -H -tf -g " . a:A), "\n")
    endif
endfu

fu! PyCompleteArgs()
    let g:args=split(substitute(getline('.'), '.*(\|):$', '', 'g'), ', ')
    if g:args[0] =~ 'self'
        call remove(g:args, 0)
    endif

    for i in range(len(g:args))
        let g:args[i] = substitute(g:args[i], '\(\w*\)', '\t\tself.\1 = \1', '')
    endfor
    put=g:args
    norm! =()
endfu

fu! GoToTag()
    " check if cursor is at end of line
    if col('.')+1 == col('$')
        norm! he
    endif
    " check if cursor is on "(
    if getline('.')[col('.')-1] == '('
        norm! h
    else
        norm! e
    endif

    if getline('.')[col('.')] == '('
        exe 'tag '. expand('<cword>') . '('
    else
        exe 'tag '. expand('<cword>')
    endif
endfu

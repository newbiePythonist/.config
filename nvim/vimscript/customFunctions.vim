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
        return split(system('fd -H -tf | rg "' . a:A .'"'), "\n")
    else   
        return split(system("fd -H -tf -g " . a:A), "\n")
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
        norm! 2h
    endif
    " make sure cursor is not on opening bracket
    if getline('.')[col('.')-1] != '('
        norm! he
    endif

    " if char next to cursor is ( expand TAG+(
    if getline('.')[col('.')] == '('
        exe 'tag '. expand('<cword>') . '('
    " if char next to cursor is not ( expand TAG
    else
        exe 'tag '. expand('<cword>')
    endif
endfu

fu! PopupMenu()
    " don't trigger menu if line is empty
    if match(getline(line('.')), '^\s*$') == 0
        return
    endif
    " don't trigger menu if there's a space 1 before cursor
    if getline('.')[col('.')-2] == ' '
        return
    endif
    " don't trigger menu if 1 char before cursor there is not a word character or an underscore
    if match(getline('.')[col('.')-2], '\w\|_')
        return
    endif

    " trigger popup menu only if it's not already visible
    if pumvisible() == 0
        call feedkeys("\<C-x>\<C-u>")
        " call feedkeys("\<C-n>")
        return
    else
        call feedkeys("\<C-e>\<C-x>\<C-u>")
    endif
endfu

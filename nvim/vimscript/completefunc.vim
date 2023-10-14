fu! MyCompFunc(findstart, base)
    if a:findstart
        " locate the start of the word
        let line = getline('.')
        let start = col('.') - 1
        while start > 0 && line[start - 1] =~ '\a'
            let start -= 1
        endwhile
        return start
    else
        let matches = []
        let l:pattern = '^\s*\w\+ \zs' .a:base .'\w\+(\|^\s*\w\+ \zs' .a:base .'\w\+\ze\( =\|;\)'
        for line in getline(1, '$')
            " let curLine = matchstr(line, '^\s*def \zs' .a:base .'\w\+(\|^\s*\zs' .a:base .'\w\+\ze\s*=')
            let curLine = matchstr(line, l:pattern)
            call complete_add(curLine)
            " call add(matches, curLine)
        endfor
    endif
endfu

set completefunc=MyCompFunc

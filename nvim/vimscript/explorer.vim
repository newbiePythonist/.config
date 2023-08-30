fu! ExplorerKeepBuf()
    let g:bufnr=bufnr()
    nmap <leader>e :exe 'b' .g:bufnr<cr>
endfu

fu! SortFiles()
    silent! sort ,^\v(.*[\/])|\ze,
endfu

fu! CrBehavior()
    " check if it's a file
    if getline('.')[col('$')-2] != '/'
        setl nomod
        call ExplorerKeepBuf()
        silent! exe 'e ' .getline('.')
        return
    endif
    " check if it's a dir
    if getline('.')[col('$')-2] == '/'
        " check if dir is expanded, then toggle
        if getline(line('.')+1) =~ getline('.')
            norm! ml
            silent exe 'g:' .getline(".") .'.:d'
            norm! `l
            return
        " check if dir is not expanded, then toggle
        else
            norm! ml
            let l:linenr=line('.')+1
            let l:content=split(system("ls -adF " .getline('.') .'*'), '\n')
            put=l:content
            norm! `l
            let g:sum=line('.')+len(l:content)
            exe l:linenr .',' .g:sum .'sort ,^\v(.*[\/])|\ze,'
            " silent exe l:linenr .',' .g:sum .'s/^/ /'
            norm! `l
            return
        endif
    endif
endfu

" nmap <silent> <leader>e :enew<cr>:setl ft=explorer<cr>:r !ls -adF *<cr>gg"_dd:so ~/.config/nvim/vimscript/explorer.vim<cr>:call SortFiles()<cr>
setl nonu nornu nobuflisted hidden conceallevel=2
setl concealcursor=n
exe 'setl statusline=' .substitute(getcwd(), '^[^f]*files\/', '', '')
mapclear <buffer>

au TextChanged,TextChangedI * setl nomod

" highlight folders
syntax match ExplorerTailDir "[^/]*\/$"
syntax match pathHead "[^/]\+\ze\/[^\n]" conceal cchar= 
syntax match pathTail "\/\ze[^\n]" conceal cchar= 
hi ExplorerTailDir gui=bold guifg=blue guibg=none

" open, close folder and edit file
nmap <silent> <buffer> <cr> :call CrBehavior()<cr>

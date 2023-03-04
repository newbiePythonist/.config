" autocmd FileType python so ~/.config/nvim/vimscript/autocmds/python.vim

autocmd FileType python
            \ autocmd InsertLeave,BufWrite <buffer> %s/\(^\s*\)\(if \|elif \|els\|while \|for \|def \|class \|with \|tr\|except \|finall\)\(.*\)\([^:]$\)/\1\2\3\4:/e

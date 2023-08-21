autocmd FileType python
            \ autocmd InsertLeave,BufWrite <buffer> %s/\(^\s*\)\(if \|elif \|els\|while \|for \|def \|class \|with \|tr\|except \|finall\)\(.*\)\([^:]$\)/\1\2\3\4:/e

au BufWrite,BufWritePre,BufWritePost * call delete(swapname("%"))
au VimEnter luafile ~/.config/nvim/lua/resetLspSyntax.lua

au ColorScheme * luafile ~/.config/nvim/lua/resetLspSyntax.lua
au ColorScheme * hi Comment gui=none|hi CursorLine gui=none

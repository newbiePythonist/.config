autocmd FileType python
            \ autocmd InsertLeave,BufWrite <buffer> %s/\(^\s*\)\(if \|elif \|els\|while \|for \|def \|class \|with \|tr\|except \|finall\)\(.*\)\([^:]$\)/\1\2\3\4:/e

au BufWrite,BufWritePre,BufWritePost * call delete(swapname("%"))
au VimEnter luafile ~/.config/nvim/lua/resetLspSyntax.lua

au ColorScheme * luafile ~/.config/nvim/lua/resetLspSyntax.lua
au ColorScheme * hi Comment gui=none|hi CursorLine gui=none

augroup dirvish_config
    autocmd!
    au BufNew,BufEnter,FileType dirvish setl nornu|setl conceallevel=0|nunmap <buffer> p
    autocmd FileType dirvish
                \ nnoremap <silent><buffer> o ddO<Esc>:let @"=substitute(@", '\n', '', 'g')<CR>:r ! find "<C-R>"" -maxdepth 1 -print0 \| xargs -0 ls -Fd<CR>:silent! keeppatterns %s/\/\//\//g<CR>:silent! keeppatterns %s/[^a-zA-Z0-9\/]$//g<CR>:silent! keeppatterns g/^$/d<CR>:noh<CR>
augroup END

fu! Vsp()
    if &ft == 'NvimTree'
        rightb vsp
        enew
    endif
endfu
au VimEnter * call Vsp()

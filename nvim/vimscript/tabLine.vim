function! MyTabLine()
  let s = ''
  " loop through each tab page
  for i in range(tabpagenr('$'))
    if i + 1 == tabpagenr()
      let s .= '|%#TabLineSel#'
    else
      let s .= '%#TabLine#|'
    endif
    " get buffer names and statuses
    let n = ''  " temp str for buf names
    " let m = 0   " &modified counter
    let buflist = tabpagebuflist(i + 1)
    " loop through each buffer in a tab
    for b in buflist
      if getbufvar(b, "&buftype") == 'help'
        " let n .= '[H]' . fnamemodify(bufname(b), ':t:s/.txt$//')
      elseif getbufvar(b, "&buftype") == 'quickfix'
        " let n .= '[Q]'
      elseif getbufvar(b, "&modifiable")
        let n .= fnamemodify(bufname(b), ':t') . '' " pathshorten(bufname(b))
      endif
    endfor
    let n = substitute(n, ', $', '', '')
    " add modified label
    if i + 1 == tabpagenr()
      let s .= ' %#TabLineSel#'
    else
      let s .= '%#TabLine# '
    endif
    " add buffer names
    if n == '|'
      let s.= '[No Name]'
    else
      let s .= n
    endif
    " switch to no underlining and add final space
    let s .= ' '
  endfor
  let s .= '%#TabLineFill#%'
  return s
endfunction

set tabline=%!MyTabLine()  " custom tab pages line

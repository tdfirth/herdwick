function! herdwick#get_palette()
    if &background ==# 'dark'
      let palette = {
            \ 'bg0':        ['#1F2933',   '235'],
            \ 'bg1':        ['#323F4B',   '236'],
            \ 'bg2':        ['#3E4C59',   '237'],
            \ 'bg3':        ['#52606D',   '238'],
            \ 'bg4':        ['#616E7C',   '239'],
            \ 'bg5':        ['#7B8794',   '240'],
            \ 'bg_visual':  ['#323F4B',   '52'],
            \ 'bg_red':     ['#610316',   '52'],
            \ 'bg_green':   ['#014D40',   '22'],
            \ 'bg_blue':    ['#003E6B',   '17'],
            \ 'fg':         ['#F5F7FA',   '223'],
            \ 'red':        ['#FFBDBD',   '167'],
            \ 'orange':     ['#FFD0B5',   '208'],
            \ 'yellow':     ['#FFF3C4',   '214'],
            \ 'green':      ['#C1F2C7',   '142'],
            \ 'aqua':       ['#C6F7E2',   '108'],
            \ 'blue':       ['#B3ECFF',   '109'],
            \ 'purple':     ['#FFB8D2',   '175'],
            \ 'grey1':      ['#7B8794',   '245'],
            \ 'grey2':      ['#CBD2D9',   '247'],
            \ 'none':       ['NONE',      'NONE']
            \ }
    else
      let palette = {
            \ 'bg0':        ['#fff9e8',   '230'],
            \ 'bg1':        ['#f7f4e0',   '228'],
            \ 'bg2':        ['#f0eed9',   '223'],
            \ 'bg3':        ['#e9e8d2',   '223'],
            \ 'bg4':        ['#e1ddcb',   '223'],
            \ 'bg5':        ['#bec5b2',   '223'],
            \ 'bg_visual':  ['#edf0cd',   '194'],
            \ 'bg_red':     ['#fce5dc',   '217'],
            \ 'bg_green':   ['#f1f3d4',   '194'],
            \ 'bg_blue':    ['#eaf2eb',   '117'],
            \ 'fg':         ['#5c6a72',   '242'],
            \ 'red':        ['#f85552',   '160'],
            \ 'orange':     ['#f57d26',   '116'],
            \ 'yellow':     ['#dfa000',   '136'],
            \ 'green':      ['#8da101',   '106'],
            \ 'aqua':       ['#35a77c',   '37'],
            \ 'blue':       ['#3a94c5',   '32'],
            \ 'purple':     ['#df69ba',   '162'],
            \ 'grey1':      ['#939f91',   '247'],
            \ 'grey2':      ['#829181',   '247'],
            \ 'none':       ['NONE',      'NONE']
            \ }
    endif
  return palette
endfunction

let g:herdwick#tmux = executable('tmux') && $TMUX !=# '' ?
                  \ (str2float(system("tmux -V | grep -oE '[0-9]+\.[0-9]*'")) < 2.9 ?
                    \ 1 :
                    \ 0) :
                  \ 0

function! herdwick#highlight(group, fg, bg, ...)
  execute 'highlight' a:group
        \ 'guifg=' . a:fg[0]
        \ 'guibg=' . a:bg[0]
        \ 'ctermfg=' . a:fg[1]
        \ 'ctermbg=' . a:bg[1]
        \ 'gui=' . (a:0 >= 1 ?
          \ (a:1 ==# 'undercurl' ?
            \ (g:herdwick#tmux ?
              \ 'underline' :
              \ 'undercurl') :
            \ a:1) :
          \ 'NONE')
        \ 'cterm=' . (a:0 >= 1 ?
          \ (a:1 ==# 'undercurl' ?
            \ 'underline' :
            \ a:1) :
          \ 'NONE')
        \ 'guisp=' . (a:0 >= 2 ?
          \ a:2[0] :
          \ 'NONE')
endfunction

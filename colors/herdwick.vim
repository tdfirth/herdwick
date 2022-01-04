" Initialization: {{{
let s:palette = herdwick#get_palette()
let s:path = expand('<sfile>:p') " the path of this script
let s:last_modified = 'Fri Dec 17 01:54:50 UTC 2021'
let g:herdwick_loaded_file_types = []

if !(exists('g:colors_name') && g:colors_name ==# 'herdwick')
  highlight clear
  if exists('syntax_on')
    syntax reset
  endif
endif

let g:colors_name = 'herdwick'

if !(has('termguicolors') && &termguicolors) && !has('gui_running') && &t_Co != 256
  finish
endif
" }}}
" Common Highlight Groups: {{{
" UI: {{{
call herdwick#highlight('Normal', s:palette.fg, s:palette.bg0)
call herdwick#highlight('Terminal', s:palette.fg, s:palette.bg0)
call herdwick#highlight('EndOfBuffer', s:palette.bg4, s:palette.bg0)
call herdwick#highlight('Folded', s:palette.grey1, s:palette.bg1)
call herdwick#highlight('ToolbarLine', s:palette.fg, s:palette.bg2)
call herdwick#highlight('FoldColumn', s:palette.grey2, s:palette.bg1)
call herdwick#highlight('SignColumn', s:palette.fg, s:palette.none)
call herdwick#highlight('IncSearch', s:palette.bg0, s:palette.purple)
call herdwick#highlight('Search', s:palette.bg0, s:palette.green)
call herdwick#highlight('ColorColumn', s:palette.none, s:palette.bg1)
call herdwick#highlight('Conceal', s:palette.bg5, s:palette.none)
call herdwick#highlight('Cursor', s:palette.none, s:palette.none, 'reverse')
highlight! link vCursor Cursor
highlight! link iCursor Cursor
highlight! link lCursor Cursor
highlight! link CursorIM Cursor
if &diff
  call herdwick#highlight('CursorLine', s:palette.none, s:palette.none, 'underline')
  call herdwick#highlight('CursorColumn', s:palette.none, s:palette.none, 'bold')
else
  call herdwick#highlight('CursorLine', s:palette.none, s:palette.bg1)
  call herdwick#highlight('CursorColumn', s:palette.none, s:palette.bg1)
endif
call herdwick#highlight('LineNr', s:palette.bg5, s:palette.none)
if &diff
  call herdwick#highlight('CursorLineNr', s:palette.grey1, s:palette.none, 'underline')
else
  call herdwick#highlight('CursorLineNr', s:palette.grey1, s:palette.bg1)
endif
call herdwick#highlight('DiffAdd', s:palette.none, s:palette.bg_green)
call herdwick#highlight('DiffChange', s:palette.none, s:palette.bg_blue)
call herdwick#highlight('DiffDelete', s:palette.none, s:palette.bg_red)
call herdwick#highlight('DiffText', s:palette.bg0, s:palette.blue)
call herdwick#highlight('Directory', s:palette.green, s:palette.none)
call herdwick#highlight('ErrorMsg', s:palette.red, s:palette.none, 'bold,underline')
call herdwick#highlight('WarningMsg', s:palette.yellow, s:palette.none, 'bold')
call herdwick#highlight('ModeMsg', s:palette.fg, s:palette.none, 'bold')
call herdwick#highlight('MoreMsg', s:palette.yellow, s:palette.none, 'bold')
call herdwick#highlight('MatchParen', s:palette.none, s:palette.bg4)
call herdwick#highlight('NonText', s:palette.bg4, s:palette.none)
call herdwick#highlight('Whitespace', s:palette.bg4, s:palette.none)
call herdwick#highlight('SpecialKey', s:palette.bg3, s:palette.none)
call herdwick#highlight('Pmenu', s:palette.fg, s:palette.bg2)
call herdwick#highlight('PmenuSbar', s:palette.none, s:palette.bg2)
call herdwick#highlight('PmenuSel', s:palette.bg0, s:palette.green)
highlight! link WildMenu PmenuSel
call herdwick#highlight('PmenuThumb', s:palette.none, s:palette.bg5)
call herdwick#highlight('NormalFloat', s:palette.fg, s:palette.bg2)
call herdwick#highlight('Question', s:palette.yellow, s:palette.none)
call herdwick#highlight('SpellBad', s:palette.none, s:palette.none, 'undercurl', s:palette.red)
call herdwick#highlight('SpellCap', s:palette.none, s:palette.none, 'undercurl', s:palette.blue)
call herdwick#highlight('SpellLocal', s:palette.none, s:palette.none, 'undercurl', s:palette.aqua)
call herdwick#highlight('SpellRare', s:palette.none, s:palette.none, 'undercurl', s:palette.purple)
call herdwick#highlight('StatusLine', s:palette.grey1, s:palette.bg1)
call herdwick#highlight('StatusLineTerm', s:palette.grey1, s:palette.bg1)
call herdwick#highlight('StatusLineNC', s:palette.grey1, s:palette.bg0)
call herdwick#highlight('StatusLineTermNC', s:palette.grey1, s:palette.bg0)
call herdwick#highlight('TabLine', s:palette.grey2, s:palette.bg3)
call herdwick#highlight('TabLineFill', s:palette.grey1, s:palette.bg1)
call herdwick#highlight('TabLineSel', s:palette.bg0, s:palette.green)
call herdwick#highlight('VertSplit', s:palette.bg4, s:palette.none)
call herdwick#highlight('Visual', s:palette.none, s:palette.bg1)
call herdwick#highlight('VisualNOS', s:palette.none, s:palette.bg1)
call herdwick#highlight('QuickFixLine', s:palette.purple, s:palette.none, 'bold')
call herdwick#highlight('Debug', s:palette.orange, s:palette.none)
call herdwick#highlight('debugPC', s:palette.bg0, s:palette.green)
call herdwick#highlight('debugBreakpoint', s:palette.bg0, s:palette.red)
call herdwick#highlight('ToolbarButton', s:palette.bg0, s:palette.green)
call herdwick#highlight('Substitute', s:palette.bg0, s:palette.purple)

highlight! link DiagnosticFloatingError ErrorFloat
highlight! link DiagnosticFloatingWarn WarningFloat
highlight! link DiagnosticFloatingInfo InfoFloat
highlight! link DiagnosticFloatingHint HintFloat
highlight! link DiagnosticError ErrorText
highlight! link DiagnosticWarn WarningText
highlight! link DiagnosticInfo InfoText
highlight! link DiagnosticHint HintText
highlight! link DiagnosticVirtualTextError VirtualTextError
highlight! link DiagnosticVirtualTextWarn VirtualTextWarning
highlight! link DiagnosticVirtualTextInfo VirtualTextInfo
highlight! link DiagnosticVirtualTextHint VirtualTextHint
highlight! link DiagnosticUnderlineError ErrorText
highlight! link DiagnosticUnderlineWarn WarningText
highlight! link DiagnosticUnderlineInfo InfoText
highlight! link DiagnosticUnderlineHint HintText
highlight! link DiagnosticSignError RedSign
highlight! link DiagnosticSignWarn YellowSign
highlight! link DiagnosticSignInfo BlueSign
highlight! link DiagnosticSignHint AquaSign
highlight! link LspDiagnosticsFloatingError ErrorFloat
highlight! link LspDiagnosticsFloatingWarning WarningFloat
highlight! link LspDiagnosticsFloatingInformation InfoFloat
highlight! link LspDiagnosticsFloatingHint HintFloat
highlight! link LspDiagnosticsDefaultError ErrorText
highlight! link LspDiagnosticsDefaultWarning WarningText
highlight! link LspDiagnosticsDefaultInformation InfoText
highlight! link LspDiagnosticsDefaultHint HintText
highlight! link LspDiagnosticsVirtualTextError VirtualTextError
highlight! link LspDiagnosticsVirtualTextWarning VirtualTextWarning
highlight! link LspDiagnosticsVirtualTextInformation VirtualTextInfo
highlight! link LspDiagnosticsVirtualTextHint VirtualTextHint
highlight! link LspDiagnosticsUnderlineError ErrorText
highlight! link LspDiagnosticsUnderlineWarning WarningText
highlight! link LspDiagnosticsUnderlineInformation InfoText
highlight! link LspDiagnosticsUnderlineHint HintText
highlight! link LspDiagnosticsSignError RedSign
highlight! link LspDiagnosticsSignWarning YellowSign
highlight! link LspDiagnosticsSignInformation BlueSign
highlight! link LspDiagnosticsSignHint AquaSign
highlight! link LspReferenceText CurrentWord
highlight! link LspReferenceRead CurrentWord
highlight! link LspReferenceWrite CurrentWord
highlight! link TermCursor Cursor
highlight! link healthError Red
highlight! link healthSuccess Green
highlight! link healthWarning Yellow
" }}}
" Syntax: {{{
call herdwick#highlight('Boolean', s:palette.purple, s:palette.none)
call herdwick#highlight('Number', s:palette.purple, s:palette.none)
call herdwick#highlight('Float', s:palette.purple, s:palette.none)
call herdwick#highlight('PreProc', s:palette.purple, s:palette.none, 'italic')
call herdwick#highlight('PreCondit', s:palette.purple, s:palette.none, 'italic')
call herdwick#highlight('Include', s:palette.purple, s:palette.none, 'italic')
call herdwick#highlight('Define', s:palette.purple, s:palette.none, 'italic')
call herdwick#highlight('Conditional', s:palette.red, s:palette.none, 'italic')
call herdwick#highlight('Repeat', s:palette.red, s:palette.none, 'italic')
call herdwick#highlight('Keyword', s:palette.fg, s:palette.none)
call herdwick#highlight('Typedef', s:palette.red, s:palette.none, 'italic')
call herdwick#highlight('Exception', s:palette.red, s:palette.none, 'italic')
call herdwick#highlight('Statement', s:palette.red, s:palette.none, 'italic')
call herdwick#highlight('Error', s:palette.red, s:palette.none)
call herdwick#highlight('StorageClass', s:palette.orange, s:palette.none)
call herdwick#highlight('Tag', s:palette.orange, s:palette.none)
call herdwick#highlight('Label', s:palette.orange, s:palette.none)
call herdwick#highlight('Structure', s:palette.orange, s:palette.none)
call herdwick#highlight('Operator', s:palette.orange, s:palette.none)
call herdwick#highlight('Title', s:palette.orange, s:palette.none, 'bold')
call herdwick#highlight('Special', s:palette.yellow, s:palette.none)
call herdwick#highlight('SpecialChar', s:palette.yellow, s:palette.none)
call herdwick#highlight('Type', s:palette.yellow, s:palette.none)
call herdwick#highlight('Function', s:palette.green, s:palette.none)
call herdwick#highlight('String', s:palette.grey2, s:palette.none, 'italic')
call herdwick#highlight('Character', s:palette.green, s:palette.none)
call herdwick#highlight('Constant', s:palette.aqua, s:palette.none)
call herdwick#highlight('Macro', s:palette.aqua, s:palette.none)
call herdwick#highlight('Identifier', s:palette.blue, s:palette.none)
call herdwick#highlight('Comment', s:palette.grey1, s:palette.none, 'italic')
call herdwick#highlight('SpecialComment', s:palette.grey1, s:palette.none)
call herdwick#highlight('Todo', s:palette.purple, s:palette.none)
call herdwick#highlight('Delimiter', s:palette.fg, s:palette.none)
call herdwick#highlight('Ignore', s:palette.grey1, s:palette.none)
call herdwick#highlight('Underlined', s:palette.none, s:palette.none, 'underline')
" }}}
" Predefined Highlight Groups: {{{
call herdwick#highlight('Fg', s:palette.fg, s:palette.none)
call herdwick#highlight('FgBold', s:palette.fg, s:palette.none, 'bold')
call herdwick#highlight('FgItalic', s:palette.fg, s:palette.none, 'italic')
call herdwick#highlight('Grey', s:palette.grey1, s:palette.none)
call herdwick#highlight('Red', s:palette.red, s:palette.none)
call herdwick#highlight('Orange', s:palette.orange, s:palette.none)
call herdwick#highlight('Yellow', s:palette.yellow, s:palette.none)
call herdwick#highlight('Green', s:palette.green, s:palette.none)
call herdwick#highlight('Aqua', s:palette.aqua, s:palette.none)
call herdwick#highlight('Blue', s:palette.blue, s:palette.none)
call herdwick#highlight('Purple', s:palette.purple, s:palette.none)
call herdwick#highlight('RedItalic', s:palette.red, s:palette.none, 'italic')
call herdwick#highlight('OrangeItalic', s:palette.orange, s:palette.none, 'italic')
call herdwick#highlight('YellowItalic', s:palette.yellow, s:palette.none, 'italic')
call herdwick#highlight('GreenItalic', s:palette.green, s:palette.none, 'italic')
call herdwick#highlight('AquaItalic', s:palette.aqua, s:palette.none, 'italic')
call herdwick#highlight('BlueItalic', s:palette.blue, s:palette.none, 'italic')
call herdwick#highlight('PurpleItalic', s:palette.purple, s:palette.none, 'italic')
call herdwick#highlight('RedSign', s:palette.red, s:palette.bg1)
call herdwick#highlight('OrangeSign', s:palette.orange, s:palette.bg1)
call herdwick#highlight('YellowSign', s:palette.yellow, s:palette.bg1)
call herdwick#highlight('GreenSign', s:palette.green, s:palette.bg1)
call herdwick#highlight('AquaSign', s:palette.aqua, s:palette.bg1)
call herdwick#highlight('BlueSign', s:palette.blue, s:palette.bg1)
call herdwick#highlight('PurpleSign', s:palette.purple, s:palette.bg1)
call herdwick#highlight('ErrorText', s:palette.none, s:palette.none, 'undercurl', s:palette.red)
call herdwick#highlight('WarningText', s:palette.none, s:palette.none, 'undercurl', s:palette.yellow)
call herdwick#highlight('InfoText', s:palette.none, s:palette.none, 'undercurl', s:palette.blue)
call herdwick#highlight('HintText', s:palette.none, s:palette.none, 'undercurl', s:palette.green)
highlight clear ErrorLine
highlight clear WarningLine
highlight clear InfoLine
highlight clear HintLine
highlight! link VirtualTextWarning Grey
highlight! link VirtualTextError Grey
highlight! link VirtualTextInfo Grey
highlight! link VirtualTextHint Grey
call herdwick#highlight('ErrorFloat', s:palette.red, s:palette.bg2)
call herdwick#highlight('WarningFloat', s:palette.yellow, s:palette.bg2)
call herdwick#highlight('InfoFloat', s:palette.blue, s:palette.bg2)
call herdwick#highlight('HintFloat', s:palette.green, s:palette.bg2)
if &diff
  call herdwick#highlight('CurrentWord', s:palette.bg0, s:palette.green)
else
  call herdwick#highlight('CurrentWord', s:palette.none, s:palette.bg2)
endif
" }}}
" }}}
" Terminal: {{{
if (has('termguicolors') && &termguicolors) || has('gui_running')
  " Definition
  let s:terminal = {
        \ 'black':    s:palette.bg3,
        \ 'red':      s:palette.red,
        \ 'yellow':   s:palette.yellow,
        \ 'green':    s:palette.green,
        \ 'cyan':     s:palette.aqua,
        \ 'blue':     s:palette.blue,
        \ 'purple':   s:palette.purple,
        \ 'white':    s:palette.fg
        \ }
  " Implementation: {{{
  if !has('nvim')
    let g:terminal_ansi_colors = [s:terminal.black[0], s:terminal.red[0], s:terminal.green[0], s:terminal.yellow[0],
          \ s:terminal.blue[0], s:terminal.purple[0], s:terminal.cyan[0], s:terminal.white[0], s:terminal.black[0], s:terminal.red[0],
          \ s:terminal.green[0], s:terminal.yellow[0], s:terminal.blue[0], s:terminal.purple[0], s:terminal.cyan[0], s:terminal.white[0]]
  else
    let g:terminal_color_0 = s:terminal.black[0]
    let g:terminal_color_1 = s:terminal.red[0]
    let g:terminal_color_2 = s:terminal.green[0]
    let g:terminal_color_3 = s:terminal.yellow[0]
    let g:terminal_color_4 = s:terminal.blue[0]
    let g:terminal_color_5 = s:terminal.purple[0]
    let g:terminal_color_6 = s:terminal.cyan[0]
    let g:terminal_color_7 = s:terminal.white[0]
    let g:terminal_color_8 = s:terminal.black[0]
    let g:terminal_color_9 = s:terminal.red[0]
    let g:terminal_color_10 = s:terminal.green[0]
    let g:terminal_color_11 = s:terminal.yellow[0]
    let g:terminal_color_12 = s:terminal.blue[0]
    let g:terminal_color_13 = s:terminal.purple[0]
    let g:terminal_color_14 = s:terminal.cyan[0]
    let g:terminal_color_15 = s:terminal.white[0]
  endif
  " }}}
endif
" }}}
" Plugins: {{{
" nvim-treesitter/nvim-treesitter {{{
call herdwick#highlight('TSStrong', s:palette.none, s:palette.none, 'bold')
call herdwick#highlight('TSEmphasis', s:palette.none, s:palette.none, 'bold')
call herdwick#highlight('TSUnderline', s:palette.none, s:palette.none, 'underline')
call herdwick#highlight('TSNote', s:palette.bg0, s:palette.blue, 'bold')
call herdwick#highlight('TSWarning', s:palette.bg0, s:palette.yellow, 'bold')
call herdwick#highlight('TSDanger', s:palette.bg0, s:palette.red, 'bold')
highlight! link TSAnnotation Fg
highlight! link TSAttribute Fg
highlight! link TSBoolean Fg
highlight! link TSCharacter Fg
highlight! link TSComment Comment
highlight! link TSConditional Fg
highlight! link TSConstBuiltin Fg
highlight! link TSConstMacro Fg
highlight! link TSConstant Fg
highlight! link TSConstructor Fg
highlight! link TSException Fg
highlight! link TSField Fg
highlight! link TSFloat Fg
highlight! link TSFuncBuiltin Fg
highlight! link TSFuncMacro Fg
highlight! link TSFunction Fg
highlight! link TSInclude Fg
highlight! link TSKeyword Keyword
highlight! link TSKeywordFunction Fg
highlight! link TSKeywordOperator Fg
highlight! link TSLabel Fg
highlight! link TSMethod Fg
highlight! link TSNamespace Fg
highlight! link TSNone Fg
highlight! link TSNumber Fg
highlight! link TSOperator Fg
highlight! link TSParameter Fg
highlight! link TSParameterReference Fg
highlight! link TSProperty Fg
highlight! link TSPunctBracket Fg
highlight! link TSPunctDelimiter Fg
highlight! link TSPunctSpecial Fg
highlight! link TSRepeat Fg
highlight! link TSString String
highlight! link TSStringEscape Fg
highlight! link TSStringRegex Fg
highlight! link TSStructure Fg
highlight! link TSSymbol Fg
highlight! link TSTag Fg
highlight! link TSTagDelimiter Fg
highlight! link TSText Fg
highlight! link TSStrike Fg
highlight! link TSMath Fg
highlight! link TSType Fg
highlight! link TSTypeBuiltin Fg
highlight! link TSURI markdownUrl
highlight! link TSVariable Fg
highlight! link TSVariableBuiltin Fg
" }}}
" junegunn/fzf.vim {{{
let g:fzf_colors = {
      \ 'fg':      ['fg', 'Normal'],
      \ 'bg':      ['bg', 'Normal'],
      \ 'hl':      ['fg', 'Green'],
      \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
      \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
      \ 'hl+':     ['fg', 'Aqua'],
      \ 'info':    ['fg', 'Aqua'],
      \ 'border':  ['fg', 'Grey'],
      \ 'prompt':  ['fg', 'Orange'],
      \ 'pointer': ['fg', 'Blue'],
      \ 'marker':  ['fg', 'Yellow'],
      \ 'spinner': ['fg', 'Yellow'],
      \ 'header':  ['fg', 'Grey']
      \ }
" }}}
if has('nvim')
" nvim-telescope/telescope.nvim {{{
call herdwick#highlight('TelescopeMatching', s:palette.green, s:palette.none, 'bold')
highlight! link TelescopeBorder Grey
highlight! link TelescopePromptPrefix Orange
highlight! link TelescopeSelection DiffAdd
" }}}
endif
" }}}

" vim: set sw=2 ts=2 sts=2 et tw=80 ft=vim fdm=marker fmr={{{,}}}:

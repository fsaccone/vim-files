hi clear
set background=dark
if exists('syntax_on')
    syntax reset
endif

let g:colors_name = 'main'

let s:bg1       = { 'gui': '#262626', 'cterm': '235' }
let s:bg2       = { 'gui': '#303030', 'cterm': '236' }
let s:fg        = { 'gui': '#D0D0D0', 'cterm': '252' }
let s:primary   = { 'gui': '#D78700', 'cterm': '172' }
let s:secondary = { 'gui': '#D75F00', 'cterm': '166' }
let s:muted  =    { 'gui': '#808080', 'cterm': '244' }
let s:ui_muted  = { 'gui': '#4E4E4E', 'cterm': '239' }
let s:ui_hl     = { 'gui': '#FFAF00', 'cterm': '214' }
let s:string    = { 'gui': '#AFD700', 'cterm': '148' }
let s:error     = { 'gui': '#D70000', 'cterm': '160' }
let s:special   = { 'gui': '#FFAF5F', 'cterm': '215' }
let s:none      = { 'gui': 'NONE', 'cterm': 'NONE' }

let s:bold      = 'bold'
let s:italic    = 'italic'
let s:underline = 'underline'
let s:undercurl = 'undercurl'
let s:inverse   = 'inverse'

function! s:AddColor(theme_group, given_fg, given_bg, given_em)
    let l:fg = a:given_fg
    let l:bg = a:given_bg
    let l:em = join(a:given_em, ',')

    if strlen(l:em) <= 0
        let l:em = 'NONE'
    endif

    let l:command = ['hi', a:theme_group,
                   \ 'ctermfg=' . l:fg.cterm,
                   \ 'ctermbg=' . l:bg.cterm,
                   \ 'cterm=' . l:em,
                   \ 'guifg=' . l:fg.gui,
                   \ 'guibg=' . l:bg.gui,
                   \ 'gui=' . l:em
                   \ ]

    execute join(command, ' ')
endfunction

call s:AddColor('Normal', s:fg, s:bg1, [])

call s:AddColor('MatchParen', s:ui_hl, s:bg1, [s:bold])

call s:AddColor('Conceal', s:special, s:bg1, [])
call s:AddColor('ColorColumn', s:none, s:none, [])
call s:AddColor('CursorLine', s:none, s:none, [])
call s:AddColor('CursorLineNr', s:ui_hl, s:none, [s:bold])

call s:AddColor('TabLine', s:fg, s:bg2, [])
call s:AddColor('TabLineSel', s:bg2, s:ui_hl, [s:bold])
hi! link TabLineFill TabLine

call s:AddColor('NonText', s:ui_muted, s:none, [])
call s:AddColor('SpecialKey', s:ui_muted, s:none, [])

call s:AddColor('Visual', s:none, s:bg2, [])
call s:AddColor('Search', s:none, s:bg2, [])
call s:AddColor('IncSearch', s:none, s:bg2, [])

call s:AddColor('QuickFixLine', s:fg, s:bg2, [])
call s:AddColor('qfFileName', s:ui_hl, s:bg2, [])
call s:AddColor('qfLineNr', s:ui_muted, s:bg2, [])

call s:AddColor('Underlined', s:none, s:none, [s:underline])

call s:AddColor('StatusLine', s:fg, s:bg2, [])
call s:AddColor('StatusLineNC', s:fg, s:bg2, [s:inverse, s:italic])

call s:AddColor('VertSplit', s:bg1, s:bg2, [])
call s:AddColor('WildMenu', s:ui_hl, s:bg2, [s:bold])

call s:AddColor('ErrorMsg', s:bg1, s:ui_hl, [s:bold])
call s:AddColor('MoreMsg', s:ui_hl, s:bg1, [])
call s:AddColor('ModeMsg', s:fg, s:bg1, [])
hi! link Question MoreMsg
hi! link WarningMsg ErrorMsg

call s:AddColor('LineNr', s:ui_muted, s:bg1, [])
call s:AddColor('SignColumn', s:none, s:bg1, [])

call s:AddColor('Folded', s:ui_muted, s:bg1, [])
call s:AddColor('FoldColumn', s:ui_hl, s:bg1, [])

call s:AddColor('Cursor', s:none, s:none, [s:inverse])
hi! link vCursor Cursor
hi! link iCursor Cursor
hi! link lCursor Cursor

call s:AddColor('Special', s:fg, s:none, [])
call s:AddColor('Comment', s:muted, s:none, [s:italic])
hi! link Todo Comment
call s:AddColor('Error', s:error, s:none, [s:bold, s:underline])

call s:AddColor('String', s:string, s:none, [])
hi! link Character String
call s:AddColor('EscSequence', s:primary, s:bg1, [s:bold])

call s:AddColor('Statement', s:primary, s:none, [])
hi! link Conditional Statement
hi! link Repeat Statement
hi! link Label Statement
hi! link Exception Statement
hi! link Operator Statement
hi! link Keyword Statement

call s:AddColor('Identifier', s:special, s:none, [])
hi! link Function Identifier
call s:AddColor('Constant', s:secondary, s:none, [])
hi! link Boolean Constant
hi! link Number Constant
hi! link Float Constant
hi! link Type Constant
hi! link PreProc Constant
hi! link Include PreProc
hi! link Define PreProc
hi! link Macro PreProc
hi! link PreCondit PreProc

call s:AddColor('Structure', s:primary, s:none, [])
hi! link StorageClass Structure

call s:AddColor('Typedef', s:primary, s:none, [])

call s:AddColor('DiffDelete', s:primary, s:bg1, [s:inverse])
call s:AddColor('DiffAdd', s:string, s:bg1, [s:inverse])
call s:AddColor('DiffChange', s:special, s:bg1, [s:inverse])
call s:AddColor('DiffText', s:secondary, s:bg1, [s:inverse])

call s:AddColor('htmlLink', s:fg, s:none, [s:underline])
call s:AddColor('htmlTitle', s:fg, s:none, [s:bold])
call s:AddColor('htmlTag', s:primary, s:none, [])
call s:AddColor('htmlTagName', s:primary, s:none, [])
call s:AddColor('htmlArg', s:secondary, s:none, [])
call s:AddColor('htmlSpecialChar', s:secondary, s:none, [s:bold])
call s:AddColor('htmlBold', s:fg, s:none, [s:bold])
call s:AddColor('htmlBoldUnderline', s:fg, s:none, [s:bold, s:underline])
call s:AddColor('htmlBoldItalic', s:fg, s:none, [s:bold, s:italic])
call s:AddColor('htmlBoldUnderlineItalic', s:fg, s:none, [s:bold, s:underline, s:italic])
call s:AddColor('htmlUnderline', s:fg, s:none, [s:underline])
call s:AddColor('htmlUnderlineItalic', s:fg, s:none, [s:underline, s:italic])
call s:AddColor('htmlItalic', s:fg, s:none, [s:italic])

call s:AddColor('markdownH1', s:primary, s:none, [s:bold])
hi! link markdownH2 markdownH1
hi! link markdownH3 markdownH1
hi! link markdownH4 markdownH1
hi! link markdownH5 markdownH1

call s:AddColor('pythonDecorator', s:secondary, s:none, [])
call s:AddColor('pythonInclude', s:special, s:none, [])
call s:AddColor('pythonImport', s:special, s:none, [])
call s:AddColor('pythonBoolean', s:secondary, s:none, [])
call s:AddColor('pythonFunction', s:secondary, s:none, [])
call s:AddColor('pythonBuiltin', s:secondary, s:none, [])
hi! link pythonCoding Comment
hi! link pythonBytesEscape EscSequence

call s:AddColor('vimBracket', s:secondary, s:none, [])
hi! link vimNotation vimBracket
hi! link vimMapModKey vimBracket
hi! link vimCommentTitle vimBracket

hi! link cSpecial EscSequence

hi! link dEscSequence EscSequence

hi! link rubyModule Statement
hi! link rubyClass Statement
hi! link rubyDefine Statement
hi! link rubyBlockParameter Normal
hi! link rubyInstanceVariable Normal
hi! link rubyFunction Function


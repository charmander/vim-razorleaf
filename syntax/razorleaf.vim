syntax include @rlJavaScript syntax/javascript.vim

syntax keyword rlKeyword append block doctype elif else extends for if include replace
syntax keyword rlTag a abbr address area article aside audio b base bdi bdo blockquote body br button canvas caption cite code col colgroup data datalist dd del details dfn dialog div dl dt em embed fieldset figcaption figure footer form head header hr html i iframe img input ins kbd label legend li link main map mark menu menuitem meta meter nav noscript ol optgroup option output p param picture pre progress q rp rt rtc ruby s samp script section select shadow small source span strong style sub summary sup table tbody td template textarea tfoot th thead time title tr track u ul var video wbr h1 h2 h3 h4 h5 h6
syntax match rlAttribute '[a-zA-Z]\+\(-[a-zA-Z0-9]\+\)*:'
syntax region rlRawString start='!"' skip='\\\\\|\\"' end='"' contains=rlEscape,rlEscapeError,rlInterpolationContainer,@Spell
syntax region rlString start='"' skip='\\\\\|\\"' end='"' contains=rlEscape,rlEscapeError,rlInterpolationContainer,@Spell
syntax match rlEscape '\\[\\"#nrtvfb0]' contained
syntax match rlEscapeError '\\[^\\"#nrtvfb0]' contained
syntax region rlInterpolationContainer start='#{' end='}' contained contains=rlInterpolation
syntax region rlInterpolation start='\(#{\)\@<=' end='}\@=' contained contains=@rlJavaScript
syntax region rlComment start='#' end='$'

syntax match rlFor '\(for\)\@<=\s\+\a\w*\s\+of\s' contains=rlKeywordOf display
syntax region rlForCollection start='\(for\s\+\a\w*\s\+of\s\+\)\@<=' end='$' contains=@rlJavaScript display
syntax keyword rlKeywordOf of contained

syntax region rlIfCondition start='\(if\s\+\)\@<=' end='$' contains=@rlJavaScript display

hi link rlKeywordOf rlKeyword
hi link rlKeyword Keyword
hi link rlEscapeError rlError
hi link rlError Error
hi link rlTag Function
hi link rlRawString Constant
hi link rlString String
hi link rlInterpolationContainer PreProc
hi link rlComment Comment
hi link rlAttribute Type
hi link rlEscape SpecialChar

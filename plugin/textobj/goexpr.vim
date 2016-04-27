if exists('g:loaded_textobj_goexpr')
  finish
endif
let g:loaded_textobj_goexpr = 1

let s:save_cpo = &cpo
set cpo&vim

call textobj#user#plugin('goexpr', {
\      'stmt_a': {'select': 'age', 'select-function': 'textobj#goexpr#select_a'},
\      'stmt_i': {'select': 'ige', 'select-function': 'textobj#goexpr#select_i'},
\    })


let &cpo = s:save_cpo
unlet s:save_cpo

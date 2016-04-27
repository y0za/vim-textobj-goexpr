let s:save_cpo = &cpo
set cpo&vim

function! textobj#goexpr#select_a()
  let start_pattern = '\v%(if|for)\zs.'
  let end_pattern = '\v.\ze\{'
  return s:select(start_pattern, end_pattern)
endfunction

function! textobj#goexpr#select_i()
  let start_pattern = '\v%(if|for)\s*\zs.'
  let end_pattern = '\v.\ze\s*\{'
  return s:select(start_pattern, end_pattern)
endfunction

function! s:select(start_pattern, end_pattern)
  if !search(a:start_pattern, 'bcW')
    return 0
  endif
  let start = getpos('.')

  if !search(a:end_pattern, 'cW')
    return 0
  endif
  let end = getpos('.')

  return ['v', start, end]
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo

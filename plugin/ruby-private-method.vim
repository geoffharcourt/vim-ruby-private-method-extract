function! ClassPrivateSectionLocation()
  return search('private\s*\n')
endfunction!

function! ExtractPrivateMethod()
  let l:statement = @e
  execute "silent normal! '<d'>"
  
  let l:method_name = substitute(l:statement[0:stridx(l:statement, '=') - 1], '^\s\+', '', '')
  let l:method_body = substitute(l:statement[stridx(l:statement, '=') + 1:strlen(l:statement)], '^\s\+', '', '')
  
  call InsertPrivateSectionInClass()
  call InsertPrivateMethod(l:method_name, l:method_body)

  call TrimExtraWhiteSpace()
endfunction!

function! InsertPrivateMethod(method_name, method_body)
  execute "silent normal! g".ClassPrivateSectionLocation()
  execute "silent normal! o\<esc>odef ".a:method_name."\<cr>".a:method_body."end\<cr>\<esc>"
endfunction

function! InsertPrivateSectionInClass()
  if !ClassPrivateSectionLocation()
    execute "silent normal! G$"
    call search('end', 'b')
    execute "silent normal! O\<esc>O\<esc>oprivate\<esc>=="
  endif
endfunction

function! TrimExtraWhiteSpace()
  if search('\n\{3,}')
    execute "%s/\\n\\{3,}/\\r\\r/g"
  endif

  execute "silent normal! gg=G"
endfunction

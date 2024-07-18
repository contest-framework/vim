function! g:ContestAll()
  let command = '{}'
  let message = 'running all tests'
  call SendTestCommand(command, message)
endfunction


function! g:ContestFile()
  let command = '{"filename": "'.bufname('%').'"}'
  let message = 'testing file '.bufname('%')
  call SendTestCommand(command, message)
endfunction


function! g:ContestLine()
  let command = '{"filename": "'.bufname('%').'", "line": "'.line('.').'"}'
  let message = 'testing file '.bufname('%').' at line '.line('.')
  call SendTestCommand(command, message)
endfunction


function! g:ContestRepeat(...)
  let command = '{"repeatLastTest": true}'
  if a:0 == 1
    let message = ''
  else
    let message = 'repeating last test'
  endif
  call SendTestCommand(command, message)
endfunction


function! g:ContestSet(actionSet)
  let command = '{"actionSet": '.a:actionSet.'}'
  let message = 'Activate action set '.a:actionSet
  call SendTestCommand(command, message)
endfunction


function! g:ContestFileSaved()
  if g:contestAutotest
    call ContestRepeat('autorepeating')
  endif
endfunction


let g:contestAutotest = 0
function! g:ContestToggle()
  let g:contestAutotest = 1 - g:contestAutotest
  if g:contestAutotest
    echo 'AutoTest ON'
  else
    echo 'AutoTest OFF'
  endif
endfunction



function! SendTestCommand(data, message)
  if findfile('.contest.tmp', '.;') == '.contest.tmp'
    call writefile([a:data], '.contest.tmp')
    if a:message != ''
      echo a:message
    endif
  else
    echoerr "ERROR: Contest server is not running!"
  endif
endfunction

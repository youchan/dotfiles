function! Diary()
  let filename = "~/Projects/sweet/whitebase/repos/diary/" . strftime("%Y-%m-%d") . ".md"
  execute "edit " . filename
endfunction

function! Today()
  let filename = "~/Projects/sweet/whitebase/repos/today.md"
  execute "edit " . filename
endfunction

function! Blog()
  let filename = "~/Projects/footstep-diary/data/" . strftime("%Y-%m-%d") . ".md"
  execute "edit " . filename
endfunction


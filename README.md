# Tertestrial VIM plugin
> pragmatic test auto-runner for Vim

This is the [VIM](http://www.vim.org) plugin for [Tertestrial](https://github.com/kevgo/tertestrial-server).


## Installation

This is a normal Vim plugin.
Install it like you install all your other plugins.


##### Vundle users

* add `Bundle 'kevgo/tertestrial-vim'` to your .vimrc file
* restart Vim and run `:BundleInstall`

##### Pathogen users

* `git clone git://github.com/kevgo/tertestrial-vim.git ~/.vim/bundle`
* restart Vim


## Activation in Vim

To assign keyboard shortcuts to the different test commands,
put something like this in your `.vimrc` file:

```viml
" Tertestrial configuration
nnoremap <leader>f :call TestFile()<cr>
nnoremap <leader>l :call TestFileLine()<cr>
nnoremap <leader>o :call RepeatLastTest()<cr>
nnoremap <leader>a :call ToggleTestAutorun()<cr>
```

With these settings, you get the hotkeys:
* __leader-F:__ run the current test file completely
* __leader-L:__ run only the test at the current cursor position
* __leader-O:__ re-run the last test
* __leader-A:__ activate/deactivate auto-running the last run test on saving (see below)


## Auto-testing

This feature automatically runs the last run test on every file save.
To enable it, add something like this to your `.vimrc`:

```viml
function! AfterFileSave()
  if g:autotest
    call RepeatLastTest()
  endif
endfunction
if has("gui_running")
  iunmenu File.Save
  imenu <silent> File.Save <Esc>:w<CR>:call AfterFileSave()<CR>
  nmenu <silent> File.Save :call AfterFileSave()<CR>
endif
```

Now __[cmd-s]__ saves and re-runs the last test.

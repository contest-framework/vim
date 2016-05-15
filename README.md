# Tertestrial VIM plugin
> TDD in Vim at your fingertips

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


#### Activation in Vim

To assign keyboard shortcuts to the different test commands,
put something like this in your `.vimrc` file:

```viml
nnoremap <leader>f :call TestFile()<cr>
nnoremap <leader>l :call TestFileLine()<cr>
nnoremap <leader>o :call RepeatLastTest()<cr>
```

With these settings, you get the hotkeys:
* __leader-F:__ run the current test file completely
* __leader-L:__ run only the test at the current cursor position
* __leader-O:__ re-run the last test


#### Auto-testing

This feature automatically runs the last test on every file save.
To enable it, add something like this to your `.vimrc`:

```viml
nnoremap <leader>a :call ToggleTestAutorun()<cr>

function! AfterFileSave()
  if g:autotest
    call RepeatLastTest()
  endif
endfunction
if has("gui_running")
  iunmenu File.Save
  imenu <silent> File.Save <Esc>:w<CR>:call AfterFileSave()<CR>
endif
```

__leader-A__ now toggles auto-running on and off.
Hit __[cmd-s]__ to save and re-run the last test.

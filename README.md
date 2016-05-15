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

Here is an example for how to assign keyboard shortcuts to the different test commands.
Put this in your `.vimrc` file.

```viml
nnoremap <leader>f :call TestFile()<cr>
nnoremap <leader>l :call TestFileLine()<cr>
nnoremap <leader>o :call RepeatLastTest()<cr>
```

With these settings, you get the hotkeys:
* __leader-F:__ run the current test file completely
* __leader-L:__ run only the test at the current cursor position
* __leader-O:__ re-run the last test


To enable the auto-run feature, use this code in `.vimrc`:

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

__leader-A:__ toggles this auto-running on and off.
When it is on, Tertestrial automatically runs the last test each time you save a file.

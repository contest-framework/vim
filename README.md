# Tertestrial VIM plugin
> pragmatic test auto-runner for Vim

This is the [VIM](http://www.vim.org) plugin for [Tertestrial](https://github.com/kevgo/tertestrial-server).


## Installation

This is a normal Vim plugin.
Install it like you install all your other plugins.


##### Vundle users

* add `Bundle 'Originate/tertestrial-vim'` to your .vimrc file
* restart Vim and run `:BundleInstall`

##### Pathogen users

* `git clone git://github.com/Originate/tertestrial-vim.git ~/.vim/bundle`
* restart Vim


## Activation in Vim

To assign keyboard shortcuts to the different test commands,
put something like this in your `.vimrc` file:

```viml
nnoremap <leader>e :call TertestrialAll()<cr>
nnoremap <leader>f :call TertestrialFile()<cr>
nnoremap <leader>l :call TertestrialLine()<cr>
nnoremap <leader>o :call TertestialRepeat()<cr>
nnoremap <leader>a :call TertestrialToggle()<cr>
nnoremap <leader>1 :call TertestrialSet(1)<cr>
nnoremap <leader>2 :call TertestrialSet(2)<cr>
nnoremap <leader>3 :call TertestrialSet(3)<cr>
nnoremap <leader>4 :call TertestrialSet(4)<cr>
autocmd BufWritePost * :call TertestrialFileSaved()
```

With these settings, you get the hotkeys:
* __leader-e:__ run the complete test suite
* __leader-f:__ run the current test file
* __leader-l:__ run only the test at the current cursor position
* __leader-o:__ re-run the last test
* __leader-a:__ activate/deactivate auto-running the last run test on saving (see below)
* __leader-1:__ activate mapping 1
* __leader-2:__ activate mapping 2
* __leader-3:__ activate mapping 3
* __leader-4:__ activate mapping 4
* __[cmd-s]__ or `:w[<enter>]` saves the current buffer and re-runs the last test

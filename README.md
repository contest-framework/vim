# Contest plugin for Vim

## Installation

This is a normal Vim plugin.
Install it like you install all your other plugins.

##### Vundle users

- add `Bundle 'contest-framework/vim'` to your .vimrc file
- restart Vim and run `:BundleInstall`

##### Pathogen users

- clone to the bundle folder:

```
cd ~/.vim/bundle
git clone git://github.com/kevgo/contest-vim.git
```

- restart Vim

## Activation in Vim

To assign keyboard shortcuts to the different test commands,
put something like this in your `.vimrc` file:

```viml
nnoremap <leader>e :call ContestAll()<cr>
nnoremap <leader>f :call ContestFile()<cr>
nnoremap <leader>l :call ContestLine()<cr>
nnoremap <leader>o :call ContestRepeat()<cr>
nnoremap <leader>a :call ContestToggle()<cr>
nnoremap <leader>1 :call ContestSet(1)<cr>
nnoremap <leader>2 :call ContestSet(2)<cr>
nnoremap <leader>3 :call ContestSet(3)<cr>
nnoremap <leader>4 :call ContestSet(4)<cr>
autocmd BufWritePost * :call ContestFileSaved()
```

With these settings, you get the hotkeys:

- **leader-e:** run the complete test suite
- **leader-f:** run the current test file
- **leader-l:** run only the test at the current cursor position
- **leader-o:** re-run the last test
- **leader-a:** activate/deactivate auto-running the last run test on saving (see below)
- **leader-1:** activate mapping 1
- **leader-2:** activate mapping 2
- **leader-3:** activate mapping 3
- **leader-4:** activate mapping 4
- **[cmd-s]** or `:w[<enter>]` saves the current buffer and re-runs the last test

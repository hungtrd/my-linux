# my-linux

## Terminal

## Vim Editor

## Plugins

Thanks to vim-plug the plugins are lazy loaded (anything that is not needed for
the current buffer is not loaded) for example opening a python file means all
other non python related plugins are not loaded.
Coc extensions are lazy loaded as well, they work the same way as vim-plug plugins.

| Plugin                                                                  | Functionality                              |
| ----------------------------------------------------------------------- | ------------------------------------------ |
| [vim-airline](https://github.com/vim-airline/vim-airline)               | airline status line                        |
| [airline-themes](https://github.com/vim-airline/vim-airline-themes)     | airline themes                             |
| [devicons](https://github.com/ryanoasis/vim-devicons)                   | icons everywhere                           |
| [rainbow](https://github.com/luochen1990/rainbow)                       | rainbow parenthesis                        |
| [vim-material](https://github.com/hzchirs/vim-material)                 | material themes                            |
| [goyo](https://github.com/junegunn/goyo.vim)                            | focus mode                                 |
| [coc.nvim](https://github.com/neoclide/coc.nvim)                        | async completion and more                  |
| [ale-sensible](https://github.com/desmap/ale-sensible)                  | better ALE experience                      |
| [ale](https://github.com/w0rp/ale)                                      | diagnostics, linting and more              |
| [fzf](https://github.com/junegunn/fzf)                                  | fuzzy finder                               |
| [fzf.vim](https://github.com/junegunn/fzf.vim)                          | fuzzy finder vim integration               |
| [ultisnips](https://github.com/SirVer/ultisnips)                        | snippets engine                            |
| [vim-snippets](https://github.com/honza/vim-snippets)                   | snippets for many languages                |
| [vim-closetag](https://github.com/alvan/vim-closetag)                   | auto html tag closing                      |
| [indentLine](https://github.com/Yggdroot/indentLine)                    | auto indent lines                          |
| [vim-searchindex](https://github.com/google/vim-searchindex)            | show index of a search string              |
| [vim-liquid](https://github.com/tpope/vim-liquid)                       | liquid language support                    |
| [vim-commentary](https://github.com/tpope/vim-commentary)               | better comments everywhere                 |
| [vim-sensible](https://github.com/tpope/vim-sensible)                   | sensible defaults for vim                  |
| [suda](https://github.com/lambdalisue/suda.vim)                         | add sudo support                           |
| [vim-auto-save](https://github.com/907th/vim-auto-save)                 | auto save on insert mode exit              |
| [vim-startify](https://github.com/mhinz/vim-startify)                   | cool startup thingy                        |
| [vim-carbon-no-sh](https://github.com/kristijanhusak/vim-carbon-now-sh) | cool screen shots powered by carbon now sh |
| [vim-fugitive](https://github.com/tpope/vim-fugitive)                   | best git integration around                |
| [vim-sandwich](https://github.com/machakann/vim-sandwich)               | surround stuff with stuff                  |
| [vim-smoothie](https://github.com/psliwka/vim-smoothie)                 | super smooth scrolling                     |
| [vim-lastplace](https://github.com/farmergreg/vim-lastplace)            | open a file in the last place cursor was   |
| [vim-cool](https://github.com/romainl/vim-cool)                         | better search highlight control            |
| [tmux-complete](https://github.com/wellle/tmux-complete.vim)            | tmux panes completion                      |
| [Vista](https://github.com/liuchengxu/vista.vim)                        | list of tags                               |
| [vim-eunuch](https://github.com/tpope/vim-eunuch)                       | some common Linux commands                 |

## Keyboard shortcuts

To learn the default vim shortcuts run `Tutor` and or checkout this [site](https://vim-adventures.com/).
Not a lot of changes have been done here, the plugins shortcuts are almost
identical, check each plugin under the [plugins](#plugins) section for its key
mappings, the changes i have made either make a function easier to access and or
expose a hidden functionality within a plugin.

#### Legend

`,` == leader key
`S` == Shift key
`C` == ctrl key

| Mapping | functionality                                                              | Replaced Mapping |
| ------- | -------------------------------------------------------------------------- | ---------------- |
| `;`     | commands key                                                               | :                |
| `,r`    | reload nvim config                                                         | None             |
| `,t`    | Trim white spaces(enabled by default with ALE)                             | None             |
| `,q`    | close tab                                                                  | :q               |
| `,w`    | save changes(tho save when existing insert mode is enabled by default)     | :q               |
| `,f`    | fzf files viewer (shows project files with the ability to search)          | None             |
| `,g`    | Goyo (zen mode)                                                            | Default          |
| `,m`    | opens markdown preview (only in markdown files)                            | None             |
| `,e`    | call :PlugInstall (install plugins)                                        | None             |
| `,v`    | search in vista tags                                                       | None             |
| `,/`    | search in project folder (calls Rg)                                        | None             |
| `,rn`   | rename globally                                                            | None             |
| `,l`    | easymotion to the left                                                     | None             |
| `,h`    | easymotion to the right                                                    | None             |
| `,j`    | easymotion to the bottom                                                   | None             |
| `,k`    | easymotion to the top                                                      | None             |
| `jj`    | Escape                                                                     | Esc              |
| `d`     | use a different register for deletion (so the deleted text wont be copied) | "\_d             |
| `C-q`   | close all buffers and exit nvim                                            | None             |
| `C-c`   | copy text to system clipboard (only in visual mode)                        | +y               |
| `C-x`   | cut text to system clipboard (only in visual mode)                         | +d               |
| `C-l`   | move to the split on the right                                             | Default          |
| `C-k`   | move the split above                                                       | Default          |
| `C-j`   | move to the split on below                                                 | Default          |
| `C-h`   | Move the split to the left                                                 | Default          |
| `C-c`   | highlights character for multi cursor selection (in normal mode)           | None             |
| `C-a`   | Highlights word/selection for multi cursor selection                       | None             |
| `ENTER` | insert blank line below in normal mode                                     | None             |
| `ENTER` | inputs selected snippet in insert mode                                     | None             |
| `Tab`   | cycles throw coc in insert mode                                            | None             |
| `Tab`   | switch to the next buffer(tab)                                             | Default          |
| `S-Tab` | switch to the previous buffer(tab)                                         | Default          |
| `F4`    | Open vista (tags viewer)                                                   | none             |
| `F5`    | Rotates splits in current view                                             | None             |
| `F6`    | Startify                                                                   | Default          |
| `F8`    | opens selection in carbon now sh (only in visual mode)                     | None             |
| `]g`    | next diagnostic                                                            | None             |
| `[g`    | Previous diagnostic                                                        | None             |

|


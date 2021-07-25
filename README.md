# vacuumline.nvim
Airline in the vacuum of space

Vacuumline is a prebuilt configuration for galaxyline based on the look and functionality of Airline. It can be further
configured to style icons, colors, and segments.

## Install
The goal of vacuumline is just to expose a galaxyline configuration and thus requires galaxyline and its dependencies:

### vim-plug
```vim
Plug 'konapun/vacuumline.nvim'
Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}
" One of the following is required for showing icons
Plug 'kyazdani42/nvim-web-devicons' " lua
Plug 'ryanoasis/vim-devicons' " vimscript

" Somewhere after plug#end()

lua require('vacuumline').setup()
```

### packer
```lua
use {
  'konapun/vacuumline.nvim',
  config = function() require('vacuumline').setup{} end,
  requires = {
    'glepnir/galaxyline.nvim', branch = 'main' -- FIXME does this work?
    'kyazdani42/nvim-web-devicons'
  }
}
```

## Configuration
### Global configurations
Global configuration values are defaults used throughout sections but can be overridden by individual section settings
```lua
TODO:
- left segment
- right segment
- even colors
- odd colors
- Order, left, right
```

### Sections
#### Mode
Displays the current vim mode as a color indicator and text/icon display
```lua
mode = {
  enabled = true,
  foreground = '',
  background = '',
  separator = '',
  map = {
    n = {label = '', foreground = '', background = ''},
    i = {label = '', foreground = '', background = ''},
    -- ...
  }
}
```
#### File
Displays an icon for the current filetype, the current file name, edit status, and file size
```lua
file = {
  enabled = true,
  foreground = '',
  background = '',
  separator = ''
}
```
#### VCS
Displays current branch name along with additions, changes, and deletions
```lua
vcs = {
  enabled = true,
  foreground = '',
  background = '',
  separator = ''
}
```
#### Scroll
Displays current scroll position in the file as both percentage and visual indicator
```lua
scroll = {
  enabled = true,
  foreground = '',
  background = '',
  accent = '',
  separator = ''
}
```
#### Lines
Displays current line and column along with line endings
```lua
lines = {
  enabled = true,
  foreground = '',
  background = '',
  separator = '',
  half_separator = ''
}
```
#### Diagnostics
Displays errors, warnings, and info from LSP diagnostics
```lua
diagnostics = {
  enabled = true,
  separator = '',
  errors = {
    foreground = '',
    background = ''
  },
  warnings = {
    foreground = '',
    background = ''
  }
}
```
#### Search
Displays current search term, current match, and total matches
```lua
search = {
  enabled = true,
  foreground = '',
  background = '',
  separator = ''
}
```
#### LSP
Displays the active language server
```lua
lsp = {
  enabled = true,
  foreground = '',
  background = '',
  separator = ''
}
```
### Theme

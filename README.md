# vacuumline.nvim
Airline in the vacuum of space

Vacuumline is a prebuilt configuration for galaxyline based on the look and functionality of Airline. It can be further
configured to style icons, colors, and segments.

<img src="./res/vacuumline.png" alt="vacuumline"/>
<sub>full pane vacuumline</sub>

<img src="./res/vacuumline-inactive.png" alt="vacuumline inactive"/>
<sub>split pane vacuumline showing inctive and active styling</sub>

## Features
  * Built on [galaxyline](https://github.com/glepnir/galaxyline.nvim)
  * Adaptive segments based on pane size (expand/collapse - guarantees vim mode indicator is never hidden)
  * Dynamic theming
  * Active/inactive segment styling
  * Customizable
  * Prebuilt segments:
    * [Mode]()
    * [File]()
    * [VCS]()
    * [LSP]()
    * [Lines]()
    * [Diagnostics]()
    * [Scroll]()

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
use {'konapun/vacuumline.nvim', requires = {
  'glepnir/galaxyline.nvim', branch = 'main',
  'kyazdani42/nvim-web-devicons', opt = true
}}
```

## Configuration
### Defaults
Here is the full default configuration. Individual pieces are described in more depth below.
```lua
local default_options = {
  separator = {
    segment = {
      left = '',
      right = ''
    },
    section = {
      left = '',
      right = ''
    }
  },
  color = {
    foreground = {line = '#98971a', even = '#282828', odd = '#282828'},
    background = {line = '#282828', even = '#b16286', odd = '#98971a'},
  },
  segment = {
    mode = {
      enabled = true,
      map = { -- TODO
        n = {label = ' ', background = '#b16286'}, -- NORMAL
        i = {label = ' ', background = '#98971a'}, -- INSERT
        c = {label = ' ', background = '#458588'}, -- COMMAND
        v = {label = ' ', background = '#d79921'}, -- VISUAL
        V = {label = ' ', background = '#fabd2f'}, -- VISUAL LINE
        t = {label = ' ', background = '#d3869b'}, -- TERMINAL
        s = {label = 's', background = '#fb4934'},
        S = {label = 'S', background = '#b8bb26'},
        R = {label = 'R', background = '#b16286'},
        r = {label = 'r', background = '#b16286'},
        ce = {label = 'ce', background = '#b16286'},
        cv = {label = 'cv', background = '#b16286'},
        ic = {label = 'ic', background = '#8ec07c'},
        no = {label = 'no', background = '#fabd2f'},
        rm = {label = 'rm', background = '#b16286'},
        Rv = {label = 'Rv', background = '#b16286'},
        ['!'] = {label = '!', background = '#b16286'},
        [''] = {label = '^S', background = '#83a598'},
        ['^V'] = {label = ' ', background = '#680d6a'}, -- VISUAL BLOCK
        ['r?'] = {label = 'r?', background = '#b16286'},
      }
    },
    file = {
      enabled = true,
    },
    vcs = {
      enabled = true,
    },
    scroll = {
      enabled = true,
      accent = '#d79921',
    },
    lines = {
      enabled = true,
    },
    diagnostics = {
      enabled = true,
      background = '#fb4934',
      errors = {
        foreground = '#282828',
        background = '#fb4934'
      },
      warnings = {
        foreground = '#282828',
        background = '#fabd2f'
      }
    },
    search = {
      enabled = true,
    },
    lsp = {
      enabled = true,
      foreground = '#98971a',
      background = '#282828'
    }
  }
}
```

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

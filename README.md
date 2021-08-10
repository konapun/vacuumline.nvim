# vacuumline.nvim
Airline in the vacuum of space

vacuumline is a prebuilt configuration for galaxyline based on the look and functionality of Airline. It can be further
configured to style icons, colors, and segments.

<sub>full pane vacuumline</sub>
<img src="./res/vacuumline.png" alt="vacuumline"/>

<sub>split pane vacuumline showing inctive and active styling</sub>
<img src="./res/vacuumline-inactive.png" alt="vacuumline inactive"/>

## Features
  * Built on [galaxyline](https://github.com/glepnir/galaxyline.nvim)
  * Adaptive segments based on pane size (expand/collapse - guarantees vim mode indicator is never hidden)
  * Dynamic theming
  * Active/inactive segment styling
  * Customizable
  * Prebuilt segments:
    * [Mode](#mode)
    * [File](#file)
    * [VCS](#vcs)
    * [LSP](#lsp)
    * [Lines](#lines)
    * [Diagnostics](#diagnostics)
    * [Scroll](#scroll)

## Install
The goal of vacuumline is just to expose a galaxyline configuration and thus requires galaxyline and its dependencies:

### vim-plug
```vim
Plug 'konapun/vacuumline.nvim'
Plug 'glepnir/galaxyline.nvim', {'branch': 'main'}
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
}, config = function() require('vacuumline').setup() end} -- Add this line to use defaults; otherwise, call `setup` with your config as described below wherever you configure your plugins
```

## Collapse Behavior
One of the big advantages of vacuumline over a standard galaxyline config is the builtin responsiveness:

<sub>uncollapsed vacuumline</sub>
<img src="./res/vacuumline-no_collapse.png" height="20px" alt="uncollapsed"/>

<sub>collapse level 1</sub>
<img src="./res/vacuumline-collapse1.png" height="20px" alt="collapse level 1"/>

<sub>collapse level 2</sub>
<img src="./res/vacuumline-collapse2.png" height="20px" alt="collapse level 2"/>

<sub>collapse level 3</sub>
<img src="./res/vacuumline-collapse3.png" height="20px" alt="collapse level 3"/>

<sub>collapse level 4</sub>
<img src="./res/vacuumline-collapse4.png" height="20px" alt="collapse level 4"/>

## Configuration
### Theming
For convenience, rather than configuring colors for each segment separately, you may want to apply a theme.

```lua
require('vacuumline').setup({
  theme = require('vacuumline.theme.nord')
})
```

#### Builtin Themes
The follow themes are built in. If you'd like to contribute a theme, please feel free to submit a PR.
  * gruvbox: `theme = require('vacuumline.theme.gruvbox')`
  * nord: `theme = require('vacuumline.theme.nord')`
  * one-dark: `theme = require('vacuumline.theme.one-dark')`

#### Custom Theme
You can also use a custom theme:

```lua
require('vacuumline').setup({
  theme = {
    line             = {foreground = '#98971a', background = '#282828'},
    segment_odd      = {foreground = '#282828', background = '#b16286'},
    segment_even     = {foreground = '#282828', background = '#98971a'},
    mode_normal      = {foreground = '#b16286'},
    mode_insert      = {foreground = '#98971a'},
    mode_command     = {foreground = '#458588'},
    mode_visual      = {foreground = '#d79921'},
    mode_visual_line = {foreground = '#689d6a'},
    mode_terminal    = {foreground = '#cc241d'},
    hint             = {foreground = '#282828', background = '#b8bb26'},
    info             = {foreground = '#282828', background = '#83a598'},
    warning          = {foreground = '#282828', background = '#fabd2f'},
    error            = {foreground = '#282828', background = '#fb4934'},
    scroll           = {foreground = '#d79921'}
  }
})

```

### Defaults
Here is the full default configuration. Individual pieces are described in more depth below.
```lua
{
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
      map = {
        n = {label = ' ', background = '#b16286'}, -- NORMAL
        i = {label = ' ', background = '#98971a'}, -- INSERT
        c = {label = ' ', background = '#458588'}, -- COMMAND
        v = {label = ' ', background = '#d79921'}, -- VISUAL
        V = {label = ' ', background = '#fabd2f'}, -- VISUAL LINE
        t = {label = ' ', background = '#d3869b'}, -- TERMINAL
      }
    },
    file = {},
    vcs = {},
    scroll = {
      accent = '#d79921',
    },
    lines = {},
    diagnostics = {
      background = '#fb4934',
      error = {
        foreground = '#282828',
        background = '#fb4934'
      },
      warning = {
        foreground = '#282828',
        background = '#fabd2f'
      },
      info = {
        foreground = '#282828',
        background = '#83a598'
      },
      hint = {
        foreground = '#282828',
        background = '#b8bb26'
      }
    },
    search = {},
    lsp = {
      foreground = '#98971a',
      background = '#282828'
    }
  }
}
```

### Global configurations
Global config values are used when no specific value is provided for a segment.

```lua
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
}
```

#### Separators
Segment separators are used to separate segments, obviously.

#### Colors
These are colors which are applied to segments depending on their order in the vacuumline.
  * line: default line colors - line foreground and background
  * even: default colors for even-numbered segments - foreground and background
  * odd: default colors for odd-numbered segments - foreground and background

### Segments
#### Mode
Displays the current vim mode as a color indicator and text/icon display

Collapse behavior: None

```lua
mode = {
  foreground = '', -- dynamic by default
  background = '', -- dynamic by default
  separator = '', -- dynamic by default
  map = {
    n = {label = ' ', background = '#b16286'}, -- NORMAL
    i = {label = ' ', background = '#98971a'}, -- INSERT
    c = {label = ' ', background = '#458588'}, -- COMMAND
    v = {label = ' ', background = '#d79921'}, -- VISUAL
    V = {label = ' ', background = '#fabd2f'}, -- VISUAL LINE
    t = {label = ' ', background = '#d3869b'}, -- TERMINAL
  }
}
```

#### File
Displays an icon for the current filetype, the current file name, edit status, and file size

Collapse behavior:
  * Truncates filename depending on available width
  * Hides filename and file size depending on available width

```lua
file = {
  foreground = '', -- dynamic by default
  background = '', -- dynamic by default
  separator = '' -- dynamic by default
}
```

#### VCS
Displays current branch name along with additions, changes, and deletions

Collapse behavior:
  * Collapses entire segment depending on available width

```lua
vcs = {
  foreground = '', -- dynamic by default
  background = '', -- dynamic by default
  separator = '' -- dynamic by default
}
```

#### Scroll
Displays current scroll position in the file as both percentage and visual indicator

Collapse behavior:
  * Hides percent indicator depending on available width

```lua
scroll = {
  accent = '', -- used to color the scroll indicator
  foreground = '', -- dynamic by default
  background = '', -- dynamic by default
  separator = '' -- dynamic by default
}
```

#### Lines
Displays current line and column along with line endings

Collapse behavior:
  * Hides line endings depending on available width
  * Collapses entire segment depending on available width

```lua
lines = {
  foreground = '', -- dynamic by default
  background = '', -- dynamic by default
  separator = '', -- dynamic by default
  section_separator = '', -- dynamic by default
}
```

#### Diagnostics
Displays errors, warnings, and info from LSP diagnostics

Collapse behavior: None

```lua
diagnostics = {
  separator = '', -- dynamic by default
  error = {
    foreground = '',
    background = ''
  },
  warning = {
    foreground = '',
    background = ''
  },
  info = {
    foreground = '',
    background = ''
  },
  hint = {
    foreground = '',
    background = ''
  }
}
```

#### Search
Displays current search term, current match, and total matches

Collapse behavior: None

```lua
search = {
  foreground = '', -- dynamic by default
  background = '', -- dynamic by default
  separator = '' -- dynamic by default
}
```

#### LSP
Displays the active language server

Collapse behavior:
  * Hides depending on available width

```lua
lsp = {
  foreground = '', -- dynamic by default
  background = '' -- dynamic by default
}
```

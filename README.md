# oxeye.nvim

[![Neovim plugin](https://img.shields.io/badge/neovim-plugin-57A143?logo=neovim)](https://neovim.io)
[![Top](https://img.shields.io/github/languages/top/aekasitt/oxeye.nvim)](https://github.com/aekasitt/oxeye.nvim)
[![Languages](https://img.shields.io/github/languages/count/aekasitt/oxeye.nvim)](https://github.com/aekasitt/oxeye.nvim)
[![Last commit](https://img.shields.io/github/last-commit/aekasitt/oxeye.nvim/master)](https://github.com/aekasitt/oxeye.nvim)
![Oxeye Banner](static/oxeye-banner.svg)

## Installation

### Lazy

```lua
{
  'aekasitt/oxeye.nvim',
  config = function()
    local oxeye = require('oxeye')
    vim.keymap.set('n', '<leader>ox', oxeye.live_grep, { desc = 'Live structural search' })
  end,
  dependencies = {
    'ibhagwan/fzf-lua',
    'nvim-lua/plenary.nvim',
  }
}
```

### Packer

```lua
use {
  'aekasitt/oxeye.nvim',
  config = function()
    local oxeye = require('oxeye')
    vim.keymap.set('n', '<leader>ox', oxeye.live_grep, { desc = 'Live structural search' })
  end,
  requires = {
    'ibhagwan/fzf-lua',
    'nvim-lua/plenary.nvim',
  },
}
```

## Roadmap

* More commands
* Less `fzf-lua`, floating panel and previewer can be done without
* Add ast-grep linting
* Dynamic installation scripts (install via `brew`, `npm` or `pip`)

## Project structure

```
oxeye.nvim/
│
├── lua/
│   └── oxeye/
│       ├── build.lua       # Install ast-grep using cargo
│       └── init.lua        # Setup oxeye if not existed
│
├── plugin/
│   ├── oxeye.lua           # Verify dependencies before setup
│   └── state.lua           # Store window id, buffer and other configs
│
├── LICENSE                 # Details of MIT License
└── README.md               # Descriptions and roadmap
```

### Alternatives

1. [cshuaimin/ssr.nvim](https://github.com/cshuaimin/ssr.nvim) - Treesitter based structural search and replace plugin for Neovim.
2. [MagicDuck/grug-far.nvim](https://github.com/MagicDuck/grug-far.nvim) - Find and Replace plugin for neovim
3. [ray-x/telescope-ast-grep.nvim](https://github.com/ray-x/telescope-ast-grep.nvim) - AST grep extension for telescope.nvim

### Acknowledgements

1. [อัญชัญ - Anchan](https://www.f0nt.com/release/anchan/) typeface by [Alisara Zilch](https://www.f0nt.com/author/zilch/)
2. [YT: ast-grep - DevOnDuty](https://youtu.be/HnlqPwTMEVc)
  by [Dr. David Alexander Kunz](https://github.com/David-Kunz)

## License

This project is licensed under the terms of the MIT license.

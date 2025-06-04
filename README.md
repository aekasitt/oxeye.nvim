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
}
```

### Packer

TBD;

## Project structure

```
oxeye.nvim/
│
├── lua/
│   └── oxeye/
│       └── build.lua       # Install python dependencies
│       └── init.lua        # Setup oxeye if not existed
│
├── plugin/
│   └── oxeye.lua           # Verify dependencies before setup
│
├── src/
│   └── lib.rs              # Implement Conway's Game of Life
│
├── LICENSE                 # Details of MIT License
└── README.md               # Descriptions and roadmap
```

### Acknowledgements

1. [อัญชัญ - Anchan](https://www.f0nt.com/release/anchan/) typeface by [Alisara Zilch](https://www.f0nt.com/author/zilch/)

## License

This project is licensed under the terms of the MIT license.

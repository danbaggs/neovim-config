# Neovim Configuration

## System prerequisites

- Clipboard tool: `xclip` or `xsel` or `wl-clipboard`
- Python3: Because obvs
- Node.js: Some nvim plugins require this
- sshfs: For remote file editing like VSCode Remote Explorer
- ripgrep: For faster searching
- fzf: For fuzzy finding all the things

## Directory structure

```
init.lua
lazy-lock.json
README.md
├── after/
│   ├── ftplugin/
│   │   └── <filetypes>.lua
├── lua/
│   ├── autocmds.lua
│   ├── keymaps.lua
│   ├── options.lua
│   ├── plugin-keymaps.lua
│   ├── plugin-options.lua
│   ├── config/
│   │   └── lazy.lua
│   └── plugins/
│       ├── telescope/
│       │   └── multigrep.lua
│       └── <plugin config files>.lua
└── plugin/
    ├── floaterminal.lua
    └── rightclickmenu.lua
```

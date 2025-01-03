# Neovim Configuration

## System prerequisites

- **Clipboard tool**: `xclip` or `xsel` or `wl-clipboard`
- **Python3**: Because obvs
- **Go**: For... Go...
- **Node.js**: Some nvim plugins require this
- **jq**: For nice json formatting
- **sshfs**: For remote file editing like VSCode Remote Explorer
- **ripgrep**: For faster searching
- **fzf**: For fuzzy finding all the things

## Directory structure

```
README.md
init.lua
lazy-lock.json
├── after/
│   └── ftplugin/
│       └── <filetypes>.lua
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

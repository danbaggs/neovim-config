# Neovim Configuration

## System prerequisites

- **Clipboard tool**: `xclip` or `xsel` or `wl-clipboard`
- **Python3**: Because obvs
- **Go**: For... Go...
- **Node.js**: Some nvim plugins require this
- **Rust**: Some formatters require this
- **jq**: For nice json formatting
- **sshfs**: For remote file editing like VSCode Remote Explorer
- **ripgrep**: For faster searching
- **fzf**: For fuzzy finding all the things

## Add the following to your $PATH

```
/home/<user>/.local/bin:/home/<user>/.nvm/versions/node:/usr/local/go/bin:/home/<user>/go/bin:/opt/nvim-linux64/bin:/home/<user>/.cargo/bin:/home/<user>/.local/bin
```

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

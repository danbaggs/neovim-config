# Neovim Configuration

## System prerequisites

- **Clipboard tool**: `xclip` or `xsel` or `wl-clipboard`
- **Python3**: Because obvs
- **jq**: For nice json formatting
<!-- - **sshfs**: For remote file editing like VSCode Remote Explorer -->
<!-- - **Go**: For... Go... -->
<!-- - **Node.js**: Some nvim plugins require this -->
<!-- - **Rust**: Some formatters require this -->
<!-- - **ripgrep**: For faster searching -->
<!-- - **fzf**: For fuzzy finding all the things -->

## Run the following bash script to configure everything

This is completely untested...

```bash
# Download and install neovim
echo "Installing Neovim"
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux64.tar.gz

# Install Go
echo "Installing Go"
curl -LO https://go.dev/dl/go1.23.5.linux-amd64.tar.gz
sudo tar -C /opt -xzf go1.23.5.linux-amd64.tar.gz
sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go1.23.5.linux-amd64.tar.gz

# Install NodeJS
echo "Installing NodeJS"
curl -o https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh
sudo ./install.sh
nvm install 22

# Install Rust
echo "Installing Rust"
curl -LO https://sh.rustup.rs/
sudo ./rustup-init.sh

# Install Latex tool
echo "Installing Latex tool"
cargo install tex-fmt

# Add wezterm gpg key
echo "Adding Wezterm gpg key"
curl -fsSL https://apt.fury.io/wez/gpg.key | sudo gpg --yes --dearmor -o /etc/apt/keyrings/wezterm-fury.gpg
echo 'deb [signed-by=/etc/apt/keyrings/wezterm-fury.gpg] https://apt.fury.io/wez/ * *' | sudo tee /etc/apt/sources.list.d/wezterm.list

# Install all required apt packages
echo "Installing apt packages"
APT_APPS="sshfs python-is-python3 ripgrep libxcb-cursor0 fzf git-all xclip python3-venv python3-pip python3-ruff python3-neovim fd-find wezterm"
sudo apt-get update
sudo apt-get install -y $APT_APPS

echo "Installing NPM packages"
npm install -g azure-pipelines-language-server typescript typescript-language-server ts-node

echo "Adding everything to PATH"
echo 'export PATH="/home/<user>/.local/bin:/home/<user>/.nvm/versions/node:/usr/local/go/bin:/home/<user>/go/bin:/opt/nvim-linux64/bin:/home/<user>/.cargo/bin:/home/<user>/.local/bin:$PATH"' >> ~/.bashrc

# Remove downloaded installer packages
echo "Removing downloaded installer packages"
rm nvim-linux64.tar.gz go1.23.5.linux-amd64.tar.gz install.sh
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

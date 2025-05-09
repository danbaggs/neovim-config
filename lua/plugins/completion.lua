return {
  {
    'saghen/blink.cmp',
    -- optional: provides snippets for the snippet source
    dependencies = 'rafamadriz/friendly-snippets',
    -- use a release tag to download pre-built binaries
    version = 'v0.*',
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      -- 'default' for mappings similar to built-in completion
      -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
      -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
      keymap = {
        preset = 'super-tab',
      },
      cmdline = {
        keymap = {
          preset = 'super-tab',
        },
        completion = {
          menu = {
            auto_show = true,
          },
        },
      },
      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = 'mono'
      },
      signature = { enabled = true } -- experimental signature help support
    },
  },
}

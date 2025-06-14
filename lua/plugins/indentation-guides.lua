-- Indentation guides
return {
  -- https://github.com/lukas-reineke/indent-blankline.nvim
  "lukas-reineke/indent-blankline.nvim",
  -- event = 'VeryLazy',
  main = "ibl",
  config = function()
    local highlight = {
      "RainbowRed",
      "RainbowYellow",
      "RainbowBlue",
      "RainbowOrange",
      "RainbowGreen",
      "RainbowViolet",
      "RainbowCyan",
    }
    local hooks = require "ibl.hooks"
    -- create the highlight groups in the highlight setup hook, so they are reset
    -- every time the colorscheme changes
    hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
      vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#D06A6D" })
      vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#D5B573" })
      vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#5A9ECF" })
      vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#C1895E" })
      vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#8EBF6F" })
      vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#B66FC9" })
      vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#4FA3B4" })
    end)

    vim.g.rainbow_delimiters = { highlight = highlight }
    require("ibl").setup {
      scope = {
        highlight = highlight
      },
      indent = {
        -- highlight = highlight,
        char = "▏",
        tab_char = "▍"
      }
    }

    hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
  end,
}

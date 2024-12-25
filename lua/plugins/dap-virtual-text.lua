-- Inline Debug Text
return {
  'theHamsta/nvim-dap-virtual-text',
  lazy = true,
  opts = {
    -- Display debug text as a comment
    commented = true,
    -- Customize virtual text
    ---@diagnostic disable-next-line: unused-local
    display_callback = function(variable, buf, stackframe, node, options)
      if options.virt_text_pos == 'inline' then
        return ' = ' .. variable.value
      else
        return variable.name .. ' = ' .. variable.value
      end
    end,
  }
}

vim.cmd [[
  aunmenu PopUp
  anoremenu PopUp.Inspect     <cmd>Inspect<CR>
  amenu PopUp.-1-             <NOP>
  anoremenu PopUp.Definition  <cmd>lua vim.lsp.buf.definition()<CR>
  anoremenu PopUp.References  <cmd>Telescope lsp_references<CR>
  anoremenu PopUp.Back        <C-t>
]]
-- vnoremenu PopUp.Cut                     "+x
-- vnoremenu PopUp.Copy                    "+y
-- anoremenu PopUp.Paste                   "+gP
-- vnoremenu PopUp.Paste                   "+P
-- vnoremenu PopUp.Delete                  "_x

local group = vim.api.nvim_create_augroup("nvim_popupmenu", { clear = true })

vim.api.nvim_create_autocmd("MenuPopUp", {
  pattern = "*",
  group = group,
  desc = "Custom PopUp Setup",
  callback = function()
    vim.cmd [[
    amenu disable PopUp.Definition
    amenu disable PopUp.References
    ]]
    if vim.lsp.get_clients({ bufnr = 0 })[1] then
      vim.cmd [[
      amenu enable PopUp.Definition
      amenu enable PopUp.References
      ]]
    end
  end,
})

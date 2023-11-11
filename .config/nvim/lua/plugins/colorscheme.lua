-- [nfnl] Compiled from fnl/plugins/colorscheme.fnl by https://github.com/Olical/nfnl, do not edit.
local M = {"folke/tokyonight.nvim", commit = "e52c41314e83232840d6970e6b072f9fba242eb9", priority = 1000, lazy = false}
M.name = "tokyonight-night"
M.config = function()
  local status_ok, _ = pcall(vim.cmd.colorscheme, M.name)
  if not status_ok then
    return nil
  else
    return nil
  end
end
return M

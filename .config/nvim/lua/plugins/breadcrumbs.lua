-- [nfnl] Compiled from fnl/plugins/breadcrumbs.fnl by https://github.com/Olical/nfnl, do not edit.
local M = {"glepnir/lspsaga.nvim", branch = "main", dependencies = {"nvim-tree/nvim-web-devicons", "nvim-treesitter/nvim-treesitter"}, event = "LspAttach"}
local settings = {symbol_in_winbar = {color_mode = true, enable = true, folder_level = 2, hide_keyword = true, separator = " \194\187 ", show_file = true, respect_root = false}}
M.config = function()
  local lspsaga = require("lspsaga")
  return lspsaga.setup(settings)
end
return M

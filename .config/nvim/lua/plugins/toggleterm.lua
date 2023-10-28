-- [nfnl] Compiled from fnl/plugins/toggleterm.fnl by https://github.com/Olical/nfnl, do not edit.
local M = {"akinsho/toggleterm.nvim", commit = "19aad0f41f47affbba1274f05e3c067e6d718e1e", event = "VeryLazy"}
M.config = function()
  local status_ok, toggleterm = pcall(require, "toggleterm")
  if not status_ok then
    return 
  else
  end
  toggleterm.setup({close_on_exit = true, direction = "float", float_opts = {border = "curved", height = 40, width = 100000}, hide_numbers = true, insert_mappings = true, open_mapping = "<c-t>", shade_terminals = true, shading_factor = 2, shell = vim.o.shell, size = 20, start_in_insert = true, persist_size = false})
  _G.set_terminal_keymaps = function()
    local opts = {noremap = true}
    vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", "<C-\\><C-n><C-W>j", opts)
    return vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", "<C-\\><C-n><C-W>k", opts)
  end
  vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
  local Terminal = (require("toggleterm.terminal")).Terminal
  local lazygit
  local function _2_(_)
  end
  local function _3_(_)
    return vim.cmd("startinsert!")
  end
  lazygit = Terminal:new({cmd = "lazygit", count = 99, direction = "float", float_opts = {border = "none", height = 45, width = 100000}, hidden = true, on_close = _2_, on_open = _3_})
  local function _4_()
    return lazygit:toggle()
  end
  _LAZYGIT_TOGGLE = _4_
  return nil
end
return M

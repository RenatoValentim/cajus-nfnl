-- [nfnl] Compiled from fnl/plugins/todo-comments.fnl by https://github.com/Olical/nfnl, do not edit.
local M = {"folke/todo-comments.nvim", dependencies = {"nvim-lua/plenary.nvim"}, event = "LspAttach"}
M.config = function()
  local todo_comments = require("todo-comments")
  todo_comments.setup({keywords = {FIX = {alt = {"FIXME", "BUG", "FIXIT", "ISSUE", "ERROR", "ERR"}, color = "#DC2626", icon = "\239\134\136 "}, HACK = {color = "#FBBF24", icon = "\239\146\144 "}, NOTE = {alt = {"INFO"}, color = "#10B981", icon = "\239\161\167 "}, PERF = {alt = {"OPTIM", "PERFORMANCE", "OPTIMIZE"}, icon = "\239\153\145 "}, TODO = {color = "#2563EB", icon = "\239\128\140 "}, WARN = {alt = {"WARNING", "XXX"}, color = "#FBBF24", icon = "\239\129\177 "}}})
  vim.keymap.set("n", "<leader>tqf", ":TodoQuickFix<Return>", {})
  vim.keymap.set("n", "<leader>tll", ":TodoLocList<Return>", {})
  return vim.keymap.set("n", "<leader>tt", ":TodoTelescope<Return>", {})
end
return M

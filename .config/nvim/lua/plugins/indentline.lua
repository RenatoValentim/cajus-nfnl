-- [nfnl] Compiled from fnl/plugins/indentline.fnl by https://github.com/Olical/nfnl, do not edit.
local M = {"lukas-reineke/indent-blankline.nvim", commit = "8299fe7703dfff4b1752aeed271c3b95281a952d", event = "BufReadPre"}
M.opts = {buftype_exclude = {"terminal", "nofile"}, char = "\226\150\143", filetype_exclude = {"help", "NvimTree"}, show_current_context = true, show_first_indent_level = true, use_treesitter = true, show_trailing_blankline_indent = false}
return M

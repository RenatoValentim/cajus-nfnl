-- [nfnl] Compiled from fnl/plugins/telescope.fnl by https://github.com/Olical/nfnl, do not edit.
local M = {"nvim-telescope/telescope.nvim", cmd = {"Telescope"}, commit = "00cf15074a2997487813672a75f946d2ead95eb0", dependencies = {{"ahmedkhalf/project.nvim", commit = "685bc8e3890d2feb07ccf919522c97f7d33b94e4"}, {"nvim-telescope/telescope-file-browser.nvim"}}, event = "Bufenter"}
M.config = function()
  local telescope = require("telescope")
  local actions = require("telescope.actions")
  local function telescope_buffer_dir()
    return vim.fn.expand("%:p:h")
  end
  local fb_actions = (((require("telescope")).extensions).file_browser).actions
  local function _1_()
    return vim.cmd("normal vbd")
  end
  local function _2_()
    return vim.cmd("startinsert")
  end
  telescope.setup({defaults = {file_ignore_patterns = {".git/", "node_modules", "venv", ".venv"}, mappings = {i = {["<C-j>"] = actions.move_selection_next, ["<C-k>"] = actions.move_selection_previous, ["<Down>"] = actions.cycle_history_next, ["<Up>"] = actions.cycle_history_prev}, n = {q = actions.close}}, path_display = {"smart"}, prompt_prefix = "\239\145\171 ", selection_caret = "\239\129\164 "}, extensions = {file_browser = {hijack_netrw = true, mappings = {i = {["<C-w>"] = _1_}, n = {["/"] = _2_, N = fb_actions.create, c = fb_actions.copy, h = fb_actions.goto_parent_dir, m = fb_actions.move, r = fb_actions.rename, x = fb_actions.remove}}, theme = "dropdown"}}})
  telescope.load_extension("file_browser")
  local function _3_()
    return telescope.extensions.file_browser.file_browser({cwd = telescope_buffer_dir(), grouped = true, hidden = true, initial_mode = "normal", layout_config = {height = 40}, path = "%:p:h", respect_gitignore = false, previewer = false})
  end
  return vim.keymap.set("n", "<leader>fe", _3_)
end
return M

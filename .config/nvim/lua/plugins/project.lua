-- [nfnl] Compiled from fnl/plugins/project.fnl by https://github.com/Olical/nfnl, do not edit.
local M = {"ahmedkhalf/project.nvim", commit = "685bc8e3890d2feb07ccf919522c97f7d33b94e4", dependencies = {{"nvim-telescope/telescope.nvim", cmd = {"Telescope"}, commit = "203bf5609137600d73e8ed82703d6b0e320a5f36", event = "Bufenter"}}}
M.config = function()
  local project = require("project_nvim")
  project.setup({detection_methods = {"pattern"}, patterns = {".git", "Makefile", "package.json"}})
  local telescope = require("telescope")
  return telescope.load_extension("projects")
end
return M

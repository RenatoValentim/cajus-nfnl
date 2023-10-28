-- [nfnl] Compiled from fnl/plugins/mason.fnl by https://github.com/Olical/nfnl, do not edit.
local M = {"williamboman/mason.nvim", cmd = "Mason", commit = "4546dec8b56bc56bc1d81e717e4a935bc7cd6477", dependencies = {{"williamboman/mason-lspconfig.nvim", commit = "93e58e100f37ef4fb0f897deeed20599dae9d128", lazy = true}}, event = "BufReadPre"}
local settings = {log_level = vim.log.levels.INFO, max_concurrent_installers = 4, ui = {border = "none", icons = {package_installed = "\226\151\141", package_pending = "\226\151\141", package_uninstalled = "\226\151\141"}}}
M.config = function()
  do end (require("mason")).setup(settings)
  return (require("mason-lspconfig")).setup({automatic_installation = true, ensure_installed = (require("config.get-os-architecture")).servers})
end
return M

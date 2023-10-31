-- [nfnl] Compiled from fnl/plugins/nvim-dev-icons.fnl by https://github.com/Olical/nfnl, do not edit.
local M = {"nvim-tree/nvim-web-devicons", commit = "0568104bf8d0c3ab16395433fcc5c1638efc25d4", event = "VeryLazy"}
M.config = function()
  return (require("nvim-web-devicons")).setup({color_icons = true, default = true, override = {[".dockerignore"] = {color = "#22b2e3", icon = "\239\140\136", name = ".dockerignore"}, [".env.example"] = {color = "#eed202", icon = "\239\145\162", name = "env"}, Dockerfile = {color = "#22b2e3", icon = "\239\140\136", name = "dockerfile"}, ["app.env"] = {color = "#eed202", icon = "\239\145\162", name = "env"}, ["app.env.example"] = {color = "#eed202", icon = "\239\145\162", name = "env"}, ["docker-compose.yml"] = {color = "#22b2e3", icon = "\239\140\136", name = "dockercompose"}, ["go.mod"] = {color = "#de5048", icon = "\239\179\145", name = "gomod"}, ["go.sum"] = {color = "#de5048", icon = "\239\179\145", name = "gosum"}, zsh = {color = "#428850", cterm_color = "65", icon = "\238\158\149", name = "Zsh"}}})
end
return M

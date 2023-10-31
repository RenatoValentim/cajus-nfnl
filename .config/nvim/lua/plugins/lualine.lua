-- [nfnl] Compiled from fnl/plugins/lualine.fnl by https://github.com/Olical/nfnl, do not edit.
local M = {"nvim-lualine/lualine.nvim", commit = "0050b308552e45f7128f399886c86afefc3eb988", dependencies = {"wthollingsworth/pomodoro.nvim", dependencies = "MunifTanjim/nui.nvim"}, event = {"VimEnter", "InsertEnter", "BufReadPre", "BufAdd", "BufNew", "BufReadPost"}}
M.config = function()
  local lualine = require("lualine")
  local function hide_in_width()
    return (vim.fn.winwidth(0) > 80)
  end
  local pomodoro = require("pomodoro")
  local noice_ok, noice = pcall(require, "noice")
  if not noice_ok then
    noice = {}
  else
  end
  local diagnostics = {"diagnostics", colored = true, sections = {"error", "warn"}, sources = {"nvim_diagnostic"}, symbols = {error = "\239\129\151 ", warn = "\239\129\177 "}, always_visible = false}
  local diff = {"diff", colored = true, cond = hide_in_width, symbols = {added = "\239\145\151 ", modified = "\239\145\153 ", removed = "\239\145\152 "}}
  local filetype = {"filetype", icons_enabled = true}
  local location = {"location", padding = 1.5}
  local progress
  local function _2_()
    return "%P/%L"
  end
  progress = {"progress", color = {}, fmt = _2_}
  local function spaces()
    return ("\239\160\145 " .. vim.api.nvim_buf_get_option(0, "shiftwidth"))
  end
  local function env_cleanup(venv)
    if string.find(venv, "/") then
      local final_venv = venv
      for w in venv:gmatch("([^/]+)") do
        final_venv = w
      end
      venv = final_venv
    else
    end
    return venv
  end
  local function _4_()
    local window_width_limit = 100
    return (vim.o.columns > window_width_limit)
  end
  hide_in_width = _4_
  local py_component
  local function _5_()
    if (vim.bo.filetype == "python") then
      local venv = (os.getenv("CONDA_DEFAULT_ENV") or os.getenv("VIRTUAL_ENV"))
      if venv then
        local ___antifnl_rtns_1___ = {string.format("(%s)", env_cleanup(venv))}
        return (table.unpack or _G.unpack)(___antifnl_rtns_1___)
      else
      end
    else
    end
    return ""
  end
  py_component = {python_env = {_5_, color = {fg = "#98be65"}, cond = hide_in_width}}
  local lsp_component
  local function _8_(msg)
    msg = (msg or "LS Inactive")
    local buf_clients = vim.lsp.buf_get_clients()
    if (next(buf_clients) == nil) then
      if ((type(msg) == "boolean") or (#msg == 0)) then
        return "LS Inactive"
      else
      end
      return msg
    else
    end
    local buf_client_names = {}
    for _, client in pairs(buf_clients) do
      if ((client.name ~= "null-ls") and (client.name ~= "copilot")) then
        table.insert(buf_client_names, client.name)
      else
      end
    end
    local unique_client_names = vim.fn.uniq(buf_client_names)
    local language_servers = ("[" .. table.concat(unique_client_names, ", ") .. "]")
    if (language_servers == "[]") then
      return "Ls Inactive"
    else
    end
    return language_servers
  end
  lsp_component = {lsp = {_8_, color = {fg = "#0078d7", gui = "bold"}, cond = hide_in_width}}
  local pomodoro_component = {statusline = {pomodoro.statusline, color = {fg = "red", gui = "bold"}, cond = hide_in_width}}
  local noice_component = {""}
  if noice_ok then
    noice_component = {noice.api.statusline.mode.get, color = {fg = "#ff9e64"}, cond = noice.api.statusline.mode.has}
  else
  end
  return lualine.setup({options = {always_divide_middle = true, component_separators = {left = "", right = ""}, disabled_filetypes = {"alpha", "dashboard"}, globalstatus = true, icons_enabled = true, section_separators = {left = "", right = ""}, theme = "auto"}, sections = {lualine_a = {"mode"}, lualine_b = {{"b:gitsigns_head", color = {gui = "bold"}, icon = "\238\156\165"}}, lualine_c = {diagnostics}, lualine_x = {diff, noice_component, pomodoro_component.statusline, lsp_component.lsp, spaces, filetype, py_component.python_env}, lualine_y = {location}, lualine_z = {progress}}})
end
return M

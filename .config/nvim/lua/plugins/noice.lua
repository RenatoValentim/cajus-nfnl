-- [nfnl] Compiled from fnl/plugins/noice.fnl by https://github.com/Olical/nfnl, do not edit.
local M = {}
local terminal_width = vim.o.columns
local noice_min_width = 80
local notify_min_width = 187
local can_use_noice = (terminal_width >= noice_min_width)
local can_use_notify = (terminal_width >= notify_min_width)
can_use_notify = false
if can_use_noice then
  M = {"folke/noice.nvim", dependencies = {"MunifTanjim/nui.nvim"}, event = "VeryLazy", opts = {}}
  if can_use_notify then
    table.insert(M.dependencies, "rcarriga/nvim-notify")
  else
  end
  local settings = {cmdline = {enabled = true, format = {cmdline = {icon = "\238\158\162", lang = "vim", pattern = "^:"}, filter = {icon = "\238\158\162", lang = "bash", pattern = "^:%s*!"}, help = {icon = "\239\159\149", pattern = "^:%s*he?l?p?%s+"}, input = {}, lua = {icon = "\238\152\160", lang = "lua", pattern = {"^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*"}}, search_down = {icon = "\239\128\130 \239\132\131", kind = "search", lang = "regex", pattern = "^/"}, search_up = {icon = "\239\128\130 \239\132\130", kind = "search", lang = "regex", pattern = "^%?"}}, opts = {}, view = "cmdline_popup"}, commands = {errors = {filter = {error = true}, filter_opts = {reverse = true}, opts = {enter = true, format = "details"}, view = "popup"}, history = {filter = {any = {{event = "notify"}, {error = true}, {warning = true}, {event = "msg_show", kind = {""}}, {event = "lsp", kind = "message"}}}, opts = {enter = true, format = "details"}, view = "split"}, last = {filter = {any = {{event = "notify"}, {error = true}, {warning = true}, {event = "msg_show", kind = {""}}, {event = "lsp", kind = "message"}}}, filter_opts = {count = 1}, opts = {enter = true, format = "details"}, view = "popup"}}, format = {}, health = {checker = true}, lsp = {documentation = {opts = {format = {"{message}"}, lang = "markdown", render = "plain", replace = true, win_options = {concealcursor = "n", conceallevel = 3}}, view = "hover"}, hover = {enabled = true, opts = {}, view = nil, silent = false}, message = {enabled = true, opts = {}, view = "notify"}, override = {["cmp.entry.get_documentation"] = true, ["vim.lsp.util.convert_input_to_markdown_lines"] = true, ["vim.lsp.util.stylize_markdown"] = true}, progress = {enabled = true, format = "lsp_progress", format_done = "lsp_progress_done", throttle = (1000 / 30), view = "mini"}, signature = {auto_open = {enabled = true, luasnip = true, throttle = 50, trigger = true}, enabled = true, opts = {}, view = nil}}, markdown = {highlights = {["@%S+"] = "@parameter", ["^%s*(Parameters:)"] = "@text.title", ["^%s*(Return:)"] = "@text.title", ["^%s*(See also:)"] = "@text.title", ["{%S-}"] = "@parameter", ["|%S-|"] = "@text.reference"}, hover = {["|(%S-)|"] = vim.cmd.help}}, messages = {enabled = true, view = "notify", view_error = "notify", view_history = "messages", view_search = "virtualtext", view_warn = "notify"}, notify = {enabled = true, view = "notify"}, popupmenu = {backend = "nui", enabled = true, kind_icons = {}}, presets = {command_palette = true, inc_rename = true, long_message_to_split = true, lsp_doc_border = true, bottom_search = false}, redirect = {filter = {event = "msg_show"}, view = "popup"}, routes = {}, smart_move = {enabled = true, excluded_filetypes = {"cmp_menu", "cmp_docs", "notify"}}, status = {}, throttle = (1000 / 30), views = {}}
  M.config = function()
    settings.markdown.hover["%[.-%]%((%S-)%)"] = (require("noice.util")).open
    return (require("noice")).setup(settings)
  end
  return M
else
end
return M

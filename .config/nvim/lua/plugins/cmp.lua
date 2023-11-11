-- [nfnl] Compiled from fnl/plugins/cmp.fnl by https://github.com/Olical/nfnl, do not edit.
local M = {"hrsh7th/nvim-cmp", commit = "cfafe0a1ca8933f7b7968a287d39904156f2c57d", dependencies = {{"hrsh7th/cmp-nvim-lsp", commit = "0e6b2ed705ddcff9738ec4ea838141654f12eeef"}, {"hrsh7th/cmp-buffer", commit = "3022dbc9166796b644a841a02de8dd1cc1d311fa"}, {"hrsh7th/cmp-path", commit = "91ff86cd9c29299a64f968ebb45846c485725f23"}, {"hrsh7th/cmp-cmdline", commit = "23c51b2a3c00f6abc4e922dbd7c3b9aca6992063"}, {"saadparwaiz1/cmp_luasnip", commit = "18095520391186d634a0045dacaa346291096566"}, {"L3MON4D3/LuaSnip", commit = "9bff06b570df29434a88f9c6a9cea3b21ca17208", dependencies = {"rafamadriz/friendly-snippets", commit = "a6f7a1609addb4e57daa6bedc300f77f8d225ab7"}, event = "InsertEnter"}, {"hrsh7th/cmp-nvim-lua", commit = "f3491638d123cfd2c8048aefaf66d246ff250ca6"}}, event = {"InsertEnter", "CmdlineEnter"}}
M.config = function()
  local cmp = require("cmp")
  local luasnip = require("luasnip")
  do end (require("luasnip/loaders/from_vscode")).lazy_load()
  local function check_backspace()
    local col = (vim.fn.col(".") - 1)
    return ((col == 0) or vim.fn.getline("."):sub(col, col):match("%s"))
  end
  local kind_icons = {Class = "\239\160\150", Color = "\239\163\151", Constant = "\239\155\188", Constructor = "\239\154\166", Enum = "\239\133\157", EnumMember = "\239\133\157", Event = "\239\131\167", Field = "\238\156\150", File = "\239\156\152", Folder = "\239\157\138", Function = "\239\154\166", Interface = "\239\131\168", Keyword = "\239\157\167", Method = "\239\154\166", Module = "\239\153\168", Operator = "\239\154\148", Property = "\239\130\173", Reference = "\239\146\129", Snippet = "\239\151\143", Struct = "\239\134\179", Text = "\239\157\190", TypeParameter = "\239\158\131", Unit = "\238\136\159", Value = "\239\162\159", Variable = "\238\156\150"}
  local function _1_(entry, vim_item)
    vim_item.kind = kind_icons[vim_item.kind]
    vim_item.menu = ({buffer = "", emoji = "", luasnip = "", nvim_lsp = "", nvim_lua = "", path = ""})[entry.source.name]
    return vim_item
  end
  local function _2_(fallback)
    if cmp.visible() then
      return cmp.select_prev_item()
    elseif luasnip.jumpable(( - 1)) then
      return luasnip.jump(( - 1))
    else
      return fallback()
    end
  end
  local function _4_(fallback)
    if cmp.visible() then
      return cmp.select_next_item()
    elseif luasnip.expandable() then
      return luasnip.expand()
    elseif luasnip.expand_or_jumpable() then
      return luasnip.expand_or_jump()
    elseif check_backspace() then
      return fallback()
    else
      return fallback()
    end
  end
  local function _6_(args)
    return luasnip.lsp_expand(args.body)
  end
  return cmp.setup({confirm_opts = {behavior = cmp.ConfirmBehavior.Replace, select = false}, experimental = {ghost_text = true}, formatting = {fields = {"kind", "abbr", "menu"}, format = _1_}, mapping = cmp.mapping.preset.insert({["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), {"i", "c"}), ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(( - 1)), {"i", "c"}), ["<C-e>"] = cmp.mapping({c = cmp.mapping.close(), i = cmp.mapping.abort()}), ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), {"i", "c"}), ["<C-j>"] = cmp.mapping.select_next_item(), ["<C-k>"] = cmp.mapping.select_prev_item(), ["<CR>"] = cmp.mapping.confirm({select = true}), ["<S-Tab>"] = cmp.mapping(_2_, {"i", "s"}), ["<Tab>"] = cmp.mapping(_4_, {"i", "s"})}), snippet = {expand = _6_}, sources = {{name = "nvim_lsp"}, {name = "nvim_lua"}, {name = "luasnip"}, {name = "buffer"}, {name = "path"}}, window = {completion = cmp.config.window.bordered(), documentation = cmp.config.window.bordered()}})
end
return M

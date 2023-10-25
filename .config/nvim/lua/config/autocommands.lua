local function _1_()
  return vim.cmd("nnoremap <silent> <buffer> q :close<CR> set nobuflisted")
end
vim.api.nvim_create_autocmd({"FileType"}, {callback = _1_, pattern = {"qf", "help", "man", "lspinfo", "spectre_panel"}})
local function _2_()
  vim.opt_local.wrap = true
  vim.opt_local.spell = true
  return nil
end
vim.api.nvim_create_autocmd({"FileType"}, {callback = _2_, pattern = {"gitcommit", "markdown"}})
vim.cmd("autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif")
local function _3_()
  return vim.cmd("tabdo wincmd =")
end
vim.api.nvim_create_autocmd({"VimResized"}, {callback = _3_})
local function _4_()
  return vim.cmd("quit")
end
vim.api.nvim_create_autocmd({"CmdWinEnter"}, {callback = _4_})
local function _5_()
  return vim.highlight.on_yank({higroup = "Visual", timeout = 200})
end
vim.api.nvim_create_autocmd({"TextYankPost"}, {callback = _5_})
local function _6_()
  return vim.lsp.codelens.refresh()
end
vim.api.nvim_create_autocmd({"BufWritePost"}, {callback = _6_, pattern = {"*.java"}})
local function _7_()
  return vim.cmd("hi link illuminatedWord LspReferenceText")
end
vim.api.nvim_create_autocmd({"VimEnter"}, {callback = _7_})
local function _8_()
  local line_count = vim.api.nvim_buf_line_count(0)
  if (line_count >= 5000) then
    return vim.cmd("IlluminatePauseBuf")
  else
    return nil
  end
end
vim.api.nvim_create_autocmd({"BufWinEnter"}, {callback = _8_})
local format_sync_grp = vim.api.nvim_create_augroup("GoImport", {})
local function _10_()
  return require("go.format").goimport()
end
return vim.api.nvim_create_autocmd("BufWritePre", {callback = _10_, group = format_sync_grp, pattern = "*.go"})

local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local nvim = autoload("nvim")
local core = autoload("nfnl.core")
nvim.set_keymap("n", "<space>", "<nop>", {noremap = true})
do
  local options = {ptencoding = "utf-8", encoding = "utf-8", fileencoding = "utf-8", number = true, relativenumber = true, title = true, autoindent = true, smartindent = true, hlsearch = true, showcmd = true, cmdheight = 1, laststatus = 3, expandtab = true, scrolloff = 10, sidescrolloff = 10, backupskip = "/tmp/*,/private/tmp/*", inccommand = "split", ignorecase = true, smarttab = true, breakindent = true, shiftwidth = 2, tabstop = 2, softtabstop = 2, backspace = "start,eol,indent", ["listchars:append"] = "eol:\226\134\180", list = true, ["path:append"] = "**", ["wildignore:append"] = "*/node_modules/*", clipboard = "unnamedplus", hidden = true, incsearch = true, updatetime = 300, signcolumn = "yes", cursorline = true, completeopt = "menuone,noselect", conceallevel = 0, mouse = "a", pumheight = 10, showtabline = 0, smartcase = true, termguicolors = true, timeout = true, timeoutlen = 300, undofile = true, numberwidth = 4, guifont = "monospace:h17", ["fillchars.eob"] = " ", ["shortmess:append"] = "c", ["whichwrap:append"] = "<,>,[,],h,l", ["iskeyword:append"] = "-", linebreak = true, backup = false, ruler = false, splitbelow = false, splitright = false, swapfile = false, wrap = false, writebackup = false}
  for option, value in pairs(options) do
    core.assoc(nvim.o, option, value)
  end
end
return {}

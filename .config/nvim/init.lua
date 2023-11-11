local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  print("nvim is bootstrapping.")
  local fn = vim.fn

  fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--single-branch",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end

vim.opt.runtimepath:prepend(lazypath)
vim.loader.enable()

-- Make sure to set `mapleader` before lazy so your mappings are correct
vim.g.mapleader = " "
vim.g.maplocalleader = ","

require("lazy").setup("plugins", {
  wait = true,
  install = { colorscheme = { require("plugins.colorscheme").name }, wait = true },
  defaults = { lazy = true, version = "57cce98dfdb2f2dd05a0567d89811e6d0505e13b" },
  ui = { wrap = "true" },
  change_detection = { enabled = true },
  debug = false,
  performance = {
    rtp = {
      disabled_plugins = {
        -- "gzip", -- Plugin for editing compressed files.
        -- "matchit", -- What is it?
        --  "matchparen", -- Plugin for showing matching parens
        --  "netrwPlugin", -- Handles file transfers and remote directory listing across a network
        --  "tarPlugin", -- Plugin for browsing tar files
        --  "tohtml", -- Converting a syntax highlighted file to HTML
        --  "tutor", -- Teaching?
        --  "zipPlugin", -- Handles browsing zipfiles
      },
    },
  },
}
)

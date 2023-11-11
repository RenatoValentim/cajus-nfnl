(local M {1 :folke/tokyonight.nvim
          :commit :e52c41314e83232840d6970e6b072f9fba242eb9
          :lazy false
          :priority 1000})
(set M.name :tokyonight-night)
(fn M.config []
  (let [(status-ok _) (pcall vim.cmd.colorscheme M.name)]
    (when (not status-ok) nil)))
M	

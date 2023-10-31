(local M {1 :glepnir/lspsaga.nvim
          :branch :main
          :dependencies [:nvim-tree/nvim-web-devicons
                         :nvim-treesitter/nvim-treesitter]
          :event :LspAttach})
(local settings {:symbol_in_winbar {:color_mode true
                                    :enable true
                                    :folder_level 2
                                    :hide_keyword true
                                    :respect_root false
                                    :separator " » "
                                    :show_file true}})
(fn M.config []
  (let [lspsaga (require :lspsaga)] (lspsaga.setup settings)))
M	

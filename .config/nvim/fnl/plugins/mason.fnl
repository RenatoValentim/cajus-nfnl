(local M {1 :williamboman/mason.nvim
          :cmd :Mason
          :commit :4546dec8b56bc56bc1d81e717e4a935bc7cd6477
          :dependencies [{1 :williamboman/mason-lspconfig.nvim
                          :commit :93e58e100f37ef4fb0f897deeed20599dae9d128
                          :lazy true}]
          :event :BufReadPre})
(local settings {:log_level vim.log.levels.INFO
                 :max_concurrent_installers 4
                 :ui {:border :none
                      :icons {:package_installed "◍"
                              :package_pending "◍"
                              :package_uninstalled "◍"}}})
(fn M.config []
  ((. (require :mason) :setup) settings)
  ((. (require :mason-lspconfig) :setup) {:automatic_installation true
                                          :ensure_installed (. (require :config.get-os-architecture)
                                                               :servers)}))
M	

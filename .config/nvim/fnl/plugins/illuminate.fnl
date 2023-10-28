(local M {1 :RRethy/vim-illuminate
          :commit :d6ca7f77eeaf61b3e6ce9f0e5a978d606df44298
          :event :VeryLazy})
(fn M.config []
  (let [illuminate (require :illuminate)]
    (set vim.g.Illuminate_ftblacklist [:alpha :NvimTree])
    (vim.api.nvim_set_keymap :n :<a-n>
                             "<cmd>lua require\"illuminate\".next_reference{wrap=true}<cr>"
                             {:noremap true})
    (vim.api.nvim_set_keymap :n :<a-p>
                             "<cmd>lua require\"illuminate\".next_reference{reverse=true,wrap=true}<cr>"
                             {:noremap true})
    (illuminate.configure {:delay 200
                           :filetypes_allowlist {}
                           :filetypes_denylist [:dirvish
                                                :fugitive
                                                :alpha
                                                :NvimTree
                                                :neogitstatus
                                                :Trouble
                                                :lir
                                                :Outline
                                                :spectre_panel
                                                :toggleterm
                                                :DressingSelect
                                                :TelescopePrompt]
                           :modes_allowlist {}
                           :modes_denylist {}
                           :providers [:lsp :treesitter :regex]
                           :providers_regex_syntax_allowlist {}
                           :providers_regex_syntax_denylist {}
                           :under_cursor true})))
M	

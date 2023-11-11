(local M {1 :hrsh7th/nvim-cmp
          :commit :cfafe0a1ca8933f7b7968a287d39904156f2c57d
          :dependencies [{1 :hrsh7th/cmp-nvim-lsp
                          :commit :0e6b2ed705ddcff9738ec4ea838141654f12eeef}
                         {1 :hrsh7th/cmp-buffer
                          :commit :3022dbc9166796b644a841a02de8dd1cc1d311fa}
                         {1 :hrsh7th/cmp-path
                          :commit :91ff86cd9c29299a64f968ebb45846c485725f23}
                         {1 :hrsh7th/cmp-cmdline
                          :commit :23c51b2a3c00f6abc4e922dbd7c3b9aca6992063}
                         {1 :saadparwaiz1/cmp_luasnip
                          :commit :18095520391186d634a0045dacaa346291096566}
                         {1 :L3MON4D3/LuaSnip
                          :commit :9bff06b570df29434a88f9c6a9cea3b21ca17208
                          :dependencies {1 :rafamadriz/friendly-snippets
                                         :commit :a6f7a1609addb4e57daa6bedc300f77f8d225ab7}
                          :event :InsertEnter}
                         {1 :hrsh7th/cmp-nvim-lua
                          :commit :f3491638d123cfd2c8048aefaf66d246ff250ca6}]
          :event [:InsertEnter :CmdlineEnter]})
(fn M.config []
  (let [cmp (require :cmp)
        luasnip (require :luasnip)]
    ((. (require :luasnip/loaders/from_vscode) :lazy_load))

    (fn check-backspace []
      (let [col (- (vim.fn.col ".") 1)]
        (or (= col 0) (: (: (vim.fn.getline ".") :sub col col) :match "%s"))))

    (local kind-icons {:Class ""
                       :Color ""
                       :Constant ""
                       :Constructor ""
                       :Enum ""
                       :EnumMember ""
                       :Event ""
                       :Field ""
                       :File ""
                       :Folder ""
                       :Function ""
                       :Interface ""
                       :Keyword ""
                       :Method ""
                       :Module ""
                       :Operator ""
                       :Property ""
                       :Reference ""
                       :Snippet ""
                       :Struct ""
                       :Text ""
                       :TypeParameter ""
                       :Unit ""
                       :Value ""
                       :Variable ""})
    (cmp.setup {:confirm_opts {:behavior cmp.ConfirmBehavior.Replace
                               :select false}
                :experimental {:ghost_text true}
                :formatting {:fields [:kind :abbr :menu]
                             :format (fn [entry vim-item]
                                       (set vim-item.kind
                                            (. kind-icons vim-item.kind))
                                       (set vim-item.menu
                                            (. {:buffer ""
                                                :emoji ""
                                                :luasnip ""
                                                :nvim_lsp ""
                                                :nvim_lua ""
                                                :path ""}
                                               entry.source.name))
                                       vim-item)}
                :mapping (cmp.mapping.preset.insert {:<C-Space> (cmp.mapping (cmp.mapping.complete)
                                                                             [:i
                                                                              :c])
                                                     :<C-b> (cmp.mapping (cmp.mapping.scroll_docs (- 1))
                                                                         [:i
                                                                          :c])
                                                     :<C-e> (cmp.mapping {:c (cmp.mapping.close)
                                                                          :i (cmp.mapping.abort)})
                                                     :<C-f> (cmp.mapping (cmp.mapping.scroll_docs 1)
                                                                         [:i
                                                                          :c])
                                                     :<C-j> (cmp.mapping.select_next_item)
                                                     :<C-k> (cmp.mapping.select_prev_item)
                                                     :<CR> (cmp.mapping.confirm {:select true})
                                                     :<S-Tab> (cmp.mapping (fn [fallback]
                                                                             (if (cmp.visible)
                                                                                 (cmp.select_prev_item)
                                                                                 (luasnip.jumpable (- 1))
                                                                                 (luasnip.jump (- 1))
                                                                                 (fallback)))
                                                                           [:i
                                                                            :s])
                                                     :<Tab> (cmp.mapping (fn [fallback]
                                                                           (if (cmp.visible)
                                                                               (cmp.select_next_item)
                                                                               (luasnip.expandable)
                                                                               (luasnip.expand)
                                                                               (luasnip.expand_or_jumpable)
                                                                               (luasnip.expand_or_jump)
                                                                               (check-backspace)
                                                                               (fallback)
                                                                               (fallback)))
                                                                         [:i
                                                                          :s])})
                :snippet {:expand (fn [args] (luasnip.lsp_expand args.body))}
                :sources [{:name :nvim_lsp}
                          {:name :nvim_lua}
                          {:name :luasnip}
                          {:name :buffer}
                          {:name :path}]
                :window {:completion (cmp.config.window.bordered)
                         :documentation (cmp.config.window.bordered)}})))
M	

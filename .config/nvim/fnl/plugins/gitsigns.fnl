(local M {1 :lewis6991/gitsigns.nvim
          :commit :a36bc3360d584d39b4fb076d855c4180842d4444
          :event :BufReadPre})
(set M.opts {:attach_to_untracked true
             :current_line_blame true
             :current_line_blame_formatter " <author>, <author_time:%Y-%m-%d %H:%M:%S> - <summary>"
             :current_line_blame_opts {:delay 5
                                       :virt_text true
                                       :virt_text_pos :eol}
             :preview_config {:border :single
                              :col 1
                              :relative :cursor
                              :row 0
                              :style :minimal}
             :sign_priority 6
             :signcolumn true
             :signs {:add {:hl :GitSignsAdd
                           :linehl :GitSignsAddLn
                           :numhl :GitSignsAddNr
                           :text "▎"}
                     :change {:hl :GitSignsChange
                              :linehl :GitSignsChangeLn
                              :numhl :GitSignsChangeNr
                              :text "▎"}
                     :changedelete {:hl :GitSignsChange
                                    :linehl :GitSignsChangeLn
                                    :numhl :GitSignsChangeNr
                                    :text "▎"}
                     :delete {:hl :GitSignsDelete
                              :linehl :GitSignsDeleteLn
                              :numhl :GitSignsDeleteNr
                              :text ""}
                     :topdelete {:hl :GitSignsDelete
                                 :linehl :GitSignsDeleteLn
                                 :numhl :GitSignsDeleteNr
                                 :text ""}}
             :status_formatter nil
             :update_debounce 100
             :watch_gitdir {:follow_files true :interval 1000}})
M	

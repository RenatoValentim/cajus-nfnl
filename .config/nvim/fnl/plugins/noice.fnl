(var M {})
(local terminal-width vim.o.columns)
(local noice-min-width 80)
(local notify-min-width 187)
(local can-use-noice (>= terminal-width noice-min-width))
(var can-use-notify (>= terminal-width notify-min-width))
(set can-use-notify false)
(when can-use-noice
  (set M {1 :folke/noice.nvim
          :dependencies [:MunifTanjim/nui.nvim]
          :event :VeryLazy
          :opts {}})
  (when can-use-notify (table.insert M.dependencies :rcarriga/nvim-notify))
  (local settings {:cmdline {:enabled true
                             :format {:cmdline {:icon ""
                                                :lang :vim
                                                :pattern "^:"}
                                      :filter {:icon ""
                                               :lang :bash
                                               :pattern "^:%s*!"}
                                      :help {:icon ""
                                             :pattern "^:%s*he?l?p?%s+"}
                                      :input {}
                                      :lua {:icon ""
                                            :lang :lua
                                            :pattern ["^:%s*lua%s+"
                                                      "^:%s*lua%s*=%s*"
                                                      "^:%s*=%s*"]}
                                      :search_down {:icon " "
                                                    :kind :search
                                                    :lang :regex
                                                    :pattern "^/"}
                                      :search_up {:icon " "
                                                  :kind :search
                                                  :lang :regex
                                                  :pattern "^%?"}}
                             :opts {}
                             :view :cmdline_popup}
                   :commands {:errors {:filter {:error true}
                                       :filter_opts {:reverse true}
                                       :opts {:enter true :format :details}
                                       :view :popup}
                              :history {:filter {:any [{:event :notify}
                                                       {:error true}
                                                       {:warning true}
                                                       {:event :msg_show
                                                        :kind [""]}
                                                       {:event :lsp
                                                        :kind :message}]}
                                        :opts {:enter true :format :details}
                                        :view :split}
                              :last {:filter {:any [{:event :notify}
                                                    {:error true}
                                                    {:warning true}
                                                    {:event :msg_show
                                                     :kind [""]}
                                                    {:event :lsp
                                                     :kind :message}]}
                                     :filter_opts {:count 1}
                                     :opts {:enter true :format :details}
                                     :view :popup}}
                   :format {}
                   :health {:checker true}
                   :lsp {:documentation {:opts {:format ["{message}"]
                                                :lang :markdown
                                                :render :plain
                                                :replace true
                                                :win_options {:concealcursor :n
                                                              :conceallevel 3}}
                                         :view :hover}
                         :hover {:enabled true
                                 :opts {}
                                 :silent false
                                 :view nil}
                         :message {:enabled true :opts {} :view :notify}
                         :override {:cmp.entry.get_documentation true
                                    :vim.lsp.util.convert_input_to_markdown_lines true
                                    :vim.lsp.util.stylize_markdown true}
                         :progress {:enabled true
                                    :format :lsp_progress
                                    :format_done :lsp_progress_done
                                    :throttle (/ 1000 30)
                                    :view :mini}
                         :signature {:auto_open {:enabled true
                                                 :luasnip true
                                                 :throttle 50
                                                 :trigger true}
                                     :enabled true
                                     :opts {}
                                     :view nil}}
                   :markdown {:highlights {"@%S+" "@parameter"
                                           "^%s*(Parameters:)" "@text.title"
                                           "^%s*(Return:)" "@text.title"
                                           "^%s*(See also:)" "@text.title"
                                           "{%S-}" "@parameter"
                                           "|%S-|" "@text.reference"}
                              :hover {"|(%S-)|" vim.cmd.help}}
                   :messages {:enabled true
                              :view :notify
                              :view_error :notify
                              :view_history :messages
                              :view_search :virtualtext
                              :view_warn :notify}
                   :notify {:enabled true :view :notify}
                   :popupmenu {:backend :nui :enabled true :kind_icons {}}
                   :presets {:bottom_search false
                             :command_palette true
                             :inc_rename true
                             :long_message_to_split true
                             :lsp_doc_border true}
                   :redirect {:filter {:event :msg_show} :view :popup}
                   :routes {}
                   :smart_move {:enabled true
                                :excluded_filetypes [:cmp_menu
                                                     :cmp_docs
                                                     :notify]}
                   :status {}
                   :throttle (/ 1000 30)
                   :views {}})

  (fn M.config []
    (tset settings.markdown.hover "%[.-%]%((%S-)%)"
          (. (require :noice.util) :open))
    ((. (require :noice) :setup) settings))

  (lua "return M"))
M	

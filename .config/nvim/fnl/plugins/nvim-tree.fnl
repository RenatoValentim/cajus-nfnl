(local M {1 :kyazdani42/nvim-tree.lua
          :commit :59e65d88db177ad1e6a8cffaafd4738420ad20b6
          :dependencies [:nvim-tree/nvim-web-devicons]
          :event :VimEnter})
(fn M.config []
  (let [tree-cb (. (require :nvim-tree.config) :nvim_tree_callback)]
    ((. (require :nvim-tree) :setup) {:diagnostics {:enable true
                                                    :icons {:error ""
                                                            :hint ""
                                                            :info ""
                                                            :warning ""}
                                                    :show_on_dirs true}
                                      :git {:enable true
                                            :ignore false
                                            :show_on_dirs true
                                            :show_on_open_dirs true
                                            :timeout 200}
                                      :renderer {:add_trailing false
                                                 :full_name false
                                                 :group_empty false
                                                 :highlight_git true
                                                 :highlight_opened_files :none
                                                 :icons {:git_placement :before
                                                         :glyphs {:default ""
                                                                  :folder {:arrow_closed ""
                                                                           :arrow_open ""
                                                                           :default ""
                                                                           :empty ""
                                                                           :empty_open ""
                                                                           :open ""
                                                                           :symlink ""
                                                                           :symlink_open ""}
                                                                  :git {:deleted ""
                                                                        :ignored "◌"
                                                                        :renamed ""
                                                                        :staged :S
                                                                        :unmerged ""
                                                                        :unstaged ""
                                                                        :untracked :U}
                                                                  :symlink ""}
                                                         :padding " "
                                                         :symlink_arrow " ➛ "}
                                                 :indent_markers {:enable true
                                                                  :icons {:corner "└"
                                                                          :edge "│"
                                                                          :item "│"
                                                                          :none " "}
                                                                  :inline_arrows true}
                                                 :indent_width 2
                                                 :root_folder_modifier ":t"}
                                      :update_focused_file {:enable true
                                                            :update_cwd true}
                                      :view {:adaptive_size true
                                             :mappings {:list [{:cb (tree-cb :edit)
                                                                :key [:l
                                                                      :<CR>
                                                                      :o]}
                                                               {:cb (tree-cb :close_node)
                                                                :key :h}
                                                               {:cb (tree-cb :vsplit)
                                                                :key :v}]}}})))
M	

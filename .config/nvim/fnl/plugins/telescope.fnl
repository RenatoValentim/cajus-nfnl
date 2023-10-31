(local M {1 :nvim-telescope/telescope.nvim
          :cmd [:Telescope]
          :commit :00cf15074a2997487813672a75f946d2ead95eb0
          :dependencies [{1 :ahmedkhalf/project.nvim
                          :commit :685bc8e3890d2feb07ccf919522c97f7d33b94e4}
                         [:nvim-telescope/telescope-file-browser.nvim]]
          :event :Bufenter})
(fn M.config []
  (let [telescope (require :telescope)
        actions (require :telescope.actions)]
    (fn telescope-buffer-dir [] (vim.fn.expand "%:p:h"))

    (local fb-actions (. (. (. (require :telescope) :extensions) :file_browser)
                         :actions))
    (telescope.setup {:defaults {:file_ignore_patterns [:.git/
                                                        :node_modules
                                                        :venv
                                                        :.venv]
                                 :mappings {:i {:<C-j> actions.move_selection_next
                                                :<C-k> actions.move_selection_previous
                                                :<Down> actions.cycle_history_next
                                                :<Up> actions.cycle_history_prev}
                                            :n {:q actions.close}}
                                 :path_display [:smart]
                                 :prompt_prefix " "
                                 :selection_caret " "}
                      :extensions {:file_browser {:hijack_netrw true
                                                  :mappings {:i {:<C-w> (fn []
                                                                          (vim.cmd "normal vbd"))}
                                                             :n {:/ (fn []
                                                                      (vim.cmd :startinsert))
                                                                 :N fb-actions.create
                                                                 :c fb-actions.copy
                                                                 :h fb-actions.goto_parent_dir
                                                                 :m fb-actions.move
                                                                 :r fb-actions.rename
                                                                 :x fb-actions.remove}}
                                                  :theme :dropdown}}})
    (telescope.load_extension :file_browser)
    (vim.keymap.set :n :<leader>fe
                    (fn []
                      (telescope.extensions.file_browser.file_browser {:cwd (telescope-buffer-dir)
                                                                       :grouped true
                                                                       :hidden true
                                                                       :initial_mode :normal
                                                                       :layout_config {:height 40}
                                                                       :path "%:p:h"
                                                                       :previewer false
                                                                       :respect_gitignore false})))))
M	

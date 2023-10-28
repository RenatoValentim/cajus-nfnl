(local M {1 :folke/todo-comments.nvim
          :dependencies [:nvim-lua/plenary.nvim]
          :event :LspAttach})
(fn M.config []
  (let [todo-comments (require :todo-comments)]
    (todo-comments.setup {:keywords {:FIX {:alt [:FIXME
                                                 :BUG
                                                 :FIXIT
                                                 :ISSUE
                                                 :ERROR
                                                 :ERR]
                                           :color "#DC2626"
                                           :icon " "}
                                     :HACK {:color "#FBBF24" :icon " "}
                                     :NOTE {:alt [:INFO]
                                            :color "#10B981"
                                            :icon " "}
                                     :PERF {:alt [:OPTIM
                                                  :PERFORMANCE
                                                  :OPTIMIZE]
                                            :icon " "}
                                     :TODO {:color "#2563EB" :icon " "}
                                     :WARN {:alt [:WARNING :XXX]
                                            :color "#FBBF24"
                                            :icon " "}}})
    (vim.keymap.set :n :<leader>tqf ":TodoQuickFix<Return>" {})
    (vim.keymap.set :n :<leader>tll ":TodoLocList<Return>" {})
    (vim.keymap.set :n :<leader>tt ":TodoTelescope<Return>" {})))
M	

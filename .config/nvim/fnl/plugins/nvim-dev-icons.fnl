(local M {1 :nvim-tree/nvim-web-devicons
          :commit :0568104bf8d0c3ab16395433fcc5c1638efc25d4
          :event :VeryLazy})
(fn M.config []
  ((. (require :nvim-web-devicons) :setup) {:color_icons true
                                            :default true
                                            :override {:.dockerignore {:color "#22b2e3"
                                                                       :icon ""
                                                                       :name :.dockerignore}
                                                       :.env.example {:color "#eed202"
                                                                      :icon ""
                                                                      :name :env}
                                                       :Dockerfile {:color "#22b2e3"
                                                                    :icon ""
                                                                    :name :dockerfile}
                                                       :app.env {:color "#eed202"
                                                                 :icon ""
                                                                 :name :env}
                                                       :app.env.example {:color "#eed202"
                                                                         :icon ""
                                                                         :name :env}
                                                       :docker-compose.yml {:color "#22b2e3"
                                                                            :icon ""
                                                                            :name :dockercompose}
                                                       :go.mod {:color "#de5048"
                                                                :icon "ﳑ"
                                                                :name :gomod}
                                                       :go.sum {:color "#de5048"
                                                                :icon "ﳑ"
                                                                :name :gosum}
                                                       :zsh {:color "#428850"
                                                             :cterm_color :65
                                                             :icon ""
                                                             :name :Zsh}}}))
M	

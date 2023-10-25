(local M {1 :goolord/alpha-nvim
          :commit :dafa11a6218c2296df044e00f88d9187222ba6b0
          :event :VimEnter})
(fn M.config []
  (let [alpha (require :alpha)
        dashboard (require :alpha.themes.dashboard)]
    (set dashboard.section.header.val
         ["                                                     "
          "                                                     "
          "                                                     "
          "                                                     "
          "                                                     "
          "                                                     "
          "                                                     "
          "                                                     "
          "                                                     "
          "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ "
          "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ "
          "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ "
          "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ "
          "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ "
          "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ "
          "                                                     "])
    (set dashboard.section.buttons.val
         [(dashboard.button :f (.. " " " Find file")
                            ":Telescope find_files <CR>")
          (dashboard.button :e (.. " " " New file")
                            ":ene <BAR> startinsert <CR>")
          (dashboard.button :p (.. " " " Find project")
                            ":lua require('telescope').extensions.projects.projects()<CR>")
          (dashboard.button :r (.. " " " Recent files")
                            ":Telescope oldfiles <CR>")
          (dashboard.button :t (.. " " " Find text")
                            ":Telescope live_grep <CR>")
          (dashboard.button :c (.. " " " Config") ":e $MYVIMRC <CR>")
          (dashboard.button :q (.. " " " Quit") ":qa<CR>")])

    (fn footer []
      ["                                  "
       "          Renato Valentim         "
       :github.com/RenatoValentim/dotfiles])

    (set dashboard.section.footer.val (footer))
    (set dashboard.section.footer.opts.hl :Type)
    (set dashboard.section.header.opts.hl :Include)
    (set dashboard.section.buttons.opts.hl :Keyword)
    (set dashboard.opts.opts.noautocmd true)
    (alpha.setup dashboard.opts)))
M	

(local M {1 :nvim-lualine/lualine.nvim
          :commit :0050b308552e45f7128f399886c86afefc3eb988
          :dependencies {1 :wthollingsworth/pomodoro.nvim
                         :dependencies :MunifTanjim/nui.nvim}
          :event [:VimEnter
                  :InsertEnter
                  :BufReadPre
                  :BufAdd
                  :BufNew
                  :BufReadPost]})
(fn M.config []
  (let [lualine (require :lualine)]
    (fn hide-in-width [] (> (vim.fn.winwidth 0) 80))

    (local pomodoro (require :pomodoro))
    (var (noice-ok noice) (pcall require :noice))
    (when (not noice-ok) (set noice {}))
    (local diagnostics
           {1 :diagnostics
            :always_visible false
            :colored true
            :sections [:error :warn]
            :sources [:nvim_diagnostic]
            :symbols {:error " " :warn " "}})
    (local diff
           {1 :diff
            :colored true
            :cond hide-in-width
            :symbols {:added " " :modified " " :removed " "}})
    (local filetype {1 :filetype :icons_enabled true})
    (local location {1 :location :padding 1.5})
    (local progress {1 :progress :color {} :fmt (fn [] "%P/%L")})

    (fn spaces [] (.. " " (vim.api.nvim_buf_get_option 0 :shiftwidth)))

    (fn env-cleanup [venv]
      (when (string.find venv "/")
        (var final-venv venv)
        (each [w (venv:gmatch "([^/]+)")] (set final-venv w))
        (set-forcibly! venv final-venv))
      venv)

    (set-forcibly! hide-in-width
                   (fn []
                     (let [window-width-limit 100]
                       (> vim.o.columns window-width-limit))))
    (local py-component
           {:python_env {1 (fn []
                             (when (= vim.bo.filetype :python)
                               (local venv
                                      (or (os.getenv :CONDA_DEFAULT_ENV)
                                          (os.getenv :VIRTUAL_ENV)))
                               (when venv
                                 (let [___antifnl_rtns_1___ [(string.format "(%s)"
                                                                            (env-cleanup venv))]]
                                   (lua "return (table.unpack or _G.unpack)(___antifnl_rtns_1___)"))))
                             "")
                         :color {:fg "#98be65"}
                         :cond hide-in-width}})
    (local lsp-component {:lsp {1 (fn [msg]
                                    (set-forcibly! msg (or msg "LS Inactive"))
                                    (local buf-clients
                                           (vim.lsp.buf_get_clients))
                                    (when (= (next buf-clients) nil)
                                      (when (or (= (type msg) :boolean)
                                                (= (length msg) 0))
                                        (lua "return \"LS Inactive\""))
                                      (lua "return msg"))
                                    (local buf-client-names {})
                                    (each [_ client (pairs buf-clients)]
                                      (when (and (not= client.name :null-ls)
                                                 (not= client.name :copilot))
                                        (table.insert buf-client-names
                                                      client.name)))
                                    (local unique-client-names
                                           (vim.fn.uniq buf-client-names))
                                    (local language-servers
                                           (.. "["
                                               (table.concat unique-client-names
                                                             ", ")
                                               "]"))
                                    (when (= language-servers "[]")
                                      (lua "return \"Ls Inactive\""))
                                    language-servers)
                                :color {:fg "#0078d7" :gui :bold}
                                :cond hide-in-width}})
    (local pomodoro-component
           {:statusline {1 pomodoro.statusline
                         :color {:fg :red :gui :bold}
                         :cond hide-in-width}})
    (var noice-component [""])
    (when noice-ok
      (set noice-component
           {1 noice.api.statusline.mode.get
            :color {:fg "#ff9e64"}
            :cond noice.api.statusline.mode.has}))
    (lualine.setup {:options {:always_divide_middle true
                              :component_separators {:left "" :right ""}
                              :disabled_filetypes [:alpha :dashboard]
                              :globalstatus true
                              :icons_enabled true
                              :section_separators {:left "" :right ""}
                              :theme :auto}
                    :sections {:lualine_a [:mode]
                               :lualine_b [{1 "b:gitsigns_head"
                                            :color {:gui :bold}
                                            :icon ""}]
                               :lualine_c [diagnostics]
                               :lualine_x [diff
                                           noice-component
                                           pomodoro-component.statusline
                                           lsp-component.lsp
                                           spaces
                                           filetype
                                           py-component.python_env]
                               :lualine_y [location]
                               :lualine_z [progress]}})))
M	

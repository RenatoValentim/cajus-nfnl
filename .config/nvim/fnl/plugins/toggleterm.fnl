(local M {1 :akinsho/toggleterm.nvim
          :commit :19aad0f41f47affbba1274f05e3c067e6d718e1e
          :event :VeryLazy})
(fn M.config []
  (let [(status-ok toggleterm) (pcall require :toggleterm)]
    (when (not status-ok) (lua "return "))
    (toggleterm.setup {:close_on_exit true
                       :direction :float
                       :float_opts {:border :curved :height 40 :width 100000}
                       :hide_numbers true
                       :insert_mappings true
                       :open_mapping :<c-t>
                       :persist_size false
                       :shade_terminals true
                       :shading_factor 2
                       :shell vim.o.shell
                       :size 20
                       :start_in_insert true})

    (fn _G.set_terminal_keymaps []
      (let [opts {:noremap true}]
        (vim.api.nvim_buf_set_keymap 0 :t :<C-j> "<C-\\><C-n><C-W>j" opts)
        (vim.api.nvim_buf_set_keymap 0 :t :<C-k> "<C-\\><C-n><C-W>k" opts)))

    (vim.cmd "autocmd! TermOpen term://* lua set_terminal_keymaps()")
    (local Terminal (. (require :toggleterm.terminal) :Terminal))
    (local lazygit
           (Terminal:new {:cmd :lazygit
                          :count 99
                          :direction :float
                          :float_opts {:border :none :height 45 :width 100000}
                          :hidden true
                          :on_close (fn [_])
                          :on_open (fn [_] (vim.cmd :startinsert!))}))
    (set-forcibly! _LAZYGIT_TOGGLE (fn [] (lazygit:toggle)))))
M	

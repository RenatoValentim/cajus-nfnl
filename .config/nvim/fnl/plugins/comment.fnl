(local M {1 :numToStr/Comment.nvim
          :commit :e1fe53117aab24c378d5e6deaad786789c360123
          :dependencies [{1 :JoosepAlviste/nvim-ts-context-commentstring
                          :commit :0bf8fbc2ca8f8cdb6efbd0a9e32740d7a991e4c3
                          :event :VeryLazy}]
          :event [:BufRead :BufNewFile]})
(fn M.config []
  (global pre-hook
          (fn [ctx]
            (when (= vim.bo.filetype :typescriptreact)
              (local U (require :Comment.utils))
              (local type (or (and (= ctx.ctype U.ctype.linewise) :__default)
                              :__multiline))
              (var location nil)
              (if (= ctx.ctype U.ctype.blockwise)
                  (set location
                       ((. (require :ts_context_commentstring.utils)
                           :get_cursor_location)))
                  (or (= ctx.cmotion U.cmotion.v) (= ctx.cmotion U.cmotion.V))
                  (set location
                       ((. (require :ts_context_commentstring.utils)
                           :get_visual_start_location))))
              ((. (require :ts_context_commentstring.internal)
                  :calculate_commentstring) {:key type
                                                                                                            : location})))))
M	

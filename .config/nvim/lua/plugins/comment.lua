-- [nfnl] Compiled from fnl/plugins/comment.fnl by https://github.com/Olical/nfnl, do not edit.
local M = {"numToStr/Comment.nvim", commit = "e1fe53117aab24c378d5e6deaad786789c360123", dependencies = {{"JoosepAlviste/nvim-ts-context-commentstring", commit = "0bf8fbc2ca8f8cdb6efbd0a9e32740d7a991e4c3", event = "VeryLazy"}}, event = {"BufRead", "BufNewFile"}}
M.config = function()
  local function _1_(ctx)
    if (vim.bo.filetype == "typescriptreact") then
      local U = require("Comment.utils")
      local type = (((ctx.ctype == U.ctype.linewise) and "__default") or "__multiline")
      local location = nil
      if (ctx.ctype == U.ctype.blockwise) then
        location = (require("ts_context_commentstring.utils")).get_cursor_location()
      elseif ((ctx.cmotion == U.cmotion.v) or (ctx.cmotion == U.cmotion.V)) then
        location = (require("ts_context_commentstring.utils")).get_visual_start_location()
      else
      end
      return (require("ts_context_commentstring.internal")).calculate_commentstring({key = type, location = location})
    else
      return nil
    end
  end
  __fnl_global__pre_2dhook = _1_
  return nil
end
return M

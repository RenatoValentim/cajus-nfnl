-- [nfnl] Compiled from fnl/plugins/parinfer.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  vim.g.parinfer_mode = "paren"
  return nil
end
return {"eraserhd/parinfer-rust", build = "cargo build --release", config = _1_, enabled = true, ft = {"clojure"}, name = "parinfer"}

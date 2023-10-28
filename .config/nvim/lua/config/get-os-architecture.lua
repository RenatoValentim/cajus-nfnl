-- [nfnl] Compiled from fnl/config/get-os-architecture.fnl by https://github.com/Olical/nfnl, do not edit.
local M = {}
M.getLinuxArchitecture = function()
  local f = assert(io.popen("uname -m", "r"))
  local arch = f:read("*a")
  f:close()
  return arch
end
return M

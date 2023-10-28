(local M {})
(fn M.getLinuxArchitecture []
  (let [f (assert (io.popen "uname -m" :r))
        arch (f:read :*a)]
    (f:close)
    arch))
M	

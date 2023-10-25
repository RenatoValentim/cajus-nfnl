(local {: autoload} (require :nfnl.module))
(local nvim (autoload :nvim))
(local core (autoload :nfnl.core))

;space is reserved to be lead
(nvim.set_keymap :n :<space> :<nop> {:noremap true})

;sets a nvim global options
(let [options
      {:ptencoding "utf-8"
      :encoding "utf-8"
      :fileencoding "utf-8"
      :number true
      :relativenumber true
      :title true
      :autoindent true
      :smartindent true
      :hlsearch true
      :backup false
      :showcmd true
      :cmdheight 1
      :laststatus 3
      :expandtab true
      :scrolloff 10
      :sidescrolloff 10
      :backupskip "/tmp/*,/private/tmp/*"
      :inccommand "split"
      :ignorecase true ; Case insensitive searching UNLESS /C or capital in search
      :smarttab true
      :breakindent true
      :shiftwidth 2
      :tabstop 2
      :softtabstop 2
      :wrap false ; No Wrap lines
      :backspace "start,eol,indent"
      :listchars:append "eol:↴"
      :list true
      :path:append "**" ; Finding files - Search down into subfolders
      :wildignore:append "*/node_modules/*"
      :clipboard "unnamedplus"
      :hidden true
      :incsearch true
      :updatetime 300
      :signcolumn "yes"
      :swapfile false
      :cursorline true
      :completeopt "menuone,noselect"
      :conceallevel 0
      :mouse "a"
      :pumheight 10
      :showtabline 0
      :smartcase true
      :splitbelow false
      :splitright false
      :termguicolors true
      :timeout true
      :timeoutlen 300
      :undofile true
      :writebackup false
      :ruler false
      :numberwidth 4
      :guifont "monospace:h17"
      :fillchars.eob " "
      :shortmess:append "c"
      :whichwrap:append "<,>,[,],h,l"
      :iskeyword:append "-"
      :linebreak true}]
  (each [option value (pairs options)]
    (core.assoc nvim.o option value)))

{}

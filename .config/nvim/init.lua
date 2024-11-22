vim.g.mapleader = ","
vim.g.maplocalleader = "\\"

vim.scriptencoding = "utf-8"
vim.wo.number = true

-- オプション
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.autoindent = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.cursorline = false
vim.opt.number = true
vim.opt.showmatch = true
vim.opt.incsearch = true
vim.opt.swapfile = false
vim.opt.directory = "/tmp"
vim.opt.backup = true
vim.opt.backupdir = "/tmp"
vim.opt.undofile = true
vim.opt.undodir = "/tmp"
vim.opt.clipboard = "unnamedplus"
vim.opt.backspace = "indent,eol,start"
vim.opt.laststatus = 2
vim.opt.matchtime = 1
vim.opt.display = "lastline"
vim.opt.signcolumn = "yes"

-- slimのFileTypeを設定
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = "*.slim",
  callback = function()
    vim.opt.filetype = "slim"
  end,
})

require("config.lazy")

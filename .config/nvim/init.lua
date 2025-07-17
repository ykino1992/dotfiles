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

-- ターミナルモードのキーマップ
if vim.fn.has('nvim') == 1 then
  vim.keymap.set('t', '<C-o>', [[<C-\><C-n>]], { noremap = true })
end

-- slimのFileTypeを設定
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = "*.slim",
  callback = function()
    vim.opt.filetype = "slim"
  end,
})

-- TODOリストを開く
vim.keymap.set("n", "<leader>td", [[<cmd>vnew ~/.local/state/todo.md<cr>]], { remap = false, desc = "TODOリストを開く" })

-- Markdownの設定
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown", "markdown_inline" },
  callback = function()
    vim.bo.tabstop = 2
    vim.bo.shiftwidth = 2
    vim.bo.softtabstop = 2
    vim.bo.expandtab = true
  end
})

require("config.lazy")

-- コメントアウトのキーマッピング（Ctrl-/）
vim.keymap.set('n', '<C-/>', 'gcc', { remap = true }) -- ノーマルモード
vim.keymap.set('v', '<C-/>', 'gc', { remap = true })  -- ビジュアルモード

vim.api.nvim_command('filetype plugin on')

vim.keymap.set('n', '<leader>x', function()
  local path = vim.fn.expand('%')
  vim.fn.setreg('+', path)
  print('Copied: ' .. path)
end)

-- Claudeターミナルを開く
local claude_counter = 0
vim.keymap.set('n', '<C-,>', function()
  claude_counter = claude_counter + 1
  vim.cmd('rightbelow vsplit')
  vim.cmd('terminal claude')
  vim.cmd('file claude' .. claude_counter)
end, { desc = "Open Claude in terminal" })

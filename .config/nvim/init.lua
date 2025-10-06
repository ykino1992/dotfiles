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

vim.opt.termguicolors = true
vim.opt.winblend = 0 -- ウィンドウの不透明度
vim.opt.pumblend = 0 -- ポップアップメニューの不透明度

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

-- ターミナルトグル機能
local terminal_bufs = {}
local prev_bufs = {}

local function toggle_terminal(num)
  local current_buf = vim.api.nvim_get_current_buf()
  -- local current_win = vim.api.nvim_get_current_win()
  -- local buf_count = #vim.api.nvim_list_bufs()
  local win_count = #vim.api.nvim_list_wins()

  -- ターミナルバッファが存在し、かつ有効かチェック
  if terminal_bufs[num] and vim.api.nvim_buf_is_valid(terminal_bufs[num]) then
    local terminal_wins = {}
    for _, win in ipairs(vim.api.nvim_list_wins()) do
      if vim.api.nvim_win_get_buf(win) == terminal_bufs[num] then
        table.insert(terminal_wins, win)
      end
    end

    -- ターミナルが表示されている場合
    if #terminal_wins > 0 then
      -- ターミナルウィンドウしかない場合は直前のバッファを表示
      if win_count == 1 and prev_bufs[num] and vim.api.nvim_buf_is_valid(prev_bufs[num]) then
        vim.api.nvim_set_current_buf(prev_bufs[num])
      else
        -- ターミナルウィンドウを閉じる
        for _, win in ipairs(terminal_wins) do
          vim.api.nvim_win_close(win, false)
        end
      end
    else
      -- ターミナルが表示されていない場合は右側に垂直分割して表示
      prev_bufs[num] = current_buf
      vim.cmd('rightbelow vsplit')
      vim.api.nvim_set_current_buf(terminal_bufs[num])
    end
  else
    -- ターミナルバッファが存在しない場合は新規作成
    prev_bufs[num] = current_buf
    vim.cmd('rightbelow vsplit')
    vim.cmd('terminal')
    terminal_bufs[num] = vim.api.nvim_get_current_buf()
  end
end

vim.keymap.set('n', '<leader>1', function() toggle_terminal(1) end, { desc = "Toggle terminal 1" })
vim.keymap.set('n', '<leader>2', function() toggle_terminal(2) end, { desc = "Toggle terminal 2" })
vim.keymap.set('n', '<leader>3', function() toggle_terminal(3) end, { desc = "Toggle terminal 3" })
vim.keymap.set('n', '<leader>4', function() toggle_terminal(4) end, { desc = "Toggle terminal 4" })
vim.keymap.set('n', '<leader>5', function() toggle_terminal(5) end, { desc = "Toggle terminal 5" })
vim.keymap.set('n', '<leader>6', function() toggle_terminal(6) end, { desc = "Toggle terminal 6" })
vim.keymap.set('n', '<leader>7', function() toggle_terminal(7) end, { desc = "Toggle terminal 7" })
vim.keymap.set('n', '<leader>8', function() toggle_terminal(8) end, { desc = "Toggle terminal 8" })
vim.keymap.set('n', '<leader>9', function() toggle_terminal(9) end, { desc = "Toggle terminal 9" })

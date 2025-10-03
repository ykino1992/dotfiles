local M = {}

-- 設定可能なオプション
M.config = {
  default_todo = "~/.local/state/todo.md",
  git_todo_dir = "local/docs",
  branch_separator = "_"
}

-- コマンド実行のヘルパー関数
local function execute_command(cmd)
  local handle = io.popen(cmd .. " 2>/dev/null")
  if not handle then
    return nil
  end
  local result = handle:read("*a")
  handle:close()
  return result and result:gsub("\n", "") or nil
end

-- デフォルトのTODOファイルを開く
local function open_default_todo()
  vim.cmd("vnew " .. M.config.default_todo)
end

-- ブランチ名をファイル名として安全にする
local function sanitize_branch_name(branch)
  -- スラッシュを置換し、その他の特殊文字も処理
  return branch:gsub("[/\\:*?\"<>|]", M.config.branch_separator)
end

-- Git情報を取得
local function get_git_info()
  -- git リポジトリかチェック
  local is_git = execute_command("git rev-parse --is-inside-work-tree")
  if not is_git or not is_git:match("true") then
    return nil
  end

  -- ブランチ名とルートディレクトリを取得
  local branch = execute_command("git branch --show-current")
  local root = execute_command("git rev-parse --show-toplevel")

  if not branch or branch == "" or not root or root == "" then
    return nil
  end

  return {
    branch = branch,
    root = root
  }
end

-- TODOファイルを開く
function M.open_todo()
  local git_info = get_git_info()

  if not git_info then
    open_default_todo()
    return
  end

  -- TODOディレクトリのパスを構築
  local todo_dir = git_info.root .. "/" .. M.config.git_todo_dir
  vim.fn.mkdir(todo_dir, "p")

  -- ブランチ名をサニタイズしてファイルパスを作成
  local safe_branch = sanitize_branch_name(git_info.branch)
  local todo_file = todo_dir .. "/" .. safe_branch .. ".md"

  vim.cmd("vnew " .. todo_file)
end

-- 設定を更新する関数
function M.setup(opts)
  M.config = vim.tbl_extend("force", M.config, opts or {})
end

return M


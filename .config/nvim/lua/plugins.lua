return {
  -- カラースキーマ
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = function()
      -- load the colorscheme here
      vim.cmd([[colorscheme gruvbox]])
    end,
  },
  -- {
  --   "morhetz/gruvbox",
  --   config = function()
  --     -- load the colorscheme here
  --     vim.cmd([[colorscheme gruvbox]])
  --   end,
  -- },

  -- ステータスラインをかっこよくする
  -- {
  --   'itchyny/lightline.vim',
  --   config = function()
  --     vim.g.lightline = { colorscheme = 'gruvbox' }
  --   end
  -- },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup()
    end
  },

  -- インデントラインを表示する
  {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      require("ibl").setup()
    end
  },

  { "ntpeters/vim-better-whitespace" },

  -- コメントアウトをヴィジュアルモードで行えるようにする
  { "tomtom/tcomment_vim" },

  -- クリップボードを yank, paste できるように
  { "kana/vim-fakeclip" },

  -- `,s` で true と false を切り替える
  {
    "AndrewRadev/switch.vim",
    config = function()
      vim.api.nvim_set_keymap('n', ',s', ':Switch<CR>', { noremap = true, silent = true })
    end
  },

  -- sneak_case や CamelCase を切り替える
  { "tpope/vim-abolish" },

  -- 行や列を揃えることで見やすく整形してくれる
  -- {
  --   "junegunn/vim-easy-align",
  --   config = function()
  --     vim.api.nvim_set_keymap('n', ',a', '<Plug>(EasyAlign)', {})
  --     vim.api.nvim_set_keymap('x', ',a', '<Plug>(EasyAlign)', {})
  --   end
  -- },

  { "tpope/vim-endwise" },

  -- テストランナー
  {
    "janko-m/vim-test",
    config = function()
      -- Springのbinstubを使用する設定
      vim.g["test#ruby#use_spring_binstub"] = 1
      vim.g["test#strategy"] = "neovim"

      -- キーマッピング
      vim.api.nvim_set_keymap("n", "<leader>tn", ":TestNearest<CR>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("n", "<leader>tf", ":TestFile<CR>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("n", "<leader>ts", ":TestSuite<CR>", { noremap = true, silent = true })
    end
  },

  -- Rails用のユーティリティ
  { 'tpope/vim-rails' },

  -- Github Copilot
  { "github/copilot.vim" },

  -- シンタックスハイライト
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate', -- Treesitterのパーサーを自動で更新
    config = function()
      require('nvim-treesitter.configs').setup {
        ensure_installed = { "rust", "lua", "ruby", "rbs", "javascript", "typescript", "tsx", "json" }, -- 必要な言語を指定
        highlight = {
          enable = true,                                                                                -- シンタックスハイライトを有効化
          additional_vim_regex_highlighting = false,                                                    -- 従来のハイライトを無効化
        },
        indent = {
          enable = true -- インデント自動調整を有効化
        },
        -- 時間がある時に以下の設定を試してみる
        -- incremental_selection = {
        --   enable = true,              -- 増分選択機能を有効化
        --   keymaps = {
        --     init_selection = "gnn", -- 選択開始
        --     node_incremental = "grn", -- 選択拡大
        --     scope_incremental = "grc", -- スコープ選択拡大
        --     node_decremental = "grm"  -- 選択縮小
        --   },
        -- },
        -- textobjects = {                 -- テキストオブジェクト機能の設定（必要に応じてインストール）
        --   select = {
        --     enable = true,
        --     lookahead = true,       -- 次に現れるテキストオブジェクトを探す
        --     keymaps = {
        --       ["af"] = "@function.outer", -- 関数全体の選択
        --       ["if"] = "@function.inner", -- 関数内側の選択
        --       ["ac"] = "@class.outer",    -- クラス全体の選択
        --       ["ic"] = "@class.inner",    -- クラス内側の選択
        --     },
        --   },
        -- },
      }
    end
  },

  -- シンタックスハイライト:slim
  -- treesitteer に対応していないため、別途設定
  {
    "slim-template/vim-slim",
    ft = "slim"
  },

  -- ファジーサーチ
  {
    "junegunn/fzf.vim",
    dependencies = { "junegunn/fzf" },
    config = function()
      vim.api.nvim_set_keymap("n", "<leader>f", ":GFiles -co --exclude-standard<CR>",
        { noremap = true, silent = true })
      vim.api.nvim_set_keymap("n", "<leader>c", [[:Files %:p:h<CR>]], { noremap = true, silent = true })
      vim.api.nvim_set_keymap("n", "<leader>b", ":Buffers<CR>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("n", "<leader>g", ":Rg<CR>", { noremap = true, silent = true })

      -- Lua function to build quickfix list
      local function build_quickfix_list(lines)
        local quickfix_list = {}
        for _, line in ipairs(lines) do
          table.insert(quickfix_list, { filename = line })
        end
        vim.fn.setqflist(quickfix_list)
        vim.cmd("copen")
        vim.cmd("cc")
      end

      -- Set fzf actions
      vim.g.fzf_action = {
        ["ctrl-q"] = build_quickfix_list,
        -- ["ctrl-t"] = "tab split",
        -- ["ctrl-x"] = "split",
        -- ["ctrl-v"] = "vsplit"
      }

      -- Set FZF_DEFAULT_OPTS environment variable
      vim.env.FZF_DEFAULT_OPTS = "--bind ctrl-a:select-all"
    end,
  },

  {
    'thinca/vim-qfreplace',
    config = function()
      -- Quickfix ウィンドウでのみ `r` キーに `:Qfreplace` をマップ
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "qf",
        callback = function()
          vim.keymap.set("n", "r", ":Qfreplace<CR>", { buffer = true, silent = true })
        end,
      })
    end
  },

  -- ファジーサーチ
  -- {
  --   "nvim-telescope/telescope.nvim",
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     'nvim-telescope/telescope-live-grep-args.nvim'
  --   },
  --   config = function()
  --     -- require("telescope").setup{
  --     -- }
  --     local builtin = require('telescope.builtin')
  --     vim.keymap.set('n', '<leader>f', builtin.find_files, { desc = 'ワーキングディレクトリ以下のファイルを検索' })
  --     vim.keymap.set('n', '<leader>c', function()
  --       builtin.find_files({ cwd = vim.fn.expand('%:p:h') })
  --     end, { desc = "現在開いているファイルのディレクトリ以下のファイルを検索" })
  --     vim.keymap.set('n', '<leader>b', builtin.buffers, { desc = 'バッファのファイルを検索' })
  --   end,
  -- },

  -- grep and replace
  -- {
  --   'nvim-pack/nvim-spectre',
  --   dependencies = {
  --     'nvim-lua/plenary.nvim' -- 必須の依存関係
  --   },
  --   config = function()
  --     vim.keymap.set('n', '<leader>g', '<cmd>lua require("spectre").toggle()<CR>', {
  --       desc = "grep and replace"
  --     })
  --   end,
  -- },

  -- ファイラー
  {
    'lambdalisue/fern.vim',
    -- ここに必要な設定を追加
    config = function()
      -- スペースキーでマーキングできるようにする
      vim.cmd [[
        augroup fern-custom
          autocmd!
          autocmd FileType fern nnoremap <buffer> <Space> <Plug>(fern-action-mark)
        augroup END
      ]]
      -- ファイラーを開く
      vim.api.nvim_set_keymap('n', '<Leader>e', '::Fern . -reveal=% -drawer -width=60<CR>',
        { noremap = true, silent = true })
    end
  },

  -- LSP
  {
    "neovim/nvim-lspconfig",
    config = function()
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          -- キーバインドはlspsaga.nvimの方で設定している

          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if client == nil then
            return
          end

          local function my_format()
            vim.lsp.buf.format({
              timeout_ms = 8000,
              filter = function(c)
                -- null_ls にまかせるので ts_ls と biome はフォーマットをスキップ
                return c.name ~= "ts_ls" and c.name ~= "biome"
              end,
            })
          end

          if client.supports_method("textDocument/formatting") then
            vim.api.nvim_create_autocmd({ "BufWritePre" }, {
              buffer = args.buf,
              callback = function()
                my_format()
              end,
            })
            vim.api.nvim_create_user_command("Format", function()
              my_format()
            end, {})
          end
        end,
      })

      -- 補完プラグインであるcmp_nvim_lspをLSPと連携
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lspconfig = require("lspconfig")

      -- luaのLSPサーバーを設定
      -- dependencies:
      -- - brew install lua-language-server
      lspconfig.lua_ls.setup {
        capabilities = capabilities,
        settings = {
          Lua = {
            format = {
              enable = true, -- フォーマットを有効にする
            },
            diagnostics = {
              globals = { 'vim' }, -- 'vim' をグローバル変数として認識
            },
          },
        },
      }

      -- rubyのLSPサーバーを設定
      -- dependencies:
      -- - gem install ruby-lsp
      lspconfig.ruby_lsp.setup {
        capabilities = capabilities,
      }

      -- steepのLSPサーバーを設定
      -- dependencies:
      -- - bundle add steep --group "development"
      -- Steepfileが存在する場合のみsteepのLSPを設定
      -- local function file_exists(name)
      --   local f = io.open(name, "r")
      --   if f ~= nil then
      --     io.close(f)
      --     return true
      --   end
      --   return false
      -- end
      --
      -- if file_exists("Steepfile") then
      --   lspconfig.steep.setup {
      --     capabilities = capabilities,
      --     cmd = { "bundle", "exec", "steep", "langserver" }
      --   }
      -- end

      -- rubocop
      -- ruby-lspがやってくれるので不要だった
      -- lspconfig.rubocop.setup {
      --   capabilities = capabilities,
      --   cmd = { "bundle", "exec", "rubocop", "--lsp" },
      -- }

      -- tailwindcssのLSPサーバーを設定
      -- dependencies:
      -- - pnpm add -g tailwindcss-language-server
      lspconfig.tailwindcss.setup {
        capabilities = capabilities,
      }


      -- typescript
      -- dependencies:
      -- - pnpm add -g typescript-language-server
      lspconfig.ts_ls.setup {
        capabilities = capabilities,
      }

      -- biome
      lspconfig.biome.setup {
        cmd = { "yarn", "biome", "lsp-proxy" },
        capabilities = capabilities,
      }

      -- json
      -- dependencies:
      -- - pnpm add -g vscode-langservers-extracted
      lspconfig.jsonls.setup {
        capabilities = capabilities,
      }

      -- rust
      lspconfig.rust_analyzer.setup {
        capabilities = capabilities,
        settings = {
          ["rust-analyzer"] = {
            check = {
              command = "clippy",
            },
          },
        },
      }
    end
  },

  {
    "nvimtools/none-ls.nvim",
    dependencies = {
      'nvim-lua/plenary.nvim' -- 必須の依存関係
    },
    config = function()
      local null_ls = require("null-ls")
      null_ls.setup {
        sources = {
          -- biome
          null_ls.builtins.formatting.biome.with({
            args =
            { "check", "--write", "--skip-errors", "--stdin-file-path", "$FILENAME" }
          }),
          -- tailwindcss
          -- クラスの並び替え
          -- dependencies:
          -- - brew install avencera/tap/rustywind
          -- null_ls.builtins.formatting.rustywind,
        },
      }
    end
  },

  -- 補完
  {
    "hrsh7th/nvim-cmp",       -- 補完エンジン本体
    dependencies = {
      "hrsh7th/cmp-nvim-lsp", -- LSPを補完ソースに
      "hrsh7th/cmp-buffer",   -- bufferを補完ソースに
      "hrsh7th/cmp-path",     -- pathを補完ソースに
      "hrsh7th/vim-vsnip",    -- スニペットエンジン
      "hrsh7th/cmp-vsnip",    -- スニペットを補完ソースに
      "onsails/lspkind.nvim", -- 補完欄にアイコンを表示
    },
    config = function()
      -- Lspkindのrequire
      local lspkind = require 'lspkind'
      --補完関係の設定
      local cmp = require("cmp")
      cmp.setup({
        snippet = {
          expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
          end,
        },
        sources = {
          { name = "nvim_lsp" }, --ソース類を設定
          { name = 'vsnip' },    -- For vsnip users.
          { name = "buffer" },
          { name = "path" },
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-p>"] = cmp.mapping.select_prev_item(), --Ctrl+pで補完欄を一つ上に移動
          ["<C-n>"] = cmp.mapping.select_next_item(), --Ctrl+nで補完欄を一つ下に移動
          ['<C-l>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ["<C-y>"] = cmp.mapping.confirm({ select = true }), --Ctrl+yで補完を選択確定
        }),
        experimental = {
          ghost_text = false,
        },
        -- Lspkind(アイコン)を設定
        formatting = {
          format = lspkind.cmp_format({
            mode = 'symbol',
            maxwidth = 50,
            ellipsis_char = '...',
          })
        }
      })
      cmp.setup.cmdline('/', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' } --ソース類を設定
        }
      })
      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "path" }, --ソース類を設定
        },
      })
    end
  },

  -- LSPの起動状況や状態をおしゃれに表示してくれる
  {
    "j-hui/fidget.nvim",
    config = function()
      require("fidget").setup()
    end
  },

  -- LSPをかっこよく表示してくれる
  {
    'nvimdev/lspsaga.nvim',
    config = function()
      require('lspsaga').setup({})
      local set = vim.keymap.set
      local opts = { noremap = true, silent = true }
      set('n', 'K', '<cmd>Lspsaga hover_doc<CR>', opts)             -- ドキュメントをフロートで表示
      set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts)      -- 定義を表示
      set("n", "gr", "<cmd>Lspsaga finder<CR>", opts)               -- 参照・実装を表示
      set("n", "g[", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts) -- 前のエラーに移動
      set("n", "g]", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts) -- 次のエラーに移動
      set("n", "rn", "<cmd>Lspsaga rename<CR>", opts)               -- 参照先までリネーム
      set("n", "ga", "<cmd>Lspsaga code_action<CR>", opts)          -- コードアクション
    end,
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-tree/nvim-web-devicons',
    }
  },

  -- git!!
  -- brew install lazygit
  {
    'kdheepak/lazygit.nvim',
    config = function()
      vim.keymap.set("n", "<leader>lg", ":LazyGit<CR>", { noremap = true, silent = true })
    end
  },

  -- Avante
  -- AIと連携してコードを書ける
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    lazy = false,
    version = false, -- set this if you want to always pull the latest change
    opts = {
      provider = "copilot",
      copilot = {
        model = "claude-3.5-sonnet",
        -- max_tokens = 4096,
      },
      behaviour = {
        auto_suggestions = false
      }
      -- add any opts here
    },
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    build = "make",
    -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
      "zbirenbaum/copilot.lua",      -- for providers='copilot'
      {
        -- support for image pasting
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- required for Windows users
            use_absolute_path = true,
          },
        },
      },
      {
        -- Make sure to set this up properly if you have lazy=true
        'MeanderingProgrammer/render-markdown.nvim',
        opts = {
          file_types = { "markdown", "Avante" },
          heading = {
            backgrounds = {
              '',
              '',
              '',
              '',
              '',
              '',
            },
          }
        },
        ft = { "markdown", "Avante" },
      },
    },
  }
}

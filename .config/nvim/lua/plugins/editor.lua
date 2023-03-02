return {
  -- git blame
  {
    "f-person/git-blame.nvim",
    event = "BufReadPre",
  },

  -- git conflict
  -- {
  --   "akinsho/git-conflict.nvim",
  --   event = "BufReadPre",
  --   config = true
  -- },

  {
    "folke/zen-mode.nvim",
    event = "VeryLazy",
    cmd = "ZenMode",
    opts = {
      window = {
        width = 0.85, -- width of the Zen window
        height = 0.95, -- height of the Zen window
      },
    },
    keys = { { "<leader>Z", "<cmd>ZenMode<cr>", desc = "Zen mode" } },
  },

  -- file explorer (nvim-tree) instead of neo-tree
  { "nvim-neo-tree/neo-tree.nvim", enabled = false },
  {
    "kyazdani42/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeOpen", "NvimTreeClose" },
    keys = {
      { "<leader>e", "<cmd>NvimTreeToggle<CR>", desc = "Explorer NvimTree (root dir)", mode = { "n", "t" } },
    },
    -- :help nvim-tree-setup  view default options
    opts = {
      filters = {
        -- hotkeys:
        -- I: toggle_git_ignored
        -- H: toggle_dotfiles
        -- C: toggle_git_clean
        -- B: toggle_no_buffer
        -- U: toggle_custom
        custom = {
          "node_modules$",
          ".git$",
          "go.mod$",
        },
      },
      disable_netrw = true,
      hijack_cursor = true,
      update_focused_file = {
        enable = true,
        update_root = false,
      },
      view = {
        adaptive_size = false,
        side = "left",
        width = 40,
        hide_root_folder = true,
        mappings = {
          list = {
            { key = "?", action = "toggle_help" },
          },
        },
      },
      renderer = {
        highlight_git = true,
        -- https://en.wikipedia.org/wiki/List_of_Unicode_characters
        -- https://www.nerdfonts.com/cheat-sheet
        -- https://raw.githubusercontent.com/microsoft/vscode-codicons/main/dist/codicon.csv
        icons = {
          git_placement = "signcolumn", -- after, before or signcolumn
          glyphs = {
            bookmark = "炙", -- 
            git = {
              unstaged = "✗", -- ✘
              staged = "✓", -- ✔
              unmerged = "",
              renamed = "→", -- ➜
              untracked = "*", -- 
              deleted = "☓", -- ⚊ 
              ignored = "◌",
            },
          },
        },
      },
    },
  },
}

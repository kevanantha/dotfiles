return {
  -- git blame
  {
    "f-person/git-blame.nvim",
    event = "BufReadPre",
    -- opts = function()
    --   vim.g.gitblame_date_format = "%r"
    -- end,
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

  -- easily jump to any location and enhanced f/t motions for Leap
  {
    "ggandor/flit.nvim",
    enabled = false,
    keys = function()
      ---@type LazyKeys[]
      local ret = {}
      for _, key in ipairs({ "f", "F", "t", "T" }) do
        ret[#ret + 1] = { key, mode = { "n", "x", "o" }, desc = key }
      end
      return ret
    end,
    opts = { labeled_modes = "nx" },
  },
  {
    "ggandor/leap.nvim",
    enabled = false,
    keys = {
      { "s", mode = { "n", "x", "o" }, desc = "Leap forward to" },
      { "S", mode = { "n", "x", "o" }, desc = "Leap backward to" },
      { "gs", mode = { "n", "x", "o" }, desc = "Leap from windows" },
    },
    config = function(_, opts)
      local leap = require("leap")
      for k, v in pairs(opts) do
        leap.opts[k] = v
      end
      leap.add_default_mappings(true)
      vim.keymap.del({ "x", "o" }, "x")
      vim.keymap.del({ "x", "o" }, "X")
    end,
  },
  {
    "phaazon/hop.nvim",
    -- config = true,
    event = "BufRead",
    branch = "v2",
    config = function()
      -- place this in one of your configuration file(s)
      local hop = require("hop")
      hop.setup()
      local directions = require("hop.hint").HintDirection
      vim.keymap.set("", "f", function()
        hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
      end, { remap = true })
      vim.keymap.set("", "F", function()
        hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
      end, { remap = true })
      vim.keymap.set("", "t", function()
        hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
      end, { remap = true })
      vim.keymap.set("", "T", function()
        hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
      end, { remap = true })

      vim.api.nvim_set_keymap("n", "s", ":HopChar2<cr>", { silent = true })
      vim.api.nvim_set_keymap("n", "S", ":HopWord<cr>", { silent = true })
    end,

    keys = {
      { "s", mode = { "n", "x", "o" }, desc = "Hop to char" },
      { "S", mode = { "n", "x", "o" }, desc = "Hop to char 2" },
      { "gs", mode = { "n", "x", "o" }, desc = "Hop to char 3" },
    },
  },
}

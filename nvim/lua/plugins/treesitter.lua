vim.cmd[[packadd nvim-treesitter]]
vim.cmd[[packadd nvim-treesitter-textobjects]]
vim.cmd[[packadd playground]]

local ts_config = require("nvim-treesitter.configs")
local parser_config = require "nvim-treesitter.parsers".get_parser_configs()

-- parser_config.svelte = {
--   install_info = {
--     url = "~/repos/tree-sitter-html", -- local path or git repo
--     files = {"src/parser.c", "src/scanner.cc"}
--   },
--   filetype = "svelte",
--   used_by = {"svelte"}
-- }

ts_config.setup {
  ensure_installed = {
    "typescript",
    "javascript",
    "jsdoc",
    "json",
    "html",
    "css",
    "php",
    "graphql",
    "rust",
    "tsx",
    "cpp",
    "bash",
    "python",
    "lua",
    "yaml",
    "toml",
    "go",
    "query",
    "ruby",
    "vue"
  },

  highlight = {
    enable = true,
    use_languagetree = true,
  },

  indent = {
    enable = true,
  },

  textobjects = {
    select = {
      enable = true,
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
      },
    },
    lsp_interop = {
      enable = true,
    },
  },

  playground = {
    enable = true,
    disable = {},
    updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
    persist_queries = false -- Whether the query persists across vim sessions
  },

  query_linter = {
    enable = true,
    use_virtual_text = true,
    lint_events = {"BufWrite", "CursorHold"},
  },
}


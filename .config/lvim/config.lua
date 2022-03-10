--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
lvim.log.level = "warn"
lvim.transparent_window = false
lvim.format_on_save = false
lvim.colorscheme = "onedarker"

vim.opt.relativenumber = true -- set relative numbered lines

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = ","
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
-- unmap a default keymapping
-- lvim.keys.normal_mode["<C-Up>"] = false
-- edit a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>"

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
local _, actions = pcall(require, "telescope.actions")
lvim.builtin.telescope.defaults.mappings = {
  -- for input mode
  i = {
    ["<C-j>"] = actions.move_selection_next,
    ["<C-k>"] = actions.move_selection_previous,
    ["<C-n>"] = actions.cycle_history_next,
    ["<C-p>"] = actions.cycle_history_prev,
  },
  -- for normal mode
  n = {
    ["<C-j>"] = actions.move_selection_next,
    ["<C-k>"] = actions.move_selection_previous,
  },
}

-- Use which-key to add extra bindings with the leader-key prefix
lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings["t"] = {
  name = "+Trouble",
  r = { "<cmd>Trouble lsp_references<cr>", "References" },
  f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
  d = { "<cmd>Trouble lsp_document_diagnostics<cr>", "Diagnostics" },
  q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
  l = { "<cmd>Trouble loclist<cr>", "LocationList" },
  w = { "<cmd>Trouble lsp_workspace_diagnostics<cr>", "Diagnostics" },
}

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.dashboard.active = true
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.builtin.bufferline.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.show_icons.git = 0

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "css",
  "rust",
  "java",
  "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

lvim.builtin.which_key.mappings["v"] = { "<CMD>vsplit<CR>", "Split Vertical" }
lvim.builtin.which_key.mappings["h"] = { "<CMD>split<CR>", "Horizontal Vertical" }
lvim.builtin.which_key.mappings["<space>"] = { "<CMD>noh<CR>", "No Highlight" }

lvim.keys.normal_mode["Y"] = "y$"
lvim.keys.visual_mode["p"] = [["_dP]]

-- remap enter to :
vim.api.nvim_set_keymap('n', '<ENTER>', ':', { noremap = true })

-- Copy selected line in v mode
vim.api.nvim_set_keymap('v', 'D', "y'>p", { noremap = true })

-- close all
vim.api.nvim_set_keymap('n', '<space>q', '<CMD>qa!<CR>', { noremap = true })

vim.cmd("nmap j <Plug>(accelerated_jk_gj_position)")
vim.cmd("nmap k <Plug>(accelerated_jk_gk_position)")

-- copy filepath
vim.cmd("nnoremap <space>c :let @+ = expand('%:p')<CR>")

-- generic LSP settings

-- ---@usage disable automatic installation of servers
lvim.lsp.automatic_servers_installation = true

-- ---@usage Select which servers should be configured manually. Requires `:LvimCacheRest` to take effect.
-- See the full default list `:lua print(vim.inspect(lvim.lsp.override))`
-- vim.list_extend(lvim.lsp.override, { "pyright" })

-- ---@usage setup a server -- see: https://www.lunarvim.org/languages/#overriding-the-default-configuration
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("vuels", opts)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
-- local formatters = require "lvim.lsp.null-ls.formatters"
-- formatters.setup {
--   { command = "black", filetypes = { "python" } },
--   { command = "isort", filetypes = { "python" } },
--   {
--     -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "prettier",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--print-with", "100" },
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "typescript", "typescriptreact" },
--   },
-- }

-- -- set additional linters
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { command = "flake8", filetypes = { "python" } },
--   {
--     -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "shellcheck",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--severity", "warning" },
--   },
--   {
--     command = "codespell",
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "javascript", "python" },
--   },
-- }

-- -- vue
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  -- { exe = "black" },
  {
    exe = "prettier",
    filetypes = { "javascript", "typescript", "typescriptreact", "vue" },
  },
}

local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  {
    exe = "eslint",
    filetypes = { "javascript", "typescript", "typescriptreact", "vue" },
  },
}

-- Additional Plugins
lvim.plugins = {
    -- {"folke/tokyonight.nvim"},
    {
      "folke/trouble.nvim",
      cmd = "TroubleToggle",
    },
    {"rhysd/clever-f.vim"},
    {"rhysd/accelerated-jk"},
    {"wakatime/vim-wakatime"},
    {"mattn/emmet-vim"},
    {"tweekmonster/startuptime.vim"},
    {
      "tzachar/cmp-tabnine",
      config = function()
        local tabnine = require "cmp_tabnine.config"
        tabnine:setup {
          max_lines = 1000,
          max_num_results = 20,
          sort = true,
        }
      end,

      run = "./install.sh",
      requires = "hrsh7th/nvim-cmp",
    },
    {"terryma/vim-multiple-cursors"},
    {
      "blackCauldron7/surround.nvim",
      config = function()
        require"surround".setup {mappings_style = "surround"}
      end
    },
    {
      "andymass/vim-matchup",
      event = "CursorMoved",
      config = function()
        require "plugins.matchup"
      end,
    },
    {
      "norcalli/nvim-colorizer.lua",
      config = function()
        require('colorizer').setup()
      end,
    },
    -- {
    --   "kosayoda/nvim-lightbulb",
    --   config = function()
    --     require('nvim-lightbulb').update_lightbulb()
    --   end
    -- }
    -- {"tpope/vim-surround"},
}

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- lvim.autocommands.custom_groups = {
--   { "BufWinEnter", "*.lua", "setlocal ts=8 sw=8" },
-- }


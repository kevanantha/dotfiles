--[[
lvim is the global options object
Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT
vim.cmd[[packadd package-info.nvim]]

-- general
lvim.log.level = "warn"
lvim.format_on_save = false
lvim.transparent_window = true
vim.g.tokyonight_style = "night"
lvim.colorscheme = "tokyonight"
-- settings
-- vim.opt.relativenumber = true -- set relative numbered lines

-- vim.opt.fillchars = "vert:│,eob:\\ " -- make vertical split sign better
vim.opt.backup = false -- creates a backup file
vim.opt.clipboard = "unnamedplus" -- allows neovim to access the system clipboard
vim.opt.backupcopy = "yes" -- fix weirdness for postcss
vim.opt.autoindent = true -- enable autoindent
vim.opt.foldmethod = "marker" -- foldmethod using marker
vim.opt.inccommand = "split" -- incrementally show result of command
vim.opt.cmdheight = 2 -- more space in the neovim command line for displaying messages
vim.opt.listchars = "tab:»·,nbsp:+,trail:·,extends:→,precedes:←" -- set listchars
vim.opt.colorcolumn = "99999" -- fixes indentline for now
vim.opt.completeopt = { "menuone", "noselect" }
vim.opt.conceallevel = 0 -- so that `` is visible in markdown files
vim.opt.fileencoding = "utf-8" -- the encoding written to a file
-- vim.opt.foldmethod = "manual" -- folding set to "expr" for treesitter based folding
vim.opt.shortmess = "csa" -- disable some stuff on shortmess
vim.opt.foldexpr = "" -- set to "nvim_treesitter#foldexpr()" for treesitter based folding
vim.opt.guifont = "monospace:h17" -- the font used in graphical neovim applications
vim.opt.hidden = true -- required to keep multiple buffers and open multiple buffers
vim.opt.hlsearch = true -- highlight all matches on previous search pattern
vim.opt.ignorecase = true -- ignore case in search patterns
vim.opt.mouse = "a" -- allow the mouse to be used in neovim
vim.opt.pumheight = 10 -- pop up menu height
vim.opt.showmode = false -- we don't need to see things like -- INSERT -- anymore
vim.opt.showtabline = 2 -- always show tabs
vim.opt.smartcase = true -- smart case
vim.opt.smartindent = true -- make indenting smarter again
vim.opt.smarttab = true -- make indenting tab smarter again
vim.opt.splitbelow = true -- force all horizontal splits to go below current window
vim.opt.startofline = false -- don't go to the start of the line when moving to another file
vim.opt.splitright = true -- force all vertical splits to go to the right of current window
vim.opt.swapfile = false -- creates a swapfile
vim.opt.termguicolors = true -- set term gui colors (most terminals support this)
vim.opt.timeoutlen = 100 -- time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.title = true -- set the title of window to the value of the titlestring
vim.opt.titlestring = "%<%F%=%l/%L - nvim" -- what the title of the window will be set to
-- vim.opt.undodir = CACHE_PATH .. "/undo" -- set an undo directory
vim.opt.undofile = true -- enable persistent undo
vim.opt.updatetime = 300 -- faster completion
vim.opt.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program) it is not allowed to be edited
vim.opt.expandtab = true -- convert tabs to spaces
vim.opt.shiftwidth = 2 -- the number of spaces inserted for each indentation
vim.opt.tabstop = 2 -- insert 2 spaces for a tab
vim.opt.cursorline = true -- highlight the current line
vim.opt.number = true -- set numbered lines
vim.opt.relativenumber = true -- set relative numbered lines
vim.opt.numberwidth = 4 -- set number column width to 2 {default 4}
vim.opt.signcolumn = "yes" -- always show the sign column otherwise it would shift the text each time
vim.opt.wrap = false -- display lines as one long line
vim.opt.spell = false
vim.opt.spelllang = "en"
vim.opt.scrolloff = 8 -- is one of my fav
vim.opt.sidescrolloff = 15 -- make scrolling better
vim.opt.laststatus = 2 -- always enable statusline
vim.opt.re = 0 -- set regexp engine to auto
vim.opt.sidescroll = 2 -- make scrolling better
vim.opt.synmaxcol = 300 -- set limit for syntax highlighting in a single line

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = ","
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
-- unmap a default keymapping
-- lvim.keys.normal_mode["<C-Up>"] = ""
-- edit a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>"

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
lvim.builtin.telescope.on_config_done = function()
  local actions = require "telescope.actions"
  -- for input mode
  lvim.builtin.telescope.defaults.mappings.i["<C-j>"] = actions.move_selection_next
  lvim.builtin.telescope.defaults.mappings.i["<C-k>"] = actions.move_selection_previous
  lvim.builtin.telescope.defaults.mappings.i["<C-n>"] = actions.cycle_history_next
  lvim.builtin.telescope.defaults.mappings.i["<C-p>"] = actions.cycle_history_prev
  -- for normal mode
  lvim.builtin.telescope.defaults.mappings.n["<C-j>"] = actions.move_selection_next
  lvim.builtin.telescope.defaults.mappings.n["<C-k>"] = actions.move_selection_previous
end

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

lvim.builtin.autopairs.active = true

local components = require("core.lualine.components")
local package = require("package-info")
local packageStatus = function ()
  return package.get_status()
end

-- lvim.builtin.lualine.sections.lualine_a = { "mode" }
lvim.builtin.lualine.sections.lualine_y = {
  components.location,
  components.spaces,
  components.encoding,
  packageStatus
}

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.dashboard.active = true
lvim.builtin.terminal.active = true
lvim.builtin.dap.active = true
lvim.builtin.bufferline.active = true
lvim.builtin.nvimtree.side = "left"
lvim.builtin.nvimtree.show_icons.git = 0

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = "maintained"
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true
lvim.builtin.treesitter.autotag.enable = true
lvim.builtin.treesitter.playground.enable = true

lvim.keys.normal_mode["<S-x>"] = ":BufferClose<CR>"

lvim.builtin.which_key.mappings["v"] = { "<CMD>vsplit<CR>", "Split Vertical" }
lvim.builtin.which_key.mappings["h"] = { "<CMD>split<CR>", "Horizontal Vertical" }
lvim.builtin.which_key.mappings["<space>"] = { "<CMD>noh<CR>", "No Highlight" }

lvim.builtin.which_key.mappings["r"] = {
  name = "Replace",
  r = { "<cmd>lua require('spectre').open()<cr>", "Replace" },
  w = { "<cmd>lua require('spectre').open_visual({select_word=true})<cr>", "Replace Word" },
  f = { "<cmd>lua require('spectre').open_file_search()<cr>", "Replace Buffer" },
}

-- Clean search (highlight)
-- vim.api.nvim_set_keymap('n', '<leader><space>', '<CMD>noh<CR>', { noremap = true, silent = true })

-- Move visual block
vim.api.nvim_set_keymap('n', '<F3>', '<CMD>NvimTreeToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<F4>', '<CMD>NvimTreeFindFile<CR>', { noremap = true, silent = true })

lvim.keys.normal_mode["Y"] = "y$"
lvim.keys.visual_mode["p"] = [["_dP]]

-- Zen Mode
lvim.builtin.which_key.mappings["z"] = { "<cmd>ZenMode<cr>", "Zen" }

-- Plugins -> package-info
lvim.builtin.which_key.mappings["n"] = {
  name = "Package Manager",
  h = { "<CMD>lua require('package-info').hide()<CR>", "Hide" },
  s = { "<CMD>lua require('package-info').show()<CR>", "Show" },
  u = { "<CMD>lua require('package-info').update()<CR>", "Update" },
  d = { "<CMD>lua require('package-info').delete()<CR>", "Delete" },
  i = { "<CMD>lua require('package-info').install()<CR>", "Install" },
  r = { "<CMD>lua require('package-info').reinstall()<CR>", "Reinstall" },
  c = { "<CMD>lua require('package-info').change_version()<CR>", "Change Version" },
}

-- scroll
-- vim.api.nvim_set_keymap('n', '<F10>', '<C-y>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<F9>', '<C-e>', { noremap = true, silent = true })

-- vim.api.nvim_set_keymap('n', '<F10>', '<C-u>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<F9>', '<C-d>', { noremap = true, silent = true })

-- neoscroll
vim.api.nvim_set_keymap('n', '<F10>', '<C-y>', { silent = true })
vim.api.nvim_set_keymap('n', '<F9>', '<C-e>', { silent = true })
-- vim.api.nvim_set_keymap('n', '<F10>', '<C-y>', { silent = true})
-- vim.api.nvim_set_keymap('n', '<F9>', '<C-e>', { silent = true })

-- split
-- lvim.keys.normal_mode
-- vim.api.nvim_set_keymap('n', '<leader>v', '<CMD>vsplit<CR>', { noremap = true })
-- vim.api.nvim_set_keymap('n', '<leader>h', '<CMD>split<CR>', { noremap = true })

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

-- Move visual block
-- vim.cmd("vnoremap J :m '>+1<CR>gv=gv")
-- vim.cmd("vnoremap K :m '<-2<CR>gv=gv")

-- generic LSP settings
-- you can set a custom on_attach function that will be used for all the language servers
-- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
lvim.lsp.on_attach_callback = function(client, bufnr)
  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end
  --Enable completion triggered by <c-x><c-o>
  buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
end
-- you can overwrite the null_ls setup table (useful for setting the root_dir function)
-- lvim.lsp.null_ls.setup = {
--   root_dir = require("lspconfig").util.root_pattern("Makefile", ".git", "node_modules"),
-- }
-- or if you need something more advanced
lvim.lsp.null_ls.setup.root_dir = function(fname)
  if vim.bo.filetype == "javascript" then
    return require("lspconfig/util").root_pattern("Makefile", ".git", "node_modules")(fname)
      or require("lspconfig/util").path.dirname(fname)
  elseif vim.bo.filetype == "php" then
    return require("lspconfig/util").root_pattern("Makefile", ".git", "composer.json")(fname) or vim.fn.getcwd()
  else
    return require("lspconfig/util").root_pattern("Makefile", ".git")(fname) or require("lspconfig/util").path.dirname(fname)
  end
end

-- set a formatter if you want to override the default lsp one (if it exists)
-- lvim.lang.python.formatters = {
--   {
--     exe = "black",
--   }
-- }
-- set an additional linter
-- lvim.lang.python.linters = {
--   {
--     exe = "flake8",
--   }
-- }

-- js
lvim.lang.javascript.formatters = { { exe = "eslint"}, { exe = "prettier" } }
lvim.lang.javascriptreact.formatters = lvim.lang.javascript.formatters
lvim.lang.javascript.linters = { { exe = "eslint" } }
lvim.lang.javascriptreact.linters = lvim.lang.javascript.linters

-- ts
lvim.lang.typescript.formatters = { { exe = "eslint"}, { exe = "prettier" } }
lvim.lang.typescriptreact.formatters = lvim.lang.typescript.formatters

lvim.lang.typescript.linters = { { exe = "eslint" } }
lvim.lang.typescriptreact.linters = lvim.lang.typescript.linters

-- vue
lvim.lang.vue.formatters = { { exe = "prettier" }, { exe = "eslint" } }
lvim.lang.vue.linters = { { exe = "eslint" } }

-- Additional Plugins
lvim.plugins = {
    {"rhysd/clever-f.vim"},
    {"rhysd/accelerated-jk"},
    {"wakatime/vim-wakatime"},
    {"mattn/emmet-vim"},
    {"tweekmonster/startuptime.vim"},
    {
      "mhartington/formatter.nvim",
      config = function()
        require('formatter').setup({
          filetype = {
            javascript = {
              -- prettier
              function()
                return {
                  exe = "prettier",
                  -- args = {"--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), '--single-quote'},
                  args = {"--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0))},
                  stdin = true
                }
              end
            },
            vue = {
              -- prettier
              function()
                return {
                  exe = "prettier",
                  -- args = {"--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), '--single-quote'},
                  args = {"--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0))},
                  stdin = true
                }
              end
            },
          }
        })
      end
    },
    {
      "raimondi/delimitmate",
      config = function()
        vim.cmd("let delimitMate_expand_cr = 1")
        vim.cmd("let delimitMate_expand_space = 1")
        vim.cmd("let delimitMate_jump_expansion = 1")
        vim.cmd("let delimitMate_balance_matchpairs = 1")
      end
    },
    -- {"tpope/vim-commentary"},
    {"tpope/vim-surround"},
    -- {"tpope/vim-fugitive"},
    {
      "andymass/vim-matchup",
      event = "CursorMoved",
      config = function()
        require "plugins.matchup"
      end,
    },
    {
      "nacro90/numb.nvim",
      event = "BufRead",
      config = function()
        require('numb').setup()
      end,
    },
    {
      "norcalli/nvim-colorizer.lua",
      config = function()
        -- require("plugins.colorizer").config()
        require('colorizer').setup()
      end,
    },
    {
      "windwp/nvim-spectre",
      event = "BufRead",
      config = function()
        -- require("plugins.spectre").config()
        require("spectre").setup()
      end,
    },
    {
      "folke/zen-mode.nvim",
      config = function()
        require("zen-mode").setup()
      end,
    },
    {
      "karb94/neoscroll.nvim",
      config = function()
        require("neoscroll").setup()
      end,
    },
    {
      "lukas-reineke/indent-blankline.nvim",
      -- event = "BufReadPre",
      config = function()
        require "plugins.blankline"
      end,
    },
    {
      "vuki656/package-info.nvim",
      requires = { "MunifTanjim/nui.nvim" },
      config = function()
        require "package-info".setup()
      end,
      ft = "json",
    },
    {
      "folke/trouble.nvim",
      cmd = "TroubleToggle",
    },
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
    {
      "metakirby5/codi.vim",
      cmd = "Codi",
    },
    -- {
    --   "kevinhwang91/nvim-bqf",
    --   event = "BufRead",
    -- },
    {
      "iamcco/markdown-preview.nvim",
      run = "cd app && npm install",
      ft = "markdown",
    },
    {
      "nvim-treesitter/playground",
      event = "BufRead",
    },
    {
      "windwp/nvim-ts-autotag",
      event = "InsertEnter",
    },
    {"terryma/vim-multiple-cursors"},
    {"folke/tokyonight.nvim"},
}

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
lvim.autocommands.custom_groups = {
  { "BufWinEnter", "*.lua", "setlocal ts=8 sw=8" },
  -- {"InsertEnter", "*", ":normal zz"},
}

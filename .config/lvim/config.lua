--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
vim.o.termguicolors = true
lvim.log.level = "warn"
lvim.format_on_save = false
lvim.colorscheme = "tokyonight"
-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

-- lvim.transparent_window = true

------------------- MAPPINGS -------------------
-- lvim.builtin.which_key.mappings["v"] = { "<CMD>vsplit<CR>", "Split Vertical" }
-- lvim.builtin.which_key.mappings["h"] = { "<CMD>split<CR>", "Horizontal Vertical" }
-- lvim.builtin.which_key.mappings["<space>"] = { "<CMD>noh<CR>", "No Highlight" }

lvim.keys.normal_mode["Y"] = "y$"
lvim.keys.visual_mode["p"] = [["_dP]]

-- remap enter to :
vim.api.nvim_set_keymap("n", "<ENTER>", ":", { noremap = true })
vim.api.nvim_set_keymap("n", ";", ":", { noremap = true })

-- Copy selected line in v mode
vim.api.nvim_set_keymap("v", "D", "y'>p", { noremap = true })

-- close all
vim.api.nvim_set_keymap("n", "<space>q", "<CMD>qa!<CR>", { noremap = true })

vim.cmd("nmap j <Plug>(accelerated_jk_gj_position)")
vim.cmd("nmap k <Plug>(accelerated_jk_gk_position)")

-- copy filepath
-- vim.cmd("nnoremap <space>c :let @+ = expand('%:p')<CR>")

------------------- OPTIONS --------------------
vim.opt.relativenumber = true

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"
-- unmap a default keymapping
-- vim.keymap.del("n", "<C-Up>")
-- override a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>" -- or vim.keymap.set("n", "<C-q>", ":q<cr>" )

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

-- Change theme settings
lvim.builtin.theme.options.dim_inactive = true
lvim.builtin.theme.options.style = "moon"

-- Use which-key to add extra bindings with the leader-key prefix
lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings["t"] = {
	name = "+Trouble",
	r = { "<cmd>Trouble lsp_references<cr>", "References" },
	f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
	d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
	q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
	l = { "<cmd>Trouble loclist<cr>", "LocationList" },
	w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics" },
}

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
-- https://github.com/LunarVim/LunarVim/issues/3294
-- lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false
lvim.builtin.treesitter.rainbow.enable = true

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
	"bash",
	"c",
	"javascript",
	"json",
	"lua",
	"python",
	"typescript",
	"tsx",
	"css",
	"rust",
	"java",
	"yaml",
	"vue",
	"php",
	"nix",
	"html",
	"markdown",
	"gitignore",
	"gitattributes",
	"go",
	"toml",
	"graphql",
	"gomod",
	"jsdoc",
	"dot",
	"dockerfile",
	"scss",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enable = true

-- generic LSP settings

-- -- make sure server will always be installed even if the server is in skipped_servers list
lvim.lsp.installer.setup.ensure_installed = {
	"sumneko_lua",
	"jsonls",
	"cssls",
	"dockerls",
	"gopls",
	-- "graphql",
	"html",
	"intelephense",
	"tsserver",
	"lemminx",
	"rust_analyzer",
	"rnix",
	"yamlls",
	"volar",
	"tailwindcss",
	"taplo",
	"scss",
}
-- -- change UI setting of `LspInstallInfo`
-- -- see <https://github.com/williamboman/nvim-lsp-installer#default-configuration>
-- lvim.lsp.installer.setup.ui.check_outdated_servers_on_open = false
-- lvim.lsp.installer.setup.ui.border = "rounded"
-- lvim.lsp.installer.setup.ui.keymaps = {
--     uninstall_server = "d",
--     toggle_server_expand = "o",
-- }

-- ---@usage disable automatic installation of servers
-- lvim.lsp.installer.setup.automatic_installation = false

-- ---configure a server manually. !!Requires `:LvimCacheReset` to take effect!!
-- ---see the full default list `:lua print(vim.inspect(lvim.lsp.automatic_configuration.skipped_servers))`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. !!Requires `:LvimCacheReset` to take effect!!
-- ---`:LvimInfo` lists which server(s) are skipped for the current filetype
-- lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

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

-- set a formatter, this will override the language server formatting capabilities (if it exists)
local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
	{
		command = "prettierd",
		filetypes = { "vue", "javascript", "typescript", "javascriptreact", "typescriptreact", "json", "markdown" },
	},
	{ command = "stylua", filetypes = { "lua" } },
	{ command = "beautysh", filetypes = { "bash", "csh", "ksh", "sh", "zsh" } },
	{ command = "gofumpt", filetypes = { "go" } },
	{ command = "goimports", filetypes = { "go" } },
	{ command = "goimports-reviser", filetypes = { "go" } },
	{ command = "golines", filetypes = { "go" } },
	{ command = "gofmt", filetypes = { "go" } },
})

-- set additional linters
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

-- local linters = require "lvim.lsp.null-ls.linters"
local linters = require("lvim.lsp.null-ls.linters")
linters.setup({
	-- { command = "eslint_d", filetypes = { "vue", "javascript", "javascriptreact", "typescript", "typescriptreact" } },
	{ command = "eslint", filetypes = { "vue", "javascript", "javascriptreact", "typescript", "typescriptreact" } },
	{ command = "luacheck", filetypes = { "lua" } },
	{ command = "yamllint", filetypes = { "yaml" } },
	{ command = "hadolint", filetypes = { "dockerfile" } },
})

-- Additional Plugins
lvim.plugins = {
	{
		"folke/trouble.nvim",
		cmd = "TroubleToggle",
	},
	{ "mattn/emmet-vim" },
	{ "rhysd/accelerated-jk" },
	{ "wakatime/vim-wakatime" },
	{ "kylechui/nvim-surround" },
	{
		"NvChad/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	},
	{
		"ur4ltz/surround.nvim",
		config = function()
			require("surround").setup({ mappings_style = "surround" })
		end,
	},
	{
		"windwp/nvim-spectre",
		event = "BufRead",
		config = function()
			require("spectre").setup()
		end,
	},
	{
		"nvim-telescope/telescope-fzy-native.nvim",
		run = "make",
		event = "BufRead",
	},
	{
		"lvimuser/lsp-inlayhints.nvim",
		config = function()
			-- require("lsp-inlayhints").setup()
		end,
	},
	-- git
	{
		"sindrets/diffview.nvim",
		requires = "nvim-lua/plenary.nvim",
		event = "BufRead",
		config = function()
			require("diffview").setup()
		end,
	},
	-- lsp
	{
		"tzachar/cmp-tabnine",
		config = function()
			local tabnine = require("cmp_tabnine.config")
			tabnine.setup({
				max_lines = 1000,
				max_num_results = 20,
				sort = true,
			})
		end,

		run = "./install.sh",
		requires = "hrsh7th/nvim-cmp",
	},
	-- navigator
	{
		"karb94/neoscroll.nvim",
		config = function()
			require("neoscroll").setup()
		end,
	},
	{
		"phaazon/hop.nvim",
		event = "BufRead",
		branch = "v2",
		config = function()
			require("hop").setup()
			vim.api.nvim_set_keymap("n", "s", ":HopChar2<cr>", { silent = true })
			vim.api.nvim_set_keymap("n", "S", ":HopWord<cr>", { silent = true })
		end,
	},
	-- treesitter
	{
		"windwp/nvim-ts-autotag",
		config = function()
			require("nvim-ts-autotag").setup()
		end,
	},
	{
		"p00f/nvim-ts-rainbow",
	},
	{
		"nvim-treesitter/playground",
		event = "BufRead",
	},
	-- {
	-- 	"sindrets/diffview.nvim",
	-- 	requires = "nvim-lua/plenary.nvim",
	-- },
	{
		"romgrk/nvim-treesitter-context",
		config = function()
			require("treesitter-context").setup({
				enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
				throttle = true, -- Throttles plugin updates (may improve performance)
				max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
				patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
					-- For all filetypes
					-- Note that setting an entry here replaces all other patterns for this entry.
					-- By setting the 'default' entry below, you can control which nodes you want to
					-- appear in the context window.
					default = {
						"class",
						"function",
						"method",
					},
				},
			})
		end,
	},
	{
		"zbirenbaum/copilot.lua",
		event = { "VimEnter" },
		config = function()
			vim.defer_fn(function()
				-- require("copilot").setup({
				-- 	plugin_manager_path = get_runtime_dir() .. "/site/pack/packer",
				-- })
				require("copilot").setup()
			end, 100)
		end,
	},

	{
		"zbirenbaum/copilot-cmp",
		after = { "copilot.lua", "nvim-cmp" },
		config = function()
			require("copilot_cmp").setup({
				method = "getCompletionsCycling",
			})
		end,
	},
}

-- Can not be placed into the config method of the plugins.
-- lvim.builtin.cmp.formatting.source_names["copilot"] = "(Copilot)"
-- table.insert(lvim.builtin.cmp.sources, 1, { name = "copilot" })

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
vim.api.nvim_create_autocmd("BufEnter", {
	pattern = { "*.json", "*.jsonc" },
	-- enable wrap mode for json files only
	command = "setlocal wrap",
})

-- lvim.autocommands = {
--     {
--       "BufWinEnter", {
--       pattern = { "*.go"  },
--       callback = function()
--         vim.cmd [[setlocal tabstop=4 shiftwidth=4]]
--       end
--     },
--   }
-- }
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "zsh",
--   callback = function()
--     -- let treesitter use bash highlight for zsh files as well
--     require("nvim-treesitter.highlight").attach(0, "bash")
--   end,
-- })
-- lvim.autocommands = {
--     {
--       "BufWinEnter", {
--       pattern = { "*.cpp", "*.hpp" },
--       callback = function()
--         -- DYI editorconfig
--         if vim.loop.cwd() == "path/to/my/project" then
--           vim.cmd [[setlocal tabstop=8 shiftwidth=8]]
--         end
--       end
--     },
--   }
-- }

-- local status_ok, hints = pcall(require, "lsp-inlayhints")
-- if not status_ok then
-- 	return
-- end

-- local group = vim.api.nvim_create_augroup("LspAttach_inlayhints", {})
-- vim.api.nvim_create_autocmd("LspAttach", {
-- 	group = "LspAttach_inlayhints",
-- 	callback = function(args)
-- 		if not (args.data and args.data.client_id) then
-- 			return
-- 		end

-- 		local client = vim.lsp.get_client_by_id(args.data.client_id)
-- 		require("lsp-inlayhints").on_attach(client, args.buf)
-- 	end,
-- })

-- hints.setup()

-- hints.setup({
-- 	inlay_hints = {
-- 		parameter_hints = {
-- 			show = true,
-- 			-- prefix = "<- ",
-- 			separator = ", ",
-- 		},
-- 		type_hints = {
-- 			-- type and other hints
-- 			show = true,
-- 			prefix = "",
-- 			separator = ", ",
-- 			remove_colon_end = false,
-- 			remove_colon_start = false,
-- 		},
-- 		-- separator between types and parameter hints. Note that type hints are
-- 		-- shown before parameter
-- 		labels_separator = "  ",
-- 		-- whether to align to the length of the longest line in the file
-- 		max_len_align = false,
-- 		-- padding from the left if max_len_align is true
-- 		max_len_align_padding = 1,
-- 		-- whether to align to the extreme right or not
-- 		right_align = false,
-- 		-- padding from the right if right_align is true
-- 		right_align_padding = 7,
-- 		-- highlight group
-- 		-- highlight = "Comment",
-- 		highlight = "LspInlayHint",
-- 	},
-- 	debug_mode = false,
-- })

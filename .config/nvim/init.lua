vim.cmd[[packadd nvim-lightbulb]]

vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- Change cwd to current dir
vim.cmd("cd %:p:h")
vim.cmd [[autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb({ sign_priority = 10 })]]

-- Load plugins first
require("plugins.packer")

require("modules.settings")
require("modules.appearances")
require("modules.mappings")
-- require("modules.statusline")
require("modules.statusline2")

require("plugins.tokyonight")
require("plugins.catppuccino")
require("plugins.bufferline")
require("plugins.luatree")
require("plugins.gitsigns")
require("plugins.telescope")
require("plugins.indentline")
require("plugins.treesitter")
require("plugins.delimitmate")
require("plugins.snippet")
require("plugins.completion")
require("plugins.formatter")

require("modules.lsp")


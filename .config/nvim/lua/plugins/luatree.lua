vim.cmd[[packadd nvim-tree.lua]]
local tree_cb = require'nvim-tree.config'.nvim_tree_callback

-- Set some variables
vim.g.nvim_tree_side = 'left'
vim.g.nvim_tree_width = 35
vim.g.nvim_tree_ignore = {
  '.git', 'node_modules', '__sapper__', '.routify', 'dist', '.cache'
}
vim.g.nvim_tree_lsp_diagnostics = 1
-- vim.g.nvim_tree_special_files = {'README.md' = 1, 'Makefile' = 1, 'MAKEFILE' = 1} -- List of filenames that gets highlighted with NvimTreeSpecialFile
vim.g.nvim_tree_auto_open = 1
vim.g.nvim_tree_auto_close = 1
vim.g.nvim_tree_follow = 0
vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_hide_dotfiles = 0
vim.g.nvim_tree_git_hl = 1
vim.g.nvim_tree_root_folder_modifier = ':~'
vim.g.nvim_tree_tab_open = 0
vim.g.nvim_tree_show_icons = {git = 1, folders = 1, files = 1}

-- Mappings for luatree
-- vim.g.nvim_tree_bindings = {
--   ["<CR>"]           = tree_cb("edit"),
--   ["o"]              = tree_cb("edit"),
--   ["<2-LeftMouse>"]  = tree_cb("edit"),
--   ["<2-RightMouse>"] = tree_cb("cd"),
--   ["<C-]>"]          = tree_cb("cd"),
--   ["<C-v>"]          = tree_cb("vsplit"),
--   ["<C-x>"]          = tree_cb("split"),
--   ["<C-t>"]          = tree_cb("tabnew"),
--   ["<"]              = tree_cb("prev_sibling"),
--   [">"]              = tree_cb("next_sibling"),
--   ["<BS>"]           = tree_cb("close_node"),
--   ["<S-CR>"]         = tree_cb("close_node"),
--   ["<Tab>"]          = tree_cb("preview"),
--   ["I"]              = tree_cb("toggle_ignored"),
--   ["H"]              = tree_cb("toggle_dotfiles"),
--   ["R"]              = tree_cb("refresh"),
--   ["a"]              = tree_cb("create"),
--   ["d"]              = tree_cb("remove"),
--   ["r"]              = tree_cb("rename"),
--   ["<C-r>"]          = tree_cb("full_rename"),
--   ["x"]              = tree_cb("cut"),
--   ["c"]              = tree_cb("copy"),
--   ["p"]              = tree_cb("paste"),
--   ["[c"]             = tree_cb("prev_git_item"),
--   ["]c"]             = tree_cb("next_git_item"),
--   ["-"]              = tree_cb("dir_up"),
--   ["q"]              = tree_cb("close"),
-- }

-- default will show icon by default if no icon is provided
-- default shows no icon by default
vim.g.nvim_tree_icons = {
  default = '',
  symlink = '',

  git = {
    unstaged = "✗",
    staged = "✓",
    unmerged = "",
    renamed = "➜",
    untracked = "★"
  },

  folder = {default = "", open = " "}
}

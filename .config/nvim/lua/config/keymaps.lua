-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

-- if vim.fn.executable("gitui") == 1 then
--   -- gitui instead of lazygit
--   vim.keymap.set("n", "<leader>gg", function()
--     require("lazyvim.util").float_term({ "gitui" })
--   end, { desc = "gitui (cwd)" })
--   vim.keymap.set("n", "<leader>gG", function()
--     require("lazyvim.util").float_term({ "gitui" }, { cwd = require("lazyvim.util").get_root() })
--   end, { desc = "gitui (root dir)" })
-- end

vim.keymap.set("n", "<leader>rn", function()
  return ":IncRename " .. vim.fn.expand("<cword>")
end, { expr = true, desc = "Incremental rename" })

-- Copy selected line in v mode
vim.api.nvim_set_keymap("v", "D", "y'>p", { noremap = true })

-- Move Lines
--
-- map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
-- map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
-- map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
-- map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
-- map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
-- map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- https://stackoverflow.com/questions/7501092/can-i-map-alt-key-in-vim
map("n", "˚", "<cmd>m .-2<cr>==", { desc = "Move up" })
map("n", "∆", "<cmd>m .+1<cr>==", { desc = "Move down" })
map("i", "∆", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
map("i", "˚", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
map("v", "∆", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map("v", "˚", ":m '<-2<cr>gv=gv", { desc = "Move up" })

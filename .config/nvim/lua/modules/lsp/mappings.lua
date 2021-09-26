local remap = vim.api.nvim_set_keymap
local M = {}

-- vim-vsnip stuff
-- remap('i', '<C-j>', 'vsnip#jumpable(1) ? "<Plug>(vsnip-jump-next)" : "<C-j>"', { silent = true, expr = true })
-- remap('s', '<C-j>', 'vsnip#jumpable(1) ? "<Plug>(vsnip-jump-next)" : "<C-j>"', { silent = true, expr = true })
-- remap('i', '<C-k>', 'vsnip#jumpable(-1) ? "<Plug>(vsnip-jump-prev)" : "<C-k>"', { silent = true, expr = true })
-- remap('s', '<C-k>', 'vsnip#jumpable(-1) ? "<Plug>(vsnip-jump-prev)" : "<C-k>"', { silent = true, expr = true })

M.lsp_mappings = function()
  -- remap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', { noremap = true, silent = true })
  remap('n', 'K', '<cmd>:Lspsaga hover_doc<CR>', { noremap = true, silent = true })
  -- remap('n', '<C-f>', "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>", { noremap = true, silent = true, nowait = true })
  -- remap('n', '<C-b>', "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>", { noremap = true, silent = true, nowait = true })
  -- vim.cmd("nnoremap <silent> <C-g> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>")
  -- vim.cmd("nnoremap <silent> <C-b> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>")
  remap('n', 'gs', '<cmd>:Lspsaga signature_help<CR>', { noremap = true, silent = true })
  -- remap('n', 'ga', '<cmd>lua vim.lsp.buf.code_action()<CR>', { noremap = true, silent = true })
  -- remap('n', 'ga', '<cmd>Telescope lsp_code_actions<CR>', { noremap = true, silent = true })
  remap('n', 'ga', '<cmd>:Lspsaga code_action<CR>', { noremap = true, silent = true })
  remap('v', 'ga', '<cmd>:<C-U>Lspsaga range_code_action<CR>', { noremap = true, silent = true })
  -- remap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', { noremap = true, silent = true })
  remap('n', 'gd', '<cmd>:Lspsaga preview_definition<CR>', { noremap = true, silent = true })
  remap('i', '<C-s>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', { noremap = true, silent = true })
  remap('n', 'gD', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', { noremap = true, silent = true })
  remap('n', 'gr', '<cmd>lua require"telescope.builtin".lsp_references()<CR>', { noremap = true, silent = true })
  remap('n', '<leader>rn', '<cmd>:Lspsaga rename<CR>', { noremap = true, silent = true })
  -- remap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', { noremap = true, silent = true })

  remap('n', 'gh', '<cmd>:Lspsaga lsp_finder<CR>', { noremap = true, silent = true })
end

return M


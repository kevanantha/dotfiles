local remap = vim.api.nvim_set_keymap

remap('n', '<F3>', '<CMD>NvimTreeToggle<CR>', { noremap = true })
remap('n', '<F4>', '<CMD>NvimTreeFindFile<CR>', { noremap = true })
-- remap('n', '<C-r>', '<CMD>NvimTreeRefresh<CR>', { noremap = true })

-- Clean search (highlight)
remap('n', '<leader><space>', '<CMD>noh<CR>', { noremap = true, silent = true })

-- Copy selected line in v mode
remap('v', 'D', "y'>p", { noremap = true })

-- Git Messenger
remap('n', '<leader>gm', '<CMD>GitMessenger<CR>', { noremap = true })

-- Move visual block
vim.cmd("vnoremap J :m '>+1<CR>gv=gv")
vim.cmd("vnoremap K :m '<-2<CR>gv=gv")

-- scroll
remap('n', '<F9>', '<C-y>', { noremap = true })
remap('n', '<F10>', '<C-e>', { noremap = true })

-- Buffer nav
remap('', '<leader>z', '<CMD>bp<CR>', { noremap = true })
remap('', '<leader>x', '<CMD>bn<CR>', { noremap = true })

-- Close buffer
remap('', '<leader>c', '<CMD>bd<CR>', { noremap = true })

-- close all
remap('n', '<space>q', '<CMD>qa!<CR>', { noremap = true })

-- split
remap('n', '<leader>h', '<CMD>split<CR>', { noremap = true })
remap('n', '<leader>v', '<CMD>vsplit<CR>', { noremap = true })

-- remap enter to :
remap('n', '<ENTER>', ':', { noremap = true })

-- better movement between windows
remap('n', '<C-h>', '<C-w><C-h>', { noremap = true })
remap('n', '<C-j>', '<C-w><C-j>', { noremap = true })
remap('n', '<C-k>', '<C-w><C-k>', { noremap = true })
remap('n', '<C-l>', '<C-w><C-l>', { noremap = true })

-- resize buffer easier
remap('n', '<Left>', '<CMD>vertical resize +5<CR>', { noremap = true })
remap('n', '<Right>', '<CMD>vertical resize -5<CR>', { noremap = true })
remap('n', '<Up>', '<CMD>resize +5<CR>', { noremap = true })
remap('n', '<Down>', '<CMD>resize -5<CR>', { noremap = true })

-- toggle telescope.nvim
remap('n', '<leader>e', '<CMD>Telescope find_files prompt_prefix=🔍<CR>', { noremap = true, silent = true })
remap('n', '<leader>b', '<CMD>Telescope buffers prompt_prefix=🔍<CR>', { noremap = true, silent = true })
remap('n', '<leader>g', '<CMD>Telescope git_files prompt_prefix=🔍<CR>', { noremap = true, silent = true })
remap('n', '<space>f', '<CMD>Telescope current_buffer_fuzzy_find prompt_prefix=🔍<CR>', { noremap = true, silent = true })
-- remap('n', '<C-f>', '<CMD>lua require"plugins.telescope".grep_prompt()<CR>', { noremap = true, silent = true })
remap('n', '<C-f>', '<CMD>Telescope live_grep prompt_prefix=🔍 <CR>', { noremap = true, silent = true })

vim.cmd [[
if executable('ag')
  let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g \"\"'
  set grepprg=ag\ --nogroup\ --nocolor')
endif

nnoremap <silent> <leader>ag :Ag!<CR>")
]]

-- Telescope find_files find_command=ag,--ignore, .git, -g, "", --hidden prompt_prefix=🔍

-- copy to system clipboard
remap('v', '<A-y>', '"+y', { noremap = true })

-- move vertically by visual line on wrapped lines
remap('n', 'j', 'gj', { noremap = true })
remap('n', 'k', 'gk', { noremap = true })

-- better indenting experience
-- Vmap for maintain Visual Mode after shifting > and <
remap('v', '<', '<gv', { noremap = true })
remap('v', '>', '>gv', { noremap = true })

-- copy filepath
vim.cmd("nnoremap <space>c :let @+ = expand('%:p')<CR>")

-- vim.cmd("nmap j <Plug>(accelerated_jk_gj)")
-- vim.cmd("nmap k <Plug>(accelerated_jk_gk)")

vim.cmd("nmap j <Plug>(accelerated_jk_gj_position)")
vim.cmd("nmap k <Plug>(accelerated_jk_gk_position)")

-- Formatter
remap('n', '<leader>f', '<CMD>Format<CR>', {silent = true, noremap = true})

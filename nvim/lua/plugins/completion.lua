-- vim.cmd[[packadd completion-nvim]]
vim.cmd[[packadd nvim-compe]]
-- vim.cmd[[packadd vim-vsnip]]
-- vim.cmd[[packadd vim-vsnip-integ]]

local remap = vim.api.nvim_set_keymap

require'compe'.setup {
  enabled = true;
  debug = false;
  min_length = 1;
  autocomplete = true;
  preselect = "disable";
  source_timeout = 200;
  incomplete_delay = 400;
  allow_prefix_unmatch = false;
  source = {
    path = true;
    buffer = true;
    vsnip = true;
    nvim_lsp = true;
    nvim_lua = true;
  };
}

vim.g.vsnip_snippet_dir = vim.fn.stdpath("config").."/snippets"

-- needs to be here, otherwise `check_html_char` wouldn't work
vim.g.no_default_rules = 1
-- vim.g.lexima_accept_pum_with_enter = 1
-- vim.fn["lexima#set_default_rules"]()

-- check prev character, depending on previous char
-- it will do special stuff or just `<CR>`
-- i.e: accept completion item, indent html, autoindent braces/etc, just enter
remap(
  'i', '<CR>',
  table.concat{
  'pumvisible()',
  '? complete_info()["selected"] != "-1"',
  '? compe#confirm({ "keys": "<Plug>delimitMateCR", "mode": ""})',
  ': "<C-g>u".{ "keys": "<Plug>delimitMateCR", "mode": ""}',
  ': v:lua.Util.check_html_char() ? { "keys": "<Plug>delimitMateCR", "mode": ""}."<ESC>O"',
  ': { "keys": "<Plug>delimitMateCR", "mode": ""}'
  },
  { silent = true, expr = true }
)

-- cycle tab or insert tab depending on prev char
remap(
  'i', '<Tab>',
  table.concat{
    'pumvisible() ? "<C-n>" : v:lua.Util.check_backspace()',
    '? "<Tab>" : compe#confirm({ "keys": "<Plug>delimitMateCR", "mode": ""})',
    '? "<Tab>" : compe#confirm({ "keys": "<Plug>delimitMateCR", "mode": ""})',
  },
  { silent = true, noremap = true, expr = true }
)

remap('i', '<S-Tab>', 'pumvisible() ? "<C-p>" : "<S-Tab>"', { noremap = true, expr = true })
remap('i', '<Tab>', 'pumvisible() ? "<C-n>" : "<S-Tab>"', { noremap = true, expr = true })
remap('i', '<C-Space>', 'compe#complete()', { noremap = true, expr = true, silent = true })
remap('i', '<CR>', "compe#confirm({ 'keys': '<Plug>delimitMateCR', 'mode': '' })", { noremap = true, expr = true, silent = true })

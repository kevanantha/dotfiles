local actions = require('telescope.actions')

local M = {}

require'telescope'.setup{
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case'
    },
    file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
    grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
    qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,
    scroll_strategy = 'cycle',
    selection_strategy = 'reset',
    file_ignore_patterns = {".tmp/", "node_modules", "dist"},
    layout_strategy = 'flex',
    borderchars = { '─', '│', '─', '│', '┌', '┐', '┘', '└'},
    layout_config = {
      horizontal = {
        mirror = false

        -- width_padding = 0.1,
        -- height_padding = 0.1,
        -- preview_width = 0.6
      },
      vertical = {

        mirror = false
        -- width_padding = 0.05,
        -- height_padding = 1,
        -- preview_height = 0.5
      }
    },
    default_mappings = {
      i = {
        ['<C-j>'] = actions.move_selection_next,
        ['<C-k>'] = actions.move_selection_previous,
        -- ['<CR>'] = actions.goto_file_selection_edit,
        ['<CR>'] = actions.select_default,

        ['<C-v>'] = actions.select_horizontal,
        ['<C-x>'] = actions.select_default,
        ['<C-t>'] = actions.select_default,
        ['<C-c>'] = actions.close,
        ['<Esc>'] = actions.close,

        ['<C-u>'] = actions.preview_scrolling_up,
        ['<C-d>'] = actions.preview_scrolling_down,
        ['<C-q>'] = actions.send_to_qflist
      },
      n = {
        ['<CR>'] = actions.select_default,
        ['<C-v>'] = actions.select_default,
        ['<C-x>'] = actions.select_default,
        ['<C-t>'] = actions.select_default,
        ['<Esc>'] = actions.close,

        ["j"] = actions.move_selection_next,
        ["k"] = actions.move_selection_previous,

        ['<C-u>'] = actions.preview_scrolling_up,
        ['<C-d>'] = actions.preview_scrolling_down,
        ['<C-q>'] = actions.send_to_qflist
      }
    }
  }
}

-- depends on `nvim-telescope/telescope-fzy-native.nvim`
vim.cmd[[packadd telescope-fzy-native.nvim]]
require('telescope').load_extension('fzy_native') -- superfast sorter
-- require('telescope').load_extension('dotfiles')

-- M.grep_prompt = function()
--   require'telescope.builtin'.grep_string{
--     shorten_path = true,
--     search = vim.fn.input("Grep String > ")
--   }
-- end

return M


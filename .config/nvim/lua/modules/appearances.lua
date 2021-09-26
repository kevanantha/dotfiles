local hl = function(group, options)
  local bg = options.bg == nil and '' or 'guibg=' .. options.bg
  local fg = options.fg == nil and '' or 'guifg=' .. options.fg
  local gui = options.gui == nil and '' or 'gui=' .. options.gui

  vim.cmd(string.format(
    'hi %s %s %s %s',
    group, bg, fg, gui
  ))
end

ColorUtil = {}

ColorUtil.override_gruvbox = function()
  local highlights = {
    -- normal stuff
    {'Normal', { bg = 'NONE' }},
    {'Comment', { gui = 'italic' }},
    {'SignColumn', { bg = 'NONE' }},
    {'ColorColumn', { bg = '#3C3836' }},
    {'EndOfBuffer', { bg = 'NONE', fg = '#04ADEF' }},
    {'IncSearch', { bg = '#928374' }},
    {'String', { gui = 'NONE' }},
    {'Special', { gui = 'NONE' }},

    {'SignAdd', { fg = '#458588', bg = 'NONE' }},
    {'SignChange', { fg = '#D79921', bg = 'NONE' }},
    {'SignDelete', { fg = '#fb4934', bg = 'NONE' }},
    {'GitGutterChange', { fg = '#D79921' }},
    {'GitGutterDelete', { fg = '#fb4934' }},

    -- misc
    {'htmlLink', { gui = 'NONE', fg = '#ebdbb2' }},
    {'jsonNoQuotesError', { fg = '#fb4934' }},
    {'jsonMissingCommaError', { fg = '#fb4934' }},
    {'IncSearch', { bg='#282828', fg='#928374' }},
    {'mkdLineBreak', { bg='NONE' }},

    -- statusline colours
    {'StatusLine', { fg = '#3C3836', bg = '#EBDBB2' }},
    {'StatusLineNC', { fg = '#3C3836', bg = '#928374' }},
    {'Mode', { bg = '#928374', fg = '#1D2021', gui="bold" }},
    {'LineCol', { bg = '#928374', fg = '#1D2021', gui="bold" }},
    {'Git', { bg = '#504945', fg = '#EBDBB2' }},
    {'Filetype', { bg = '#504945', fg = '#EBDBB2' }},
    {'Filename', { bg = '#504945', fg = '#EBDBB2' }},

    {'ModeAlt', { bg = '#504945', fg = '#928374' }},
    {'GitAlt', { bg = '#3C3836', fg = '#504945' }},
    {'LineColAlt', { bg = '#504945', fg = '#928374' }},
    {'FiletypeAlt', { bg = '#3C3836', fg = '#504945' }},

    -- luatree
    -- {'NvimTreeFolderIcon', { fg = '#d79921' }},
    -- {'NvimTreeIndentMarker', { fg = '#928374' }},

    -- telescope
    {'TelescopeSelection', { bg='NONE', fg='#d79921', gui='bold' }},
    {'TelescopeMatching', { bg='NONE', fg='#fb4934', gui='bold' }},
    {'TelescopeBorder', { bg='NONE', fg='#928374', gui='bold' }},

    -- diagnostic nvim
    {'LspDiagnosticsDefaultError', { bg='NONE', fg='#fb4934' }},
    {'LspDiagnosticsDefaultWarning', { bg='NONE', fg='#d79921' }},
    {'LspDiagnosticsDefaultInformation', { bg='NONE', fg='#458588' }},
    {'LspDiagnosticsDefaultHint', { bg='NONE', fg='#689D6A' }},

    -- ts override
    {'TSKeywordOperator', { bg='NONE', fg='#fb4934' }},
    {'TSOperator', { bg='NONE', fg='#fe8019' }},
  }

  for _, highlight in pairs(highlights) do
    hl(highlight[1], highlight[2])
  end
end

-- italicize comments
hl('Comment', { gui = 'italic' })

-- automatically override colourscheme
-- vim.cmd('augroup NewColor')
-- vim.cmd('au!')
-- vim.cmd('au ColorScheme gruvbox8_hard call v:lua.ColorUtil.override_gruvbox()')
-- vim.cmd('augroup END')

-- disable invert selection for gruvbox
-- vim.g.gruvbox_invert_selection = true
-- vim.g.gruvbox_contrast_dark = 'dark'

-- vim.cmd('colorscheme gruvbox8_hard')
vim.g.tokyonight_style = "night"
vim.cmd('colorscheme tokyonight')

-- needs to be loaded after setting colourscheme
vim.cmd[[packadd nvim-web-devicons]]
require'nvim-web-devicons'.setup {
  override = {
    svg = {
      icon = '',
      color = '#ebdbb2',
      name = 'Svg'
    }
  };
  default = true
}

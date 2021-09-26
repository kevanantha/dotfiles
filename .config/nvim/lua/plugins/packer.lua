vim.cmd [[packadd packer.nvim]]

local ok, packer = pcall(require, "packer")

if ok then
  local use = packer.use

  packer.init()

  local plugins = function()
    -- Packer can manage itself as an optional plugin
    use { 'wbthomason/packer.nvim', opt = true }

    use { 'folke/tokyonight.nvim', opt = false }
    use { 'Pocco81/Catppuccino.nvim', opt = true }
    use { 'rhysd/clever-f.vim', opt = false } -- clever-f.vim
    use { 'rhysd/accelerated-jk', opt = false } -- accelerated-jk
    use { 'wakatime/vim-wakatime', opt = false } -- wakatime
    use { 'mattn/emmet-vim', opt = false } -- emmet
    use { 'lifepillar/vim-gruvbox8', opt = false } -- gruv f box
    use { 'tweekmonster/startuptime.vim', opt = true, cmd = 'StartupTime' }
    use { 'mhartington/formatter.nvim', opt = true, cmd = 'Format' }
    use { 'raimondi/delimitmate', opt = false } -- autopairs brackets, braces, etc.
    use { 'tpope/vim-commentary', opt = false }
    use { 'tpope/vim-fugitive', opt = false }
    use { 'tpope/vim-dispatch', opt = false }
    use { 'tpope/vim-surround', opt = false }
    use { 'Yggdroot/indentLine', opt = false }
    -- use :%s/find/replace instead of vim multiple cursors
    use { 'terryma/vim-multiple-cursors', opt = false }
    use { 'kosayoda/nvim-lightbulb', opt = true }
    use { 'nvim-treesitter/nvim-treesitter', opt = false } -- better syntax highlighting
    use { 'nvim-treesitter/playground', opt = true } -- playground for treesitter
    use { 'nvim-treesitter/nvim-treesitter-textobjects', opt = true } -- textobjects for treesitter
    use { 'neovim/nvim-lspconfig', opt = false } -- builtin lsp config
    -- use { 'nvim-lua/completion-nvim', opt = false }
    use {
      'hrsh7th/nvim-compe',
      opt = true,
      requires = {
        { 'hrsh7th/vim-vsnip' }, -- integration with vim-vsnip
        { 'hrsh7th/vim-vsnip-integ' } -- integration with vim-vsnip
      }
    } -- completion framework
    use { 'glepnir/lspsaga.nvim' } -- Saga
    use { 'nvim-telescope/telescope.nvim',
      requires = {
        {'nvim-lua/popup.nvim'},
        {'nvim-lua/plenary.nvim'},
      },
    } -- extensible fuzzy finder
    use { 'nvim-telescope/telescope-fzy-native.nvim',
      opt = true,
      requires = {
        {'nvim-telescope/telescope.nvim'}
      }
    } -- faster sorter algo for telescope
    use { 'kyazdani42/nvim-tree.lua',
      opt = true,
      requires = {
        { 'kyazdani42/nvim-web-devicons', opt = true }
      },
    } -- super fast file tree viewer
    use { 'rhysd/git-messenger.vim',
      cmd = 'GitMessenger',
      opt = true
    } -- sort of like git blame but in floating window
    use { 'akinsho/nvim-bufferline.lua',
      opt = true,
      requires = {
        { 'kyazdani42/nvim-web-devicons', opt = true }
      }
    } -- snazzy bufferline
    use { 'lewis6991/gitsigns.nvim',
      requires = { 'nvim-lua/plenary.nvim' }
    }
    use { 'glepnir/galaxyline.nvim',
      branch = 'main',
      -- your statusline
      -- config = function() require'modules.statusline' end,
      -- some optional icons
      requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }
  end

  return packer.startup(plugins)
end

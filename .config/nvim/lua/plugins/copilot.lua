return {
  -- copilot
  {
    "zbirenbaum/copilot.lua",
    -- opts = function()
    --   require("copilot").setup({
    --     suggestion = { enabled = false },
    --     panel = { enabled = false },
    --   })
    -- end,
    event = "InsertEnter",
    init = function()
      vim.g.copilot_no_tab_map = true
    end,
    keys = {
      { "<C-CR>", "copilot#Accept('\\<CR>')", expr = true, mode = "i", desc = "Accept copilot suggestion" },
    },
  },
  {
    "zbirenbaum/copilot-cmp",
    dependencies = { "zbirenbaum/copilot.lua" },
    opts = function()
      require("copilot").setup({})
    end,
  },
}

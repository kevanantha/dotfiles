return {
  -- formatters
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "mason.nvim" },
    opts = function()
      local nls = require("null-ls")
      return {
        save_after_format = false,
        sources = {
          nls.builtins.formatting.prettier,

          nls.builtins.formatting.stylua,
          nls.builtins.diagnostics.flake8,

          nls.builtins.code_actions.eslint,
          nls.builtins.code_actions.refactoring,
        },
        root_dir = require("null-ls.utils").root_pattern("package.json", ".null-ls-root", ".neoconf.json", ".git"),
      }
    end,
  },
}

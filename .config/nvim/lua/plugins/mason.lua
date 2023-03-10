return {
  -- add any tools you want to have installed below
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- LSP
        "json-lsp",
        "typescript-language-server",
        "vue-language-server",
        "css-lsp",
        "dockerfile-language-server",
        "docker-compose-language-service",
        -- "emmet-lsp",
        "eslint-lsp",
        "gopls",
        "rnix-lsp",
        "rust-analyzer",
        "tailwindcss-language-server",
        "yaml-language-server",

        -- DAP
        "go-debug-adapter",

        -- Linter
        "flake8",
        "shellcheck",
        "commitlint",
        "eslint_d",
        "golangci-lint",

        -- Formatter
        "prettier",
        "goimports",
        "gofumpt",
        "goimports-reviser",
        "golines",
        "rustfmt",
        "yamlfmt",
        "sql-formatter",
        "stylua",
        "shfmt",
      },
    },
  },
}

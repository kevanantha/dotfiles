vim.cmd[[packadd formatter.nvim]]

local remap = vim.api.nvim_set_keymap
local is_cfg_present = require('modules.util').is_cfg_present

local prettier = function()
  if is_cfg_present("/.prettierrc") then
    return {
      exe = "prettier",
      args = {
        string.format(
          "--stdin-filepath '%s' --config '%s'",
          vim.api.nvim_buf_get_name(0),
          vim.loop.cwd().."/.prettierrc"
        )
      },
      stdin = true
    }
  else
    -- fallback to global config
    return {
      exe = "prettier",
      args = {
        string.format(
          "--stdin-filepath '%s' --config '%s'",
          vim.api.nvim_buf_get_name(0),
          vim.fn.stdpath("config").."/.prettierrc"
        )
      },
      stdin = true
    }
  end
end

local rubocop = function()
  return {
  exe = "bundle exec rubocop",
  args = {
    string.format(
      "-a %s",
      vim.api.nvim_buf_get_name(0)
    )
  },
  stdin = true
}
end

local rustfmt = function()
  return {exe = "rustfmt", args = {"--emit=stdout"}, stdin = true}
end

local gofmt = function()
  return {exe = "gofumpt", stdin = true}
end

local luafmt = function()
  return {
    exe = "lua-format",
    args = {"-i", "--config", "~/.config/nvim/.luafmt"},
    stdin = true
  }
end

require'formatter'.setup({
  logging = false,
  filetype = {
    javascript = {prettier},
    typescript = {prettier},
    typescriptreact = {prettier},
    javascriptreact = {prettier},
    ruby = {rubocop},
    svelte = {prettier},
    css = {prettier},
    jsonc = {prettier},
    html = {prettier},
    php = {prettier},
    rust = {rustfmt},
    lua = {luafmt},
    go = {gofmt}
  }
})


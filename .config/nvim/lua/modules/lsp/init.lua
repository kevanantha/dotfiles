vim.cmd[[packadd nvim-lspconfig]]

local nvim_lsp = require('lspconfig')
local mappings = require('modules.lsp.mappings')
local is_cfg_present = require('modules.util').is_cfg_present

require('modules.lsp.custom_handlers') -- override hover callback
require('modules.lsp.diagnostic') -- diagnostic stuff

-- https://github.com/neovim/nvim-lspconfig/issues/490#issuecomment-753624074
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    'documentation',
    'detail',
    'additionalTextEdits',
  }
}

local custom_on_attach = function(client)
  mappings.lsp_mappings()

  if client.config.flags then
    client.config.flags.allow_incremental_sync = true
    client.resolved_capabilities.document_formatting = true
  end
end

local custom_on_init = function()
  print('Language Server Protocol Started!')
end

-- use eslint if the eslint config file present
local is_using_eslint = function(_, _, result, client_id)
  if is_cfg_present("/.eslintrc.json") or is_cfg_present("/.eslintrc.js") then
    return
  end

  return vim.lsp.handlers["textDocument/publishDiagnostics"](_, _, result, client_id)
end

local is_using_prettier = function(_, _, result, client_id)
  if is_cfg_present("/.prettierrc") or is_cfg_present("/.prettierrc.js") then
    return
  end

  return vim.lsp.handlers["textDocument/publishDiagnostics"](_, _, result, client_id)
end

nvim_lsp.tsserver.setup{
  -- capabilities = capabilities,
  filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
  cmd = { "typescript-language-server", "--stdio" },
  on_attach = function(client)
    mappings.lsp_mappings()
    if client.config.flags then
      client.config.flags.allow_incremental_sync = true
    end
  end,
  handlers = {
    ['textDocument/publishDiagnostics'] = is_using_eslint
    -- ['textDocument/publishDiagnostics'] = is_using_prettier
  },
  on_init = custom_on_init,
  -- root_dir = root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git")
  -- root_dir = function() return vim.loop.cwd() end
}

nvim_lsp.solargraph.setup{
  capabilities = capabilities,
  on_attach = custom_on_attach,
  cmd = { "solargraph", "stdio" },
  filetypes = { "ruby" },
  -- root_dir = root_pattern("Gemfile", ".git"),
  -- root_dir = function() return vim.loop.cwd() end,
  settings = {
    solargraph = {
      diagnostics = true
    }
  },
  on_init = custom_on_init
}

--Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

nvim_lsp.html.setup{
  capabilities = capabilities,
  on_attach = custom_on_attach,
  on_init = custom_on_init,
  -- cmd = { "html-languageserver", "--stdio" },
  cmd = { "vscode-html-language-server", "--stdio" },
  filetypes = { "html" },
  init_options = {
    configurationSection = { "html", "css", "javascript" },
    embeddedLanguages = {
      css = true,
      javascript = true
    }
  },
  settings = {},
  -- root_dir = <function 1>
  -- root_dir = function() return vim.loop.cwd() end
}

nvim_lsp.cssls.setup{
  on_attach = custom_on_attach,
  on_init = custom_on_init,
  -- cmd = { "css-languageserver", "--stdio" },
  cmd = { "vscode-css-language-server", "--stdio" },
  capabilities = capabilities,
  filetypes = { "css", "scss", "less" },
  -- root_dir = root_pattern("package.json"),
  -- root_dir = function() return vim.loop.cwd() end,
  settings = {
    css = {
      validate = true
    },
    less = {
      validate = true
    },
    scss = {
      validate = true
    }
  }
}

nvim_lsp.dockerls.setup{
  capabilities = capabilities,
  on_attach = custom_on_attach,
  on_init = custom_on_init,
  cmd = { "docker-langserver", "--stdio" },
  filetypes = { "Dockerfile", "dockerfile" },
}

nvim_lsp.yamlls.setup{
  capabilities = capabilities,
  on_attach = custom_on_attach,
  on_init = custom_on_init,
  cmd = { "yaml-language-server", "--stdio" },
  filetypes = { "yaml" },
}

nvim_lsp.vuels.setup{
  capabilities = capabilities,
  on_attach = custom_on_attach,
  on_init = custom_on_init,
  cmd = { "vls" },
  filetypes = { "vue" },
  init_options = {
    config = {
      css = {},
      emmet = {},
      html = {
        suggest = {}
      },
      javascript = {
        format = {}
      },
      stylusSupremacy = {},
      typescript = {
        format = {}
      },
      vetur = {
        completion = {
          autoImport = true,
          tagCasing = "kebab",
          useScaffoldSnippets = false
        },
        format = {
          defaultFormatter = {
            js = "prettier",
            ts = "prettier"
          },
          defaultFormatterOptions = {},
          scriptInitialIndent = false,
          styleInitialIndent = false
        },
        useWorkspaceDependencies = false,
        validation = {
          script = true,
          style = true,
          template = true,
          templateProps = true,
          interpolation = true
        }
      }
    }
  },
}

nvim_lsp.jsonls.setup{
  capabilities = capabilities,
  on_attach = custom_on_attach,
  on_init = custom_on_init,
  -- cmd = { "vscode-json-languageserver", "--stdio" },
  cmd = { "vscode-json-languageserver", "--stdio" },
  filetypes = { "json" },
  init_options = {
    provideFormatter = true
  },
  commands = {
    Format = {
      function()
        vim.lsp.buf.range_formatting({},{0,0},{vim.fn.line("$"),0})
      end
    }
  }
}

nvim_lsp.rust_analyzer.setup{
  capabilities = capabilities,
  on_attach = custom_on_attach,
  on_init = custom_on_init,
}

nvim_lsp.clangd.setup{
  capabilities = capabilities,
  on_attach = custom_on_attach,
  on_init = custom_on_init
}

nvim_lsp.gopls.setup{
  capabilities = capabilities,
  on_attach = custom_on_attach,
  on_init = custom_on_init,
}

local eslint = {
  lintCommand = "./node_modules/.bin/eslint -f unix --stdin --stdin-filename ${INPUT}",
  lintIgnoreExitCode = true,
  lintStdin = true,
  lintFormats = {"%f:%l:%c: %m"},
  rootMarkers = {
    "package.json",
    ".eslintrc.js",
    ".eslintrc.yaml",
    ".eslintrc.yml",
    ".eslintrc.json",
  }
}

local prettier = {
  formatCommand = (
    function()
      if is_cfg_present("/.prettierrc") then
        return "prettier --config ./.prettierrc"
      elseif is_cfg_present("/.prettierrc.js") then
        return "prettier --config ./.prettierrc.js"
      else
        return "prettier --config ~/.config/nvim/.prettierrc"
      end
    end
  )()
}

local gofmt= {
  formatCommand = "gofmt"
}

local rustfmt = {
  formatCommand = "rustfmt --emit=stdout"
}

-- TODO(elianiva): find a way to fix wrong formatting
if false then
nvim_lsp.efm.setup{
  capabilities = capabilities,
  cmd = {"efm-langserver"},
  on_attach = function(client)
    client.resolved_capabilities.rename = false
    client.resolved_capabilities.hover = false
  end,
  on_init = custom_on_init,
  init_options = { documentFormatting = true },
  filetypes = {"javascript", "typescript", "typescriptreact", "svelte"},
  settings = {
    rootMarkers = {".git", "package.json"},
    languages = {
      javascript = { eslint, prettier },
      typescript = { eslint, prettier },
      typescriptreact = { eslint, prettier },
      javascriptreact = { eslint, prettier },
      -- svelte = { eslint, prettier },
      html = { prettier },
      css = { prettier }
      -- jsonc = { prettier },
      -- go = { gofmt },
      -- rust = { rustfmt },
    }
  }
}
end

-- nvim_lsp.svelte.setup{
--   on_attach = function(client)
--     mappings.lsp_mappings()

--     if client.config.flags then
--       client.config.flags.allow_incremental_sync = true
--     end
--     client.server_capabilities.completionProvider.triggerCharacters = {
--       ".", '"', "'", "`", "/", "@", "*",
--       "#", "$", "+", "^", "(", "[", "-", ":"
--     }
--   end,
--   handlers = {
--     ['textDocument/publishDiagnostics'] = is_using_eslint
--   },
--   on_init = custom_on_init,
--   filetypes = { 'svelte' },
--   settings = {
--     svelte =  {
--       plugin = {
--         html = {
--           completions = {
--             enable = true,
--             emmet = false
--           },
--         },
--       }
--     }
--   },
-- }

-- local sumneko_root = os.getenv("HOME") .. "/repos/lua-language-server"
-- nvim_lsp.sumneko_lua.setup{
--   cmd = {
--     sumneko_root
--     .. "/bin/Linux/lua-language-server", "-E",
--     sumneko_root .. "/main.lua"
--   },
--   on_attach = custom_on_attach,
--   on_init = custom_on_init,
--   settings = {
--     Lua = {
--       runtime = { version = "LuaJIT", path = vim.split(package.path, ';'), },
--       completion = { keywordSnippet = "Disable" },
--       diagnostics = {
--         enable = true,
--         globals = {
--           "vim", "describe", "it", "before_each", "after_each",
--           "awesome", "theme", "client"
--         },
--       },
--     }
--   }
-- }


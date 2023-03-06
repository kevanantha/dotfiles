return {
  -- floating winbar
  {
    "b0o/incline.nvim",
    event = "BufReadPre",
    config = function()
      local colors = require("tokyonight.colors").setup()
      require("incline").setup({
        highlight = {
          groups = {
            InclineNormal = { guibg = "#FC56B1", guifg = colors.black },
            InclineNormalNC = { guifg = "#FC56B1", guibg = colors.black },
          },
        },
        window = { margin = { vertical = 0, horizontal = 1 } },
        render = function(props)
          local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
          local icon, color = require("nvim-web-devicons").get_icon_color(filename)
          return { { icon, guifg = color }, { " " }, { filename } }
        end,
      })
    end,
  },

  -- auto-resize windows
  {
    "anuvyklack/windows.nvim",
    event = "WinNew",
    dependencies = {
      { "anuvyklack/middleclass" },
      { "anuvyklack/animation.nvim", enabled = false },
    },
    keys = { { "<leader>z", "<cmd>WindowsMaximize<cr>", desc = "Zoom" } },
    config = function()
      vim.o.winwidth = 5
      vim.o.equalalways = false
      require("windows").setup({
        animation = { enable = false, duration = 150 },
      })
    end,
  },

  -- scrollbar
  {
    "petertriho/nvim-scrollbar",
    event = "BufReadPost",
    config = function()
      local scrollbar = require("scrollbar")
      local colors = require("tokyonight.colors").setup()
      scrollbar.setup({
        handle = { color = colors.bg_highlight },
        excluded_filetypes = { "prompt", "TelescopePrompt", "noice", "notify" },
        marks = {
          Search = { color = colors.orange },
          Error = { color = colors.error },
          Warn = { color = colors.warning },
          Info = { color = colors.info },
          Hint = { color = colors.hint },
          Misc = { color = colors.purple },
        },
      })
    end,
  },

  -- bufferline
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    keys = {
      { "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle pin" },
      { "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete non-pinned buffers" },
    },
    opts = {
      options = {
        diagnostics = "nvim_lsp",
        always_show_bufferline = false,
        diagnostics_indicator = function(_, _, diag)
          local icons = require("lazyvim.config").icons.diagnostics
          local ret = (diag.error and icons.Error .. diag.error .. " " or "")
            .. (diag.warning and icons.Warn .. diag.warning or "")
          return vim.trim(ret)
        end,
        offsets = {
          -- {
          --   filetype = "neo-tree",
          --   text = "Neo-tree",
          --   highlight = "Directory",
          --   text_align = "left",
          -- },
          {
            filetype = "NvimTree",
            highlight = "Directory",
            text = "File Explorer",
            text_align = "center",
            separator = true,
          },
        },
      },
    },
  },

  -- statusline
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function()
      local icons = require("lazyvim.config").icons

      local function fg(name)
        return function()
          ---@type {foreground?:number}?
          local hl = vim.api.nvim_get_hl_by_name(name, true)
          return hl and hl.foreground and { fg = string.format("#%06x", hl.foreground) }
        end
      end

      return {
        options = {
          theme = "auto",
          globalstatus = true,
          component_separators = { left = "", right = "" },
          section_separators = { left = "", right = "" },
          disabled_filetypes = { statusline = { "dashboard", "lazy", "alpha" } },
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch" },
          lualine_c = {
            {
              "diagnostics",
              symbols = {
                error = icons.diagnostics.Error,
                warn = icons.diagnostics.Warn,
                info = icons.diagnostics.Info,
                hint = icons.diagnostics.Hint,
              },
            },
            { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
            { "filename", path = 1, symbols = { modified = "  ", readonly = "", unnamed = "" } },
            -- stylua: ignore
            {
              function() return require("nvim-navic").get_location() end,
              cond = function() return package.loaded["nvim-navic"] and require("nvim-navic").is_available() end,
            },
          },
          lualine_x = {
            {
              function(msg)
                msg = msg or "LS Inactive"
                local buf_clients = vim.lsp.get_active_clients()
                if next(buf_clients) == nil then
                  -- TODO: clean up this if statement
                  if type(msg) == "boolean" or #msg == 0 then
                    return "LS Inactive"
                  end
                  return msg
                end
                local buf_ft = vim.bo.filetype
                local buf_client_names = {}
                local copilot_active = false

                -- add client
                for _, client in pairs(buf_clients) do
                  if client.name ~= "null-ls" and client.name ~= "copilot" then
                    table.insert(buf_client_names, client.name)
                  end

                  if client.name == "copilot" then
                    copilot_active = true
                  end
                end

                local unique_client_names = vim.fn.uniq(buf_client_names)

                local language_servers = "[" .. table.concat(unique_client_names, ", ") .. "]"

                local copilot_icon = require("lazyvim.config").icons.kinds.Copilot

                if copilot_active then
                  language_servers = language_servers .. "%#SLCopilot#" .. " " .. copilot_icon .. "%*"
                end

                return language_servers
              end,
            },


            -- stylua: ignore
            -- {
            --   function() return require("noice").api.status.command.get() end,
            --   cond = function() return package.loaded["noice"] and require("noice").api.status.command.has() end,
            --   color = fg("Statement")
            -- },
            -- stylua: ignore
            -- {
            --   function() return require("noice").api.status.mode.get() end,
            --   cond = function() return package.loaded["noice"] and require("noice").api.status.mode.has() end,
            --   color = fg("Constant") ,
            -- },
            -- { require("lazy.status").updates, cond = require("lazy.status").has_updates, color = fg("Special") },
            {
              "diff",
              symbols = {
                added = icons.git.added,
                modified = icons.git.modified,
                removed = icons.git.removed,
              },
            },
          },
          lualine_y = {
            {
              function()
                local icon = ""
                local shiftwidth = vim.api.nvim_buf_get_option(0, "shiftwidth")
                return icon .. " " .. shiftwidth
              end,
              padding = 1,
            },
            { "progress", separator = " ", padding = { left = 1, right = 0 } },
            { "location", padding = { left = 0, right = 1 } },
          },
          lualine_z = {
            function()
              return " " .. os.date("%R")
            end,
          },
        },
        -- extensions = { "neo-tree" },
        -- extensions = { "NvimTree" },
      }
    end,
  },
}

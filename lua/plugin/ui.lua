return {
    -- Better `vim.notify()`
    {
      "rcarriga/nvim-notify",
      keys = {
        {
          "<leader>un",
          function()
            require("notify").dismiss({ silent = true, pending = true })
          end,
          desc = "Dismiss all Notifications",
        },
      },
      opts = {
        timeout = 3000,
        max_height = function()
          return math.floor(vim.o.lines * 0.75)
        end,
        max_width = function()
          return math.floor(vim.o.columns * 0.75)
        end,
      },
    },
  
    -- lualine
    {
      "nvim-lualine/lualine.nvim",
      event = "VeryLazy",
      opts = function()
        return {
          options = {
            theme = "gruvbox-material",
            globalstatus = true,
            disabled_filetypes = { statusline = { "dashboard", "alpha" } },
          },
          sections = {
            lualine_a = { "mode" },
            lualine_b = { "branch" },
            lualine_c = {
              { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
              { "filename", path = 1, },
              {
                function() return require("nvim-navic").get_location() end,
                cond = function() return package.loaded["nvim-navic"] and require("nvim-navic").is_available() end,
              },
            },
              lualine_y = {
              { "progress", separator = " ", padding = { left = 1, right = 0 } },
              { "location", padding = { left = 0, right = 1 } },
            },
            lualine_z = {
              function()
                return " " .. os.date("%R")
              end,
            },
          },
          extensions = { "neo-tree", "lazy" },
        }
      end,
    },

    {
      "lukas-reineke/indent-blankline.nvim",
      event = { "BufReadPost", "BufNewFile" },
      opts = {
        char = "┊",
        filetype_exclude = {
          "help",
          "alpha",
          "dashboard",
          "neo-tree",
          "Trouble",
          "lazy",
          "mason",
          "notify",
          "toggleterm",
          "lazyterm",
        },
        show_trailing_blankline_indent = false,
        show_current_context = true,
        char_highlight_list={
          "GruvboxGray",
        }
      },
    },
  
    {
      "SmiteshP/nvim-navic",
      lazy = true,
      init = function()
        vim.g.navic_silence = true
        require("utils").on_attach(function(client, buffer)
          if client.server_capabilities.documentSymbolProvider then
            require("nvim-navic").attach(client, buffer)
          end
        end)
      end,
      opts = function()
        return {
          separator = " ",
          highlight = true,
          depth_limit = 5,
          icons = require("config.icons").kinds,
        }
      end,
    },
  
    -- icons
    { "nvim-tree/nvim-web-devicons", lazy = true },

}
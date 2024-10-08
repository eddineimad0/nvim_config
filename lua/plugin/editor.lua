local Util = require("utils")

return {
  -- file explorer
  {
    "nvim-tree/nvim-tree.lua",
    lazy=false,
    opts={
        sort_by = "case_sensitive",
        actions = {
            open_file = {quit_on_open = true }
        },
        update_focused_file = {
            enable = false,
            update_cwd = false
        },
        renderer = {
            group_empty = true,
        },
        filters = {
            custom = {"^.git$"}
        },
        git = {
            enable = true,
        },
        log = {
            enable = false,
            types = {
                diagnostics = false,
            }
        },
        diagnostics = {
            enable = true,
            show_on_dirs = false,
            debounce_delay = 50,
            icons = {
            hint='H',
            info ='I',
            warning='W',
            error='E',
            },
        }
    },
    keys = {
      { "<leader>e", "<cmd>NvimTreeToggle<CR>", desc = "Explorer NvimTree (root dir)", remap = true },
      { "<leader>E", "<cmd>NvimTreeFocus<CR>", desc = "Explorer NvimTree (cwd)", remap = true },
    },
  },

  -- fuzzy finder
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    version = false, -- telescope did only one release, so use HEAD for now
    keys = {
      { "<leader>/", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Buffer" },
      -- find
      { "<leader>sb", "<cmd>Telescope buffers show_all_buffers=true<cr>", desc = "Search Open Buffers" },
      { "<leader>sf", Util.telescope("files"), desc = "Search for Files (root dir)" },
      { "<leader>sc", "<cmd>Telescope resume<cr>", desc = "Search Continue" },
      { "<leader>sd", "<cmd>Telescope diagnostics bufnr=0<cr>", desc = "Search Document diagnostics" },
      { "<leader>sD", "<cmd>Telescope diagnostics<cr>", desc = "Search Workspace diagnostics" },
      { "<leader>sg", Util.telescope("live_grep"), desc = "Grep Search (root dir)" },
      { "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Search Key Maps" },
      { "<leader>sw", Util.telescope("grep_string", { word_match = "-w" }), desc = "Search Word (root dir)" },
      { "<leader>sW", Util.telescope("grep_string"), mode = "v", desc = "Search Selection (root dir)" },
      {
        "<leader>gs",
        Util.telescope("lsp_document_symbols", {
          symbols = {
            "Class",
            "Function",
            "Method",
            "Constructor",
            "Interface",
            "Module",
            "Struct",
            "Trait",
            "Field",
            "Property",
          },
        }),
        desc = "Goto Symbol",
      },
      {
        "<leader>gS",
        Util.telescope("lsp_dynamic_workspace_symbols", {
          symbols = {
            "Class",
            "Function",
            "Method",
            "Constructor",
            "Interface",
            "Module",
            "Struct",
            "Trait",
            "Field",
            "Property",
          },
        }),
        desc = "Goto Symbol (Workspace)",
      },
    },
    opts = {
      defaults = {
        prompt_prefix = " ",
        selection_caret = " ",
        mappings = {
          i = {
            ["<c-t>"] = function(...)
              return require("trouble.providers.telescope").open_with_trouble(...)
            end,
            ["<a-t>"] = function(...)
              return require("trouble.providers.telescope").open_selected_with_trouble(...)
            end,
            ["<a-i>"] = function()
              local action_state = require("telescope.actions.state")
              local line = action_state.get_current_line()
              Util.telescope("find_files", { no_ignore = true, default_text = line })()
            end,
            ["<a-h>"] = function()
              local action_state = require("telescope.actions.state")
              local line = action_state.get_current_line()
              Util.telescope("find_files", { hidden = true, default_text = line })()
            end,
            ["<C-Down>"] = function(...)
              return require("telescope.actions").cycle_history_next(...)
            end,
            ["<C-Up>"] = function(...)
              return require("telescope.actions").cycle_history_prev(...)
            end,
            ["<C-f>"] = function(...)
              return require("telescope.actions").preview_scrolling_down(...)
            end,
            ["<C-b>"] = function(...)
              return require("telescope.actions").preview_scrolling_up(...)
            end,
          },
          n = {
            ["q"] = function(...)
              return require("telescope.actions").close(...)
            end,
          },
        },
      },
    },
  },

  -- git signs highlights text that has changed since the list
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '-' },
        topdelete = { text = '‾' },
        changedelete = { text = '_' },
        untracked = { text = "▎" },
      },
      on_attach = function(buffer)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, desc)
          vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
        end
        map("n", "<leader>ghb", function() gs.blame_line({ full = true }) end, "Blame Line")
        map("n", "<leader>ghd", gs.diffthis, "Diff This")
        map("n", "<leader>ghD", function() gs.diffthis("~") end, "Diff This ~")
      end,
    },
  },
  {
    'akinsho/toggleterm.nvim',
    version = "*",
    opts = {
      size = 15,
      open_mapping = [[<C-\>]],
      shading_factor = 2,
      direction = "float",
      float_opts = {
        border = "curved",
        highlights = {
          border = "Normal",
          background = "Normal",
        },
      },
      shell = vim.o.shell,
    },
    keys={
      -- Terminal
      {"<leader>th", "<CMD>ToggleTerm size=16 direction=horizontal<CR>",desc = "Open horizontal terminal",remap=true},
      {"<leader>tt", "<CMD>ToggleTerm size=70 direction=vertical<CR>", desc = "Open vertical terminal", remap=true},
      {"<leader>tf", "<CMD>ToggleTerm size=80 <CR>", desc = "Open floating terminal", remap=true},
    },
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = {"TodoTrouble","TodoTelescope"},
    event = { "BufReadPost", "BufNewFile" },
    config = true,
    keys = {
      { "]t", function() require("todo-comments").jump_next() end, desc = "Next todo comment" },
      { "[t", function() require("todo-comments").jump_prev() end, desc = "Previous todo comment" },
      { "<leader>st", "<cmd>TodoTelescope<cr>", desc = "Todo" },
      { "<leader>sT", "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>", desc = "Todo/Fix/Fixme" },
    },
  },

    -- search/replace in multiple files
  {
    "MagicDuck/grug-far.nvim",
    opts = { headerMaxWidth = 80 },
    cmd = "GrugFar",
    keys = {
      {
        "<leader>sr",
        function()
          local grug = require("grug-far")
          local ext = vim.bo.buftype == "" and vim.fn.expand("%:e")
          grug.open({
            transient = true,
            prefills = {
              filesFilter = ext and ext ~= "" and "*." .. ext or nil,
            },
          })
        end,
        mode = { "n", "v" },
        desc = "Search and Replace",
      },
    },
  },
}

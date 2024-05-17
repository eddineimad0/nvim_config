local KeyMap = {}

function KeyMap.diagnostic_goto(next, severity)
  local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
  severity = severity and vim.diagnostic.severity[severity] or nil
  return function()
    go({ severity = severity })
  end
end


---@type PluginLspKeys
KeyMap._keys = nil

---@return (LazyKeys|{has?:string})[]
function KeyMap.get()
  if not KeyMap._keys then
  ---@class PluginLspKeys
    KeyMap._keys =  {
      { "<leader>cd", vim.diagnostic.open_float, desc = "Line Diagnostics" },
      { "<leader>cl", "<cmd>LspInfo<cr>", desc = "Lsp Info" },
       -- Jump to the definition of the word under your cursor.
      --  This is where a variable was first declared, or where a function is defined, etc.
      --  To jump back, press <C-T>.
      { "gd", function() require("telescope.builtin").lsp_definitions({ reuse_win = true }) end, desc = "Goto Definition", has = "definition" },
      -- Find references for the word under your cursor.
      { "sr", "<cmd>Telescope lsp_references<cr>", desc = "Search References" },
      -- WARN: This is not Goto Definition, this is Goto Declaration.
      --  For example, in C this would take you to the header
      { "gD", vim.lsp.buf.declaration, desc = "Goto Declaration" },
      -- Jump to the implementation of the word under your cursor.
      --  Useful when your language has ways of declaring types without an actual implementation.
      { "gI", function() require("telescope.builtin").lsp_implementations({ reuse_win = true }) end, desc = "Goto Implementation" },
      -- Jump to the type of the word under your cursor.
      --  Useful when you're not sure what type a variable is and you want to see
      --  the definition of its *type*, not where it was *defined*.
      { "gy", function() require("telescope.builtin").lsp_type_definitions({ reuse_win = true }) end, desc = "Goto T[y]pe Definition" },
      -- Opens a popup that displays documentation about the word under your cursor
      --  See `:help K` for why this keymap
      { "gK", vim.lsp.buf.signature_help, desc = "Signature Help", has = "signatureHelp" },
      -- { "]d", KeyMap.diagnostic_goto(true), desc = "Next Diagnostic" },
      -- { "[d", KeyMap.diagnostic_goto(false), desc = "Prev Diagnostic" },
      { "]e", KeyMap.diagnostic_goto(true, "ERROR"), desc = "Next Error" },
      { "[e", KeyMap.diagnostic_goto(false, "ERROR"), desc = "Prev Error" },
      { "]w", KeyMap.diagnostic_goto(true, "WARN"), desc = "Next Warning" },
      { "[w", KeyMap.diagnostic_goto(false, "WARN"), desc = "Prev Warning" },
      -- Execute a code action, usually your cursor needs to be on top of an error
      -- or a suggestion from your LSP for this to activate
      { "<leader>ca", vim.lsp.buf.code_action, desc = "Code Action", mode = { "n", "v" }, has = "codeAction" },
      {
        "<leader>cA",
        function()
          vim.lsp.buf.code_action({
            context = {
              only = {
                "source",
              },
              diagnostics = {},
            },
          })
        end,
        desc = "Source Action",
        has = "codeAction",
      }
    }
    -- Rename the variable under your cursor
    --  Most Language Servers support renaming across files, etc.
    KeyMap._keys[#KeyMap._keys + 1] = { "<leader>rn", vim.lsp.buf.rename, desc = "Rename", has = "rename" }
  end
  return KeyMap._keys
end


function KeyMap.map(keys, func, desc, mode, buffer)
  if desc then
    desc = 'LSP: ' .. desc
  end
  vim.keymap.set(mode, keys, func, { noremap=true, silent=true, buffer = buffer, desc = desc })
end

function KeyMap.on_attach(client, buffer)
  local keymaps = KeyMap.get()
  for _, keys in pairs(keymaps) do
    KeyMap.map(keys[1],keys[2],keys.desc, keys.mode or "n", buffer)
  end
end

return KeyMap

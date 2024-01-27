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
      { "gd", function() require("telescope.builtin").lsp_definitions({ reuse_win = true }) end, desc = "Goto Definition", has = "definition" },
      { "gr", "<cmd>Telescope lsp_references<cr>", desc = "References" },
      { "gD", vim.lsp.buf.declaration, desc = "Goto Declaration" },
      { "gI", function() require("telescope.builtin").lsp_implementations({ reuse_win = true }) end, desc = "Goto Implementation" },
      { "gy", function() require("telescope.builtin").lsp_type_definitions({ reuse_win = true }) end, desc = "Goto T[y]pe Definition" },
      { "K", vim.lsp.buf.hover, desc = "Hover Documentation" },
      { "gK", vim.lsp.buf.signature_help, desc = "Signature Help", has = "signatureHelp" },
      { "]d", KeyMap.diagnostic_goto(true), desc = "Next Diagnostic" },
      { "[d", KeyMap.diagnostic_goto(false), desc = "Prev Diagnostic" },
      { "]e", KeyMap.diagnostic_goto(true, "ERROR"), desc = "Next Error" },
      { "[e", KeyMap.diagnostic_goto(false, "ERROR"), desc = "Prev Error" },
      { "]w", KeyMap.diagnostic_goto(true, "WARN"), desc = "Next Warning" },
      { "[w", KeyMap.diagnostic_goto(false, "WARN"), desc = "Prev Warning" },
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
    KeyMap._keys[#KeyMap._keys + 1] = { "<leader>cr", vim.lsp.buf.rename, desc = "Rename", has = "rename" }
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
local M = {}

function M.setup()
  local group = vim.api.nvim_create_augroup("joj_lsp_attach", { clear = true })

  vim.api.nvim_create_autocmd("LspAttach", {
    group = group,
    desc = "Configure LSP keymaps for the attached buffer",
    callback = function(event)
      local client = vim.lsp.get_client_by_id(event.data.client_id)
      local function map(mode, lhs, rhs, desc)
        vim.keymap.set(mode, lhs, rhs, {
          buf = event.buf,
          desc = desc,
          silent = true,
        })
      end

      map("n", "gd", vim.lsp.buf.definition, "Go to definition")
      map("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
      map("n", "gr", vim.lsp.buf.references, "References")
      map("n", "gi", vim.lsp.buf.implementation, "Go to implementation")
      map("n", "K", vim.lsp.buf.hover, "Hover")
      map("n", "<leader>rn", vim.lsp.buf.rename, "Rename symbol")
      map("n", "<leader>ca", vim.lsp.buf.code_action, "Code action")
      map("n", "[d", function()
        vim.diagnostic.jump({ count = -1 })
      end, "Previous diagnostic")
      map("n", "]d", function()
        vim.diagnostic.jump({ count = 1 })
      end, "Next diagnostic")
      map("n", "<leader>e", vim.diagnostic.open_float, "Line diagnostics")
      map("n", "<leader>f", function()
        vim.lsp.buf.format({ async = false })
      end, "Format")

      if client and client:supports_method("textDocument/inlayHint") then
        pcall(vim.lsp.inlay_hint.enable, true, { bufnr = event.buf })
      end
    end,
  })
end

return M

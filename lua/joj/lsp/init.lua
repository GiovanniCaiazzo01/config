local M = {}

function M.setup()
  local servers = require("joj.lsp.servers")
  local capabilities = require("cmp_nvim_lsp").default_capabilities()

  vim.lsp.config("*", {
    capabilities = capabilities,
  })

  for name, config in pairs(servers.configs) do
    vim.lsp.config(name, config)
  end

  require("mason-lspconfig").setup({
    ensure_installed = servers.ensure_installed,
    automatic_enable = true,
  })

  require("joj.lsp.keymaps").setup()

  vim.diagnostic.config({
    virtual_text = {
      spacing = 2,
      source = "if_many",
    },
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
    float = {
      border = "rounded",
      source = true,
    },
  })
end

return M

return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      {
        "mason-org/mason.nvim",
        cmd = { "Mason", "MasonInstall", "MasonUpdate", "MasonUninstall", "MasonLog" },
        opts = {
          ui = {
            border = "rounded",
          },
        },
      },
      "mason-org/mason-lspconfig.nvim",
    },
    config = function()
      require("joj.lsp").setup()
    end,
  },
}

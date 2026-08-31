return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    opts = {
      flavour = "mocha",
      integrations = {
        cmp = true,
        mason = true,
        telescope = { enabled = true },
      },
    },
    config = function(_, opts)
      require("catppuccin").setup(opts)

      _G.ColorMyPencils = function(color)
        vim.cmd.colorscheme(color or "catppuccin")
      end

      ColorMyPencils()
    end,
  },
}

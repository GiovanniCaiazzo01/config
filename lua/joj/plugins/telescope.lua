return {
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      defaults = {
        path_display = { "smart" },
        sorting_strategy = "ascending",
        layout_config = {
          prompt_position = "top",
        },
      },
    },
    keys = {
      {
        "<leader>ff",
        function()
          local builtin = require("telescope.builtin")
          local git_root = vim.fs.root(vim.uv.cwd(), ".git")

          if git_root then
            builtin.git_files({ cwd = git_root, show_untracked = true })
          else
            builtin.find_files()
          end
        end,
        desc = "Find project files",
      },
      {
        "<leader>ps",
        function()
          require("telescope.builtin").live_grep({
            additional_args = function()
              return {
                "--hidden",
                "--glob",
                "!**/.git/**",
                "--glob",
                "!**/.env*",
              }
            end,
          })
        end,
        desc = "Search project text",
      },
    },
  },
}

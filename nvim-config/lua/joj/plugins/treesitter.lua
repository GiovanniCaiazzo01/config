local parsers = {
  "c",
  "css",
  "glimmer_javascript",
  "html",
  "javascript",
  "json",
  "jsonc",
  "lua",
  "luadoc",
  "markdown",
  "markdown_inline",
  "query",
  "tsx",
  "typescript",
  "vim",
  "vimdoc",
}

return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      local treesitter = require("nvim-treesitter")
      treesitter.setup()

      if vim.fn.executable("tree-sitter") == 1 then
        treesitter.install(parsers)
      else
        vim.schedule(function()
          vim.notify_once(
            "Install tree-sitter-cli to let nvim-treesitter install missing parsers",
            vim.log.levels.WARN
          )
        end)
      end

      local group = vim.api.nvim_create_augroup("joj_treesitter", { clear = true })
      vim.api.nvim_create_autocmd("FileType", {
        group = group,
        desc = "Enable Treesitter highlighting when a parser is available",
        callback = function(event)
          pcall(vim.treesitter.start, event.buf)
        end,
      })
    end,
  },
}

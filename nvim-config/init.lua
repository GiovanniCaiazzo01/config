if vim.fn.has("nvim-0.12") ~= 1 then
  error("This configuration requires Neovim 0.12 or newer")
end

vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("joj.config.options")
require("joj.config.keymaps")
require("joj.config.autocmds")
require("joj.config.ascii").show()
require("joj.lazy")

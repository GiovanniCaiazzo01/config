local opt = vim.opt

-- Line numbers
opt.number = true
opt.relativenumber = true

-- Indentation
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smartindent = true

-- Search
opt.hlsearch = false
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true

-- Interface
opt.termguicolors = true
opt.scrolloff = 8
opt.signcolumn = "yes"
opt.colorcolumn = "120"
opt.breakindent = true
opt.smoothscroll = true

-- Editing behaviour
opt.undofile = true
opt.splitbelow = true
opt.splitright = true
opt.timeoutlen = 400
opt.updatetime = 50
opt.isfname:append("@-@")

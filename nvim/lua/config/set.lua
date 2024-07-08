vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

--tab space
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.laststatus = 2

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

--nvim ufo minimal config
vim.opt.foldcolumn = "0"
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true

-- vim.wo.cursorline = true
-- vim.opt.cursorline = true
-- vim.opt.cursorlineopt = "number"
vim.opt.cmdheight = 0

--disable mode status
vim.opt.showmode = false

if vim.fn.has("nvim-0.8") == 1 then
	vim.opt.cmdheight = 0
end

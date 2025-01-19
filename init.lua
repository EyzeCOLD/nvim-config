require("config.lazy")
require("mason").setup()
require("mason-lspconfig").setup()
require("lspconfig").clangd.setup {}
require("lspconfig").lua_ls.setup {}
require("tokyonight").setup({
	style = "moon",
	styles = {
		keywords = { italic = false },
	},
	-- Change the "hint" color to the "orange" color, and make the "error" color bright red
	on_colors = function(colors)
	colors.hint = colors.orange
	colors.error = "#ff0000"
	end
})
require("nvim-function-linecount")
--------------------------------------------------------------------------------
vim.cmd[[colorscheme tokyonight-moon]]
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.wo.number = true
vim.opt.colorcolumn = "81"
vim.cmd("highlight ColorColumn ctermbg=0 guibg=#ff0000")
vim.keymap.set('n', '<Up>', '<C-w>k', {silent = true})
vim.keymap.set('n', '<Down>', '<C-w>j', {silent = true})
vim.keymap.set('n', '<Left>', '<C-w>h', {silent = true})
vim.keymap.set('n', '<Right>', '<C-w>l', {silent = true})
vim.keymap.set('n', '<C-Left>', '<cmd>:tabprev<CR>', {silent = true})
vim.keymap.set('n', '<C-Right>', '<cmd>:tabnext<CR>', {silent = true})
vim.keymap.set('n', '``', '<cmd>:Neotree toggle=true<CR>', {silent = true})

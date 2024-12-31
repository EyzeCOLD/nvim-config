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
vim.keymap.set('n', '<F7>', '<CMD> tabp <CR>', {silent = true})
vim.keymap.set('n', '<F8>', '<CMD> tabn <CR>', {silent = true})
vim.keymap.set('i', '<F7>', '<ESC> <CMD> tabp <CR>', {silent = true})
vim.keymap.set('i', '<F8>', '<ESC> <CMD> tabn <CR>', {silent = true})

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
require("autoclose").setup()
------------------------------------------------------------------------------
vim.cmd[[colorscheme tokyonight-moon]]

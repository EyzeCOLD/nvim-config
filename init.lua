require("config.lazy")
require("mason").setup({
	ensure_installed = {
		"black",
		"prettier",
	},
	automatic_installation = true,
})
require("mason-lspconfig").setup({
	ensure_installed = {
		"clangd",
		"cmake",
		"gopls",
		"lua_ls",
		"stylua",
		"ty",
		"ts_ls",
	},
})
require("tokyonight").setup({
	style = "moon",
	styles = {
		keywords = { italic = false },
	},
	-- Change the "hint" color to the "orange" color, and make the "error" color
	-- bright red
	on_colors = function(colors)
		colors.hint = colors.orange
		colors.error = "#ff0000"
	end,
})

---@diagnostic disable:undefined-global
vim.cmd([[colorscheme tokyonight-moon]])

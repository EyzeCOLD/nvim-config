return {
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	config = function()
		local mason_ti = require("mason-tool-installer")

		mason_ti.setup({
			ensure_installed = {
				"black",
				"clangd",
				"cmake",
				"gopls",
				"lua_ls",
				"stylua",
				"prettier",
				"ty",
				"ts_ls",
			},
		})
	end,
}

return {
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	config = function()
		local mason_ti = require("mason-tool-installer")

		mason_ti.setup({
			ensure_installed = {
				"black",
				"clangd",
				"gopls",
				"lua_ls",
				"stylua",
				"eslint_d",
				"prettier",
				"ty",
				"ts_ls",
				"js-debug-adapter",
			},
		})
	end,
}

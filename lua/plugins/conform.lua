return {
	"stevearc/conform.nvim",
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				c = { "clang-format" },
				cpp = { "clang-format" },
				javascript = { "eslint_d" },
				javascriptreact = { "eslint_d" },
				typescript = { "eslint_d" },
				typescriptreact = { "eslint_d" },
				css = { "prettier" },
				json = { "prettier" },
				lua = { "stylua" },
				python = { "black" },
				go = { "gofmt" },
			},
		})
	end,

	opts = {},
}

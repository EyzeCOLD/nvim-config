return {
	"stevearc/conform.nvim",
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				c = { "clang-format" },
				cpp = { "clang-format" },
				javascript = { "prettier" },
				javascriptreact = { "prettier" },
				typescript = { "prettier" },
				typescriptreact = { "prettier" },
				css = { "prettier" },
				lua = { "stylua" },
				python = { "black" },
				go = { "gofmt" },
			},
		})
	end,

	opts = {},
}

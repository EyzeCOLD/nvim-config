return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	opts = {
		style = "storm",
		styles = { keywords = { italic = false } },
		on_colors = function(colors)
			colors.hint = colors.orange
			colors.error = "#ff0000"
		end,

		on_highlights = function(hl, c)
			-- Better contrast for line numbers
			hl.LineNr = { fg = c.comment, bg = hl.ColorColumn.bg }
			hl.LineNrAbove = { fg = c.comment, bg = hl.ColorColumn.bg }
			hl.LineNrBelow = { fg = c.comment, bg = hl.ColorColumn.bg }
			hl.CursorLineNr = { fg = c.comment, bg = hl.ColorColumn.bg }
			hl.SignColumn = { bg = hl.ColorColumn.bg }
			hl.FoldColumn = { bg = hl.ColorColumn.bg }
			hl.CursorLineFold = { bg = hl.ColorColumn.bg }
			-- Better contrast for Unnecessary
			-- hl.DiagnosticUnnecessary = { fg = c.comment, italic = false }
		end,
	},
	config = function(_, opts)
		---@diagnostic disable:undefined-global
		require("tokyonight").setup(opts)
		vim.cmd.colorscheme("tokyonight")
	end,
}

require("config.lazy")
require("mason").setup({})
require("mason-lspconfig").setup({})
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

	-- Increase contrast for line numbers
	on_highlights = function(hl, c)
		hl.LineNr = { fg = c.comment, bg = hl.ColorColumn.bg }
		hl.LineNrAbove = { fg = c.comment, bg = hl.ColorColumn.bg }
		hl.LineNrBelow = { fg = c.comment, bg = hl.ColorColumn.bg }
		hl.CursorLineNr = { fg = c.comment, bg = hl.ColorColumn.bg }
		hl.SignColumn = { bg = hl.ColorColumn.bg }
		hl.FoldColumn = { bg = hl.ColorColumn.bg }
		hl.CursorLineFold = { bg = hl.ColorColumn.bg }
	end,
})

---@diagnostic disable:undefined-global
vim.cmd([[colorscheme tokyonight-storm]])

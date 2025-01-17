return
{
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},
	{
		"Diogo-ss/42-header.nvim",
		cmd = { "Stdheader" },
		keys = { "<F1>" },
		opts = {
			default_map = true, -- Default mapping <F1> in normal mode.
			auto_update = true, -- Update header when saving.
			user = "juaho", -- Your user.
			mail = "juaho@student.hive.fi", -- Your mail.
    -- add other options.
		},
		config = function(_, opts)
		require("42header").setup(opts)
		end,
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
		  "nvim-lua/plenary.nvim",
		  "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		  "MunifTanjim/nui.nvim",
		  -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
		}
	},
	{
		"EyzeCOLD/nvim-function-linecount",
	}
}

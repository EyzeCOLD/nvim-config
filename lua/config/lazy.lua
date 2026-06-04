---@diagnostic disable:undefined-global

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--branch=stable",
		lazyrepo,
		lazypath,
	})
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = "\\"
vim.g.maplocalleader = ","
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.relativenumber = true
vim.o.number = true
vim.o.colorcolumn = "81"
vim.o.termguicolors = true
vim.diagnostic.config({ virtual_text = true })
vim.keymap.set(
	"n",
	"<Up>",
	"<C-w>k",
	{ desc = "Move to split above", silent = true }
)
vim.keymap.set(
	"n",
	"<Down>",
	"<C-w>j",
	{ desc = "Move to split below", silent = true }
)
vim.keymap.set(
	"n",
	"<Left>",
	"<C-w>h",
	{ desc = "Move to split to the left", silent = true }
)
vim.keymap.set(
	"n",
	"<Right>",
	"<C-w>l",
	{ desc = "Move to split to the right", silent = true }
)
vim.keymap.set(
	"n",
	"<C-Left>",
	"<cmd>:tabprev<CR>",
	{ desc = "Previous tab", silent = true }
)
vim.keymap.set(
	"n",
	"<C-Right>",
	"<cmd>:tabnext<CR>",
	{ desc = "Next tab", silent = true }
)
vim.keymap.set(
	"n",
	"<Leader>`",
	"<cmd>:Neotree toggle=true reveal=true<CR>",
	{ desc = "Toggle Neotree", silent = true }
)
vim.keymap.set(
	"n",
	"<Leader>e",
	"<cmd>lua vim.diagnostic.open_float()<CR>",
	{ desc = "Open diagnostic messages in a pop-up", silent = true }
)
vim.keymap.set(
	"n",
	"<Leader>q",
	"<cmd>lua vim.diagnostic.setqflist()<CR>",
	{ desc = "Open diagnostic messages to quickfix list", silent = true }
)
vim.keymap.set(
	"n",
	"<Leader>r",
	"<cmd>set relativenumber!<CR>",
	{ desc = "Toggle relative line numbers", silent = true }
)
vim.keymap.set(
	{ "n", "v" },
	"<Leader>p",
	'"0p',
	{ desc = "Paste from zero register", silent = true }
)

-- Setup lazy.nvim
require("lazy").setup({
	spec = {
		-- import your plugins
		{ import = "plugins" },
	},
	-- Configure any other settings here. See the documentation for more details.
	-- colorscheme that will be used when installing plugins.
	install = { colorscheme = { "habamax" } },
	-- automatically check for plugin updates
	checker = { enabled = true },
})

local builtin = require("telescope.builtin")
vim.keymap.set(
	"n",
	"<leader>ff",
	builtin.find_files,
	{ desc = "Telescope find files" }
)
vim.keymap.set(
	"n",
	"<leader>fg",
	builtin.live_grep,
	{ desc = "Telescope live grep" }
)
vim.keymap.set(
	"n",
	"<leader>fb",
	builtin.buffers,
	{ desc = "Telescope buffers" }
)
vim.keymap.set(
	"n",
	"<leader>fh",
	builtin.help_tags,
	{ desc = "Telescope help tags" }
)
vim.keymap.set(
	"n",
	"<leader>fd",
	builtin.lsp_definitions,
	{ desc = "Goto definition" }
)
vim.keymap.set(
	"n",
	"<leader>ft",
	builtin.lsp_type_definitions,
	{ desc = "Goto type definition" }
)
vim.keymap.set(
	"n",
	"<leader>fi",
	builtin.lsp_implementations,
	{ desc = "Goto implementation" }
)

require("bufferline").setup({})
vim.keymap.set(
	"n",
	"<leader>v",
	"<cmd>BufferLineCyclePrev<CR>",
	{ desc = "Previous buffer", silent = true }
)
vim.keymap.set(
	"n",
	"<leader>b",
	"<cmd>BufferLineCycleNext<CR>",
	{ desc = "Next buffer", silent = true }
)

-- Autoformatting on write with Conform
vim.api.nvim_create_autocmd("BufWritePre", {
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})

-- Quickfix List
vim.keymap.set(
	"n",
	"<leader>co",
	"<cmd>copen<CR>",
	{ desc = "Quickfix open", silent = true }
)
vim.keymap.set(
	"n",
	"<leader>cc",
	"<cmd>cclose<CR>",
	{ desc = "Quickfix close", silent = true }
)
vim.keymap.set(
	"n",
	"]c",
	"<cmd>cnext<CR>",
	{ desc = "Quickfix next", silent = true }
)
vim.keymap.set(
	"n",
	"[c",
	"<cmd>cprev<CR>",
	{ desc = "Quickfix prev", silent = true }
)

vim.keymap.set("n", "<leader>cd", function()
	vim.ui.input({ prompt = "Quickfix do: " }, function(cmd)
		if cmd ~= nil then
			vim.cmd("cdo " .. cmd)
		end
	end)
end, { desc = "Quickfix do", silent = true })

vim.keymap.set("n", "<leader>cfd", function()
	vim.ui.input({ prompt = "Quickfix do per file: " }, function(cmd)
		if cmd ~= nil then
			vim.cmd("cfdo " .. cmd)
		end
	end)
end, { desc = "Quickfix do per file", silent = true })

vim.keymap.set("n", "<leader>m", function()
	vim.ui.input({ prompt = "Make args: " }, function(args)
		if args ~= nil then
			vim.cmd("make " .. args)
		end
	end)
end, { desc = "Run make with args", silent = true })

vim.keymap.set("n", "<leader>sh", function()
	vim.ui.input({ prompt = "Run shell command: " }, function(cmd)
		if cmd ~= nil then
			local output = vim.fn.system(cmd .. " 2>&1")
			vim.fn.setqflist({}, " ", { lines = vim.split(output, "\n") })
			vim.cmd("copen")
		end
	end)
end, { desc = "Run shell command", silent = true })

vim.keymap.set("n", "<leader>s", function()
	local word = vim.fn.expand("<cword>")
	vim.fn.setreg("/", "\\<" .. word .. "\\>")
	vim.opt.hlsearch = true
end, { desc = "Search current word without jump", silent = true })

vim.keymap.set("v", "<leader>s", function()
	vim.cmd('normal! "9y')
	local selection = vim.fn.getreg("9")
	vim.fn.setreg("/", "\\V" .. vim.fn.escape(selection, "\\"))
	vim.opt.hlsearch = true
end, { desc = "Search current word without jump", silent = true })

vim.filetype.add({
	extension = {
		asm = "nasm",
		inc = "nasm",
	},
})

require("diffrev")

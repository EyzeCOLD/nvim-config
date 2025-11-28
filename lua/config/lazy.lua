-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
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
vim.diagnostic.config({ virtual_text = true })
vim.keymap.set('n', '<Up>', '<C-w>k', {silent = true})
vim.keymap.set('n', '<Down>', '<C-w>j', {silent = true})
vim.keymap.set('n', '<Left>', '<C-w>h', {silent = true})
vim.keymap.set('n', '<Right>', '<C-w>l', {silent = true})
vim.keymap.set('n', '<C-Left>', '<cmd>:tabprev<CR>', {silent = true})
vim.keymap.set('n', '<C-Right>', '<cmd>:tabnext<CR>', {silent = true})
vim.keymap.set('n', '``', '<cmd>:Neotree toggle=true reveal=true<CR>', {silent = true})
vim.keymap.set('n', '<Leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', {silent = true})
vim.keymap.set('n', '<Leader>r', '<cmd>set relativenumber!<CR>', {silent = true})
vim.keymap.set('n', '<Leader>p', '"0p', {silent = true})

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

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
vim.keymap.set('n', '<leader>fd', builtin.lsp_definitions, { desc = 'Goto definition' })
vim.keymap.set('n', '<leader>ft', builtin.lsp_type_definitions, { desc = 'Goto type definition' })
vim.keymap.set('n', '<leader>fi', builtin.lsp_implementations, { desc = 'Goto implementation' })

-- Formatting on write
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = { "*.c", "*.cpp", "*.h", "*.hpp" },
    callback = function()
        vim.lsp.buf.format({ async = false })
    end,
})


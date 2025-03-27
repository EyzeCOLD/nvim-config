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
vim.keymap.set('n', '<Up>', '<C-w>k', {silent = true})
vim.keymap.set('n', '<Down>', '<C-w>j', {silent = true})
vim.keymap.set('n', '<Left>', '<C-w>h', {silent = true})
vim.keymap.set('n', '<Right>', '<C-w>l', {silent = true})
vim.keymap.set('n', '<C-Left>', '<cmd>:tabprev<CR>', {silent = true})
vim.keymap.set('n', '<C-Right>', '<cmd>:tabnext<CR>', {silent = true})
vim.keymap.set('n', '``', '<cmd>:Neotree toggle=true reveal=true<CR>', {silent = true})
vim.keymap.set('n', '<Leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', {silent = true})
vim.keymap.set('n', '<Leader>r', '<cmd>set relativenumber!<CR>', {silent = true})

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

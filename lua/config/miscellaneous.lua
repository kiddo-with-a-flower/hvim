-- Line numbers
vim.o.number = true          -- Enable absolute line numbers
vim.o.relativenumber = true  -- Enable relative line numbers

-- Tabs
vim.o.tabstop = 4        -- Number of spaces that a <Tab> counts for
vim.o.shiftwidth = 4     -- Number of spaces to use for each step of (auto)indent
vim.o.expandtab = true   -- Use spaces instead of tabs

-- Persistent undo history
vim.opt.undofile = true
vim.opt.undodir = os.getenv("HOME") .. "/.local/var/nvim/undo"
vim.opt.undolevels = 1000
vim.opt.undoreload = 10000
--
-- Enable spell checking
vim.opt.spell = true                     -- Turn on spell checking
vim.opt.spelllang = { 'en_us', 'it' } -- Set the spell checking language (English US)

hvim = {
    mlang = {
        server = os.getenv("HOME") .. ".local/share/octave-ls/server.js"
    }
}

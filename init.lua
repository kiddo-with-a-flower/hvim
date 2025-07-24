vim.o.number = true          -- Enable absolute line numbers
vim.o.relativenumber = true  -- Enable relative line numbers
vim.o.tabstop = 3        -- Number of spaces that a <Tab> counts for
vim.o.shiftwidth = 3     -- Number of spaces to use for each step of (auto)indent
vim.o.expandtab = true   -- Use spaces instead of tabs

require("config.mappings")
require("config.lazy")

-- LSP Keymaps with Telescope integration
local function setup_lsp_keymaps(bufnr)
  local opts = { buffer = bufnr, silent = true, noremap = true }
  
  -- Navigation (using Telescope)
  vim.keymap.set('n', 'gd', function() require('telescope.builtin').lsp_definitions() end, 
    vim.tbl_extend('force', opts, { desc = 'Go to definition' }))
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, 
    vim.tbl_extend('force', opts, { desc = 'Go to declaration' }))
  vim.keymap.set('n', 'gi', function() require('telescope.builtin').lsp_implementations() end, 
    vim.tbl_extend('force', opts, { desc = 'Go to implementation' }))
  vim.keymap.set('n', 'gt', function() require('telescope.builtin').lsp_type_definitions() end, 
    vim.tbl_extend('force', opts, { desc = 'Go to type definition' }))
  vim.keymap.set('n', 'gr', function() require('telescope.builtin').lsp_references() end, 
    vim.tbl_extend('force', opts, { desc = 'Show references' }))
  
  -- Information
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, 
    vim.tbl_extend('force', opts, { desc = 'Hover documentation' }))
  vim.keymap.set('n', '<leader>ls', vim.lsp.buf.signature_help, 
    vim.tbl_extend('force', opts, { desc = 'Signature help' }))
  vim.keymap.set('i', '<leader>ls', vim.lsp.buf.signature_help, 
    vim.tbl_extend('force', opts, { desc = 'Signature help' }))
  
  -- Code actions
  vim.keymap.set('n', '<leader>lc', vim.lsp.buf.code_action, 
    vim.tbl_extend('force', opts, { desc = 'Code action' }))
  vim.keymap.set('n', '<leader>lr', vim.lsp.buf.rename, 
    vim.tbl_extend('force', opts, { desc = 'Rename symbol' }))
  
  -- Formatting
  vim.keymap.set('n', '<leader>lf', function()
    vim.lsp.buf.format({ async = true })
  end, vim.tbl_extend('force', opts, { desc = 'Format buffer' }))
  
  -- Symbols
  vim.keymap.set('n', '<leader>ld', function() require('telescope.builtin').lsp_document_symbols() end, 
    vim.tbl_extend('force', opts, { desc = 'Document symbols' }))
  vim.keymap.set('n', '<leader>lw', function() require('telescope.builtin').lsp_workspace_symbols() end, 
    vim.tbl_extend('force', opts, { desc = 'Workspace symbols' }))
  
  -- Diagnostics with granular navigation
  vim.keymap.set('n', '<leader>le', vim.diagnostic.open_float, 
    vim.tbl_extend('force', opts, { desc = 'Show line diagnostics' }))
  vim.keymap.set('n', '<leader>lq', vim.diagnostic.setloclist, 
    vim.tbl_extend('force', opts, { desc = 'Add diagnostics to location list' }))
  
  -- Basic diagnostic navigation
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next, 
    vim.tbl_extend('force', opts, { desc = 'Next diagnostic' }))
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, 
    vim.tbl_extend('force', opts, { desc = 'Previous diagnostic' }))
  
  -- Error-only navigation
  vim.keymap.set('n', ']e', function() vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR }) end, 
    vim.tbl_extend('force', opts, { desc = 'Next error' }))
  vim.keymap.set('n', '[e', function() vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR }) end, 
    vim.tbl_extend('force', opts, { desc = 'Previous error' }))
  
  -- Warning-only navigation
  vim.keymap.set('n', ']w', function() vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.WARN }) end, 
    vim.tbl_extend('force', opts, { desc = 'Next warning' }))
  vim.keymap.set('n', '[w', function() vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.WARN }) end, 
    vim.tbl_extend('force', opts, { desc = 'Previous warning' }))
  
  -- Telescope diagnostics
  vim.keymap.set('n', '<leader>lt', function() require('telescope.builtin').diagnostics() end, 
    vim.tbl_extend('force', opts, { desc = 'Telescope diagnostics' }))
end

-- Attach keymaps when LSP client attaches to buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    setup_lsp_keymaps(ev.buf)
  end,
})

return {
   {
      "neovim/nvim-lspconfig",
      tag = "v2.3.0",
      event = "BufEnter",
      opts = {
          mlang = {
              name = "mlang",
              cmd = { "node", hvim.mlang.server, "--stdio" },
              filetypes = { "matlab", "octave", "m" },
              root_dir = function()
                  return vim.fn.getcwd()
                  end,
              settings = {
                  settings = {
                      maxNumberOfProblems = 1000,
                  },
              },
          },
      },
      lazy = false,
      dependencies = {
         -- main one
         { "ms-jpq/coq_nvim", branch = "coq" },

         -- 9000+ Snippets
         { "ms-jpq/coq.artifacts", branch = "artifacts" },

         -- lua & third party sources -- See https://github.com/ms-jpq/coq.thirdparty
         -- Need to **configure separately**
         { 'ms-jpq/coq.thirdparty', branch = "3p" }
         -- - shell repl
         -- - nvim lua api
         -- - scientific calculator
         -- - comment banner
         -- - etc
      },
      init = function()
         vim.g.coq_settings = {
            -- if you want to start COQ at startup
            auto_start = true,
            display = {
               statusline = {
                  helo = false
               }
            }
         }
      end,
      config = function(_,opts)
          vim.lsp.enable("clangd")
          vim.lsp.config['mlang'] = opts.mlang;
          vim.lsp.enable('mlang')
      end,
   },
   {
      'numToStr/Comment.nvim',
      opts = {
      },
      keys = {
         {'gcc', desc = "Toggle single line comment"},
         {'gbc', desc = "Toggle block comment"},
      },
   }
}

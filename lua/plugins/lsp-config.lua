return {
   {
      "neovim/nvim-lspconfig",
      tag = "v2.3.0",
      event = "BufEnter",
      opts = {},
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
      end,
   }
}

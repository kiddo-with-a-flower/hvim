return {
   {
      'zbirenbaum/copilot.lua',
      opts = {
         panel = {
            enabled = false
         },
         suggestion = {
            enabled = false
         },
         auth_provider_url = 'https://eltgroup.ghe.com'
      }
   },
   {
      -- Original plugin
      -- 'olimorris/codecompanion.nvim',

      -- Modded plugin with adapter for GitHub Copilot Enterprise
      'dyamon/codecompanion.nvim',
      branch = 'feat-copilot-enterprise',
      opts = {
         prompt_library = require'plugins.copilot.prompts',
         adapters = {
            copilot_enterprise = function()
               return require("codecompanion.adapters").extend("copilot_enterprise", {
                  opts = {
                  provider_url = "eltgroup.ghe.com",
               },
            })
            end,
         },
         strategies = {
            chat = {
               adapter = {
                  name = "copilot_enterprise",
                  model = "claude-sonnet-4",
               },
            },
            inline = {
               adapter = "copilot_enterprise",
            },
            cmd = {
               adapter = "copilot_enterprise",
            }
         },
         display = {
            chat = {
               window = {
                  layout = 'float',
                  border = 'double',
               }
            },
         },
      },
      keys = {
        { "<leader>cca", "<cmd>CodeCompanionActions<cr>", desc = "List CodeCompanion actions" },
        { "<leader>cct", "<cmd>CodeCompanionChat toggle<cr>", desc = "CodeCompanion chat" },
      },
      dependencies = {
         'nvim-lua/plenary.nvim',
         'nvim-treesitter/nvim-treesitter',
      },
   }
}

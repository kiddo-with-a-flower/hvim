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
         memory = {
           opts = {
             chat = {
               enabled = true,
             },
           },
         },
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
               adapter = {
                  name = "copilot_enterprise",
                  model = "claude-sonnet-4",
               },
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
                  width = 0.8,
                  height = 0.7,
               }
            },
         },
         extensions = {
           mcphub = {
             callback = "mcphub.extensions.codecompanion",
             opts = {
               -- MCP Tools 
               make_tools = true,              -- Make individual tools (@server__tool) and server groups (@server) from MCP servers
               show_server_tools_in_chat = true, -- Show individual tools in chat completion (when make_tools=true)
               add_mcp_prefix_to_tool_names = false, -- Add mcp__ prefix (e.g `@mcp__github`, `@mcp__neovim__list_issues`)
               show_result_in_chat = true,      -- Show tool results directly in chat buffer
               format_tool = nil,               -- function(tool_name:string, tool: CodeCompanion.Agent.Tool) : string Function to format tool names to show in the chat buffer
               -- MCP Resources
               make_vars = true,                -- Convert MCP resources to #variables for prompts
               -- MCP Prompts 
               make_slash_commands = true,      -- Add MCP prompts as /slash commands
             }
           }
         }
      },
      keys = {
        -- Quick access with Ctrl+C prefix
         { "<C-c>c", "<cmd>CodeCompanionChat toggle<cr>", desc = "Toggle CodeCompanion chat" },
         { "<C-c>a", "<cmd>CodeCompanionActions<cr>", desc = "CodeCompanion actions" },
         { "<C-c>i", "<cmd>CodeCompanion<cr>", desc = "Inline CodeCompanion", mode = {"n", "v"} },
         { "<C-c>e", "<cmd>CodeCompanionCmd Explain<cr>", desc = "Explain code", mode = "v" },
         { "<C-c>f", "<cmd>CodeCompanionCmd Fix<cr>", desc = "Fix code", mode = "v" },
         { "<C-c>o", "<cmd>CodeCompanionCmd Optimize<cr>", desc = "Optimize code", mode = "v" },
         { "<C-c>d", "<cmd>CodeCompanionCmd Document<cr>", desc = "Document code", mode = "v" },
         { "<C-c>t", "<cmd>CodeCompanionCmd Tests<cr>", desc = "Generate tests", mode = "v" },
         { "<C-c>q", "<cmd>CodeCompanionCmd<cr>", desc = "Quick command" },
      },
      event = "BufEnter",
      dependencies = {
         'nvim-lua/plenary.nvim',
         'nvim-treesitter/nvim-treesitter',
      },
   },
   {
       "ravitemer/mcphub.nvim",
       dependencies = {
           "nvim-lua/plenary.nvim",
       },
       build = "bundled_build.lua",  -- Bundles `mcp-hub` binary along with the neovim plugin
       config = function()
           require("mcphub").setup({
               use_bundled_binary = true,  -- Use local `mcp-hub` binary
           })
       end,
   }
}

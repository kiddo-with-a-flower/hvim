return {
   {
      "allaman/emoji.nvim",
      version = "1.0.0", -- optionally pin to a tag
      ft = "markdown", -- adjust to your needs
      dependencies = {
        -- util for handling paths
        "nvim-lua/plenary.nvim",
        -- optional for nvim-cmp integration
        "hrsh7th/nvim-cmp",
        -- optional for telescope integration
        "nvim-telescope/telescope.nvim",
        -- optional for fzf-lua integration via vim.ui.select
        -- "ibhagwan/fzf-lua",
      },
      opts = {
        -- default is false, also needed for blink.cmp integration!
        -- enable_cmp_integration = true,
        -- is not vim.fn.stdpath("data") .. "/lazy/
        -- plugin_path = vim.fn.expand("$HOME/plugins/"),
      },
      keys = {
         {"<leader>se",
         function()
            local ts = require('telescope').load_extension('emoji')
            ts.emoji()
         end,
         desc = "Search Emoji"},
      }
   },
   {
      'edluffy/hologram.nvim',
      opts = {
         auto_display = true,
      }
   },
   {
      'MeanderingProgrammer/render-markdown.nvim',
      version = '8.7.0',
      opts = {
         completions = {
            coq = {
               enabled = true
            }
         },
      },
      dependencies = {
         'nvim-treesitter/nvim-treesitter',
         'nvim-tree/nvim-web-devicons'
      },
   },
   {
      "bngarren/checkmate.nvim",
      ft = "markdown", -- Lazy loads for Markdown files matching patterns in 'files'
      version = "~0.10.0", -- pins to minor 0.10.x
      lazy = false,
      opts = {
         -- Disable checkboxes render in order to use the ones from render-markdown
         todo_markers = {
            unchecked = "[ ]",
            checked = "[x]",
         },
         files = {
            "*.md",
         }
      },
   },
   {
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
         filetypes = {
           codecompanion = {
             prompt_for_file_name = false,
             template = "[Image]($FILE_PATH)",
             use_absolute_path = true,
           },
         },
      },
      keys = {
        { "<leader>p", "<cmd>PasteImage<cr>", desc = "Paste image from system clipboard" },
      },
   },
   {
      "potamides/pantran.nvim",
      opts = {
         default_engine = "google",
         engines = {
            google = {
               default_source = "it",
            }
         }
      },
      keys = {
         {"<leader>tt", "<cmd>Pantran<cr>", desc = "Open Translate"}
      }
   },
   {
      "richardbizik/nvim-toc",
      ft = "markdown", -- Lazy loads for Markdown files matching patterns in 'files'
      opts = {
      },
      keys = {
        { "<leader>mt", "<cmd>TOC<cr>", desc = "Creates an ordered MD list table of contents" },
        { "<leader>mtu", "<cmd>TOCList<cr>", desc = "Creates an unordered MD list table of contents" },
      },
   }
}

local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({})
    end,
  },
  {
   "williamboman/mason.nvim",
   opts = {
      ensure_installed = {
        -- lua stuff
        "lua-language-server",
        "stylua",

        -- web dev stuff
        "css-lsp",
        "html-lsp",
        "typescript-language-server",
        "deno",
        "prettier",

        -- terraform stuff
        "terraform-ls",

        -- c/cpp stuff
        "clangd",
        "clang-format",

        -- python stuff
        "pyright",
        "ruff",
        "mypy",
      },
    },
  },
  {
    'hrsh7th/nvim-cmp',
    opts = {
      sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "nvim_lua" },
        { name = "path" },
        { name = "copilot"}
      },
    },

    dependencies = {
      {
        "zbirenbaum/copilot-cmp",
        config = function()
          require("copilot_cmp").setup()
        end,
      },
    },
  },

  {
    'nanozuki/tabby.nvim',
    event = 'VimEnter',
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      require('custom.configs.tabby')
    end,
  },

  -- Tmux integration
  {
    "christoomey/vim-tmux-navigator",
    event='VeryLazy',
  },
  {
    'tmux-plugins/vim-tmux-focus-events',
    event='VeryLazy',
  },
  {
    "tpope/vim-surround",
    event="VeryLazy",
  },
  -- Git wrapper
  {
    "tpope/vim-fugitive",
    event="VeryLazy",
    config = function()
      -- fix issue of missing netrw disabled by telescope.vim
      -- reimplement :Browser command
      vim.api.nvim_create_user_command(
        'Browse',
        function (opts)
          vim.fn.system { 'open', opts.fargs[1] }
        end,
        { nargs = 1 }
      )
    end
  },
  {
    "tpope/vim-rails",
    event="VeryLazy",
  },
  {
    "tpope/vim-endwise",
    event="VeryLazy",
  },
  {
    "tpope/vim-rhubarb",
    event="VeryLazy",
  },
  -- :GBrowse bit bucket
  {
    "tommcdo/vim-fubitive",
    event="VeryLazy",
  },
  {
    "jackMort/ChatGPT.nvim",
    event = 'VeryLazy',
    config = function()
      require("chatgpt").setup()
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim"
    }
  },
  -- In order to modify the `lspconfig` configuration:
  {
    "neovim/nvim-lspconfig",
     config = function()
        require "plugins.configs.lspconfig"
        require "custom.configs.lspconfig"
     end,
  },


  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }
}

return plugins

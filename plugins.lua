local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {
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
    'codota/tabnine-nvim',
    event='VeryLazy',
    build = "./dl_binaries.sh",
    config = function()
      require('tabnine').setup({
        disable_auto_comment=true,
        accept_keymap="<Right>",
        dismiss_keymap = "<C-]>",
        debounce_ms = 800,
        suggestion_color = {gui = "#808080", cterm = 244},
        exclude_filetypes = {"TelescopePrompt", "NvimTree"},
        log_file_path = nil, -- absolute path to Tabnine log file
      })
      require('tabnine.status').status()
    end
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
        { name = "cmp_tabnine" },
      },
    },

    dependencies = {
      {
        "tzachar/cmp-tabnine",
        build = "./install.sh",
        config = function()
          local tabnine = require "cmp_tabnine.config"
          tabnine:setup {
            max_lines = 1000,
            max_num_results = 20,
            sort = true,
            run_on_every_keystroke = true,
            snippet_placeholder = '..',
            ignored_file_types = {
              -- default is not to ignore
              -- uncomment to ignore in lua:
              -- lua = true
            },
            show_prediction_strength = true
          } -- put your options here
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

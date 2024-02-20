local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {
  {
    'codota/tabnine-nvim',
    build = "./dl_binaries.sh",
    config = function()
      require('tabnine').setup({
        disable_auto_comment=true,
        accept_keymap="<Tab>",
        dismiss_keymap = "<C-]>",
        debounce_ms = 800,
        suggestion_color = {gui = "#808080", cterm = 244},
        exclude_filetypes = {"TelescopePrompt"},
        log_file_path = nil, -- absolute path to Tabnine log file
      })
    end
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

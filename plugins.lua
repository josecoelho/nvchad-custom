local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {

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

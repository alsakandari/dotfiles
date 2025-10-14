return {
  {
    "stevearc/conform.nvim",
    opts = require "configs.conform",
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    branch = "main",
    build = ":TSUpdate",
    opts = {
      sync_install = false,
    },
    config = function() end,
  },

  {
    "NvChad/base46",
    branch = "v3.0",
  },

  {
    "NvChad/ui",
    branch = "v3.0",
  },

  {
    "NvZone/timerly",
    cmd = "TimerlyToggle",
    dependencies = "NvZone/volt",
    opts = {
      position = "top-right",
    },
    keys = {
      { "<leader>tm", "<cmd>TimerlyToggle<cr>", desc = "toggle Timerly" },
    },
  },

  {
    "NMAC427/guess-indent.nvim",
    event = "BufEnter",
    opts = {},
  },

  {
    "nvim-tree/nvim-tree.lua",
    enabled = false,
  },
}

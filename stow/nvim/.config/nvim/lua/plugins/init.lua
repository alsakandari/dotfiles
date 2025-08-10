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
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "zig",
        "rust",
        "c",
      },
    },

    config = function()
      require "configs.treesitter"
    end,
  },

  {
    "NMAC427/guess-indent.nvim",
    event = "BufEnter",
    opts = {},
  },

  {
    "nvim-tree/nvim-tree.lua",
    enabled = false,
  }
}

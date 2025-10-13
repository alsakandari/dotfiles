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
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      autopairs = { enable = true },
      indent = { enable = true, disable = { "python", "css" } },
      refactor = {
        highlight_definitions = {
          enable = true,
          clear_on_cursor_move = true,
        },
        smart_rename = {
          enable = true,
          keymaps = {
            smart_rename = "grr",
          },
        },
      },
    },
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

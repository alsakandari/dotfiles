vim.g.base46_cache = vim.fn.stdpath "data" .. "/nvchad/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  { import = "plugins" },
  { import = "nvchad.blink.lazyspec" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "nvchad.autocmds"

vim.schedule(function()
  require "mappings"
end)

vim.api.nvim_create_autocmd("FileType", {
  callback = function()
    if vim.treesitter.get_parser(nil, nil, { error = false }) then
      vim.treesitter.start()
    end
  end,
})

vim.api.nvim_create_autocmd("User", {
  pattern = "TSUpdate",
  callback = function()
    require("nvim-treesitter.parsers").nur = {
      install_info = {
        path = "/home/yhya/Programming/tree-sitter-nur",
        files = { "src/parser.c" },
      },
    }

    require("nvim-treesitter.parsers").barq = {
      install_info = {
        path = "/home/yhya/Programming/tree-sitter-barq",
        files = { "src/parser.c" },
      },
    }
  end,
})

vim.treesitter.language.register("barq", { "bq" })
vim.treesitter.language.register("nur", { "nur" })

vim.filetype.add {
  extension = {
    bq = "barq",
    nur = "nur",
  },

  pattern = {
    [".*"] = {
      function(_, bufnr)
        local content = vim.api.nvim_buf_get_lines(bufnr, 0, 1, false)[1] or ""

        if vim.regex([[^#!/usr/bin/env -S nur run]]):match_str(content) ~= nil then
          return "nur"
        end
      end,
    },
  },
}

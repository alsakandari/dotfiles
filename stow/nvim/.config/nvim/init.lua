vim.o.number = true

vim.g.mapleader = " "

vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.smartindent = true
vim.o.smartcase = true
vim.o.smarttab = true
vim.o.expandtab = true

vim.keymap.set("i", "jk", "<esc>")

vim.keymap.set("n", "<esc>", "<cmd>noh<cr>")

vim.keymap.set({ "n", "v", "x" }, "<leader>p", '"+p<cr>')
vim.keymap.set({ "n", "v", "x" }, "<leader>y", '"+y<cr>')

vim.keymap.set("n", "<leader>q", "<cmd>q<cr>")
vim.keymap.set("n", "<leader>w", "<cmd>w<cr>")
vim.keymap.set("n", "<leader>s", "<cmd>so<cr>")

vim.keymap.set("n", "<leader>x", "<cmd>bdel<cr>")
vim.keymap.set("n", "<leader>h", "<cmd>bprev<cr>")
vim.keymap.set("n", "<leader>l", "<cmd>bnext<cr>")

vim.keymap.set("n", "<leader>fm", vim.lsp.buf.format)
vim.keymap.set("n", "<leader>re", vim.lsp.buf.rename)
vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition)
vim.keymap.set("n", "<leader>gD", vim.lsp.buf.declaration)

vim.keymap.set("n", "<leader>ff", "<cmd>Pick files<cr>")
vim.keymap.set("n", "<leader>fb", "<cmd>Pick buffers<cr>")
vim.keymap.set("n", "<leader>fh", "<cmd>Pick help<cr>")
vim.keymap.set("n", "<leader>fw", "<cmd>Pick grep_live<cr>")

vim.keymap.set("n", "<leader>fe", "<cmd>Oil<cr>")

vim.keymap.set("n", "<leader>t", "<cmd>term<cr>")
vim.keymap.set("t", "<C-x>", "<C-\\><C-N>")

vim.pack.add {
    { src = "https://github.com/nvim-tree/nvim-web-devicons" },
    { src = "https://github.com/folke/tokyonight.nvim" },
    { src = "https://github.com/neovim/nvim-lspconfig" },
    { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
    { src = "https://github.com/nmac427/guess-indent.nvim" },
    { src = "https://github.com/folke/lazydev.nvim" },
    { src = "https://github.com/saghen/blink.cmp",                version = "v1.8.0" },
    { src = "https://github.com/nvim-mini/mini.pick" },
    { src = "https://github.com/stevearc/oil.nvim" },
    { src = "https://github.com/nvim-lualine/lualine.nvim" },
    { src = "https://github.com/windwp/nvim-autopairs" },
}

vim.lsp.enable { "lua_ls", "html", "emmet_language_server", "cssls", "rust_analyzer", "ts_ls", "ccls", "ols", "verible", "tinymist", "v_analyzer", "ocamllsp", "gopls" }

vim.diagnostic.config {
    severity_sort = true,
    virtual_text = false,
    virtual_lines = true,
}

vim.api.nvim_create_autocmd("FileType", {
    callback = function()
        if vim.treesitter.get_parser(nil, nil, { error = false }) then
            vim.treesitter.start()
        end
    end,
})

vim.api.nvim_create_autocmd("User", {
    pattern = { "TSUpdate" },

    callback = function()
        require("nvim-treesitter.parsers").nur = {
            install_info = {
                url = "https://github.com/alkhizanah/tree-sitter-nur",
                revision = "master",
                path = "/home/yhya/Programming/tree-sitter-nur",
                files = { "src/parser.c" },
            },

            tier = 2,
        }

        require("nvim-treesitter.parsers").barq = {
            install_info = {
                url = "https://github.com/alkhizanah/tree-sitter-barq",
                revision = "master",
                path = "/home/yhya/Programming/tree-sitter-barq",
                files = { "src/parser.c" },
            },

            tier = 2,
        }
    end,
})

vim.treesitter.language.register("barq", { "bq" })

vim.treesitter.language.register("nur", { "nur" })

vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

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

require("tokyonight").setup {
    style = "night",

    on_colors = function() end,

    on_highlights = function() end,
}

vim.cmd [[colorscheme tokyonight]]

require("blink.cmp").setup {
    sources = {
        default = { "lazydev", "lsp", "path", "snippets", "buffer" },
        providers = {
            lazydev = {
                name = "LazyDev",
                module = "lazydev.integrations.blink",
                score_offset = 100,
            },
        },
    },

    keymap = {
        preset = "enter",
    },
}

require("guess-indent").setup {}

require("lazydev").setup {}

require("mini.pick").setup {}

require("oil").setup {
    columns = {
        "size",
        "permissions",
        "icon",
    },
}

require("lualine").setup {
    options = {
        theme = "tokyonight",
        section_separators = { left = "", right = "" },
        component_separators = { left = "", right = "" },
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { 'filename' },
        lualine_x = {},
        lualine_y = {},
        lualine_z = { 'location' }
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {}
    },
}

require("nvim-autopairs").setup {}

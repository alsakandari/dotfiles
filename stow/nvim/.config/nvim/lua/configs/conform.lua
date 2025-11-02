local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    zig = { "zigfmt" },
    rust = { "rustfmt" },
    css = { "prettier" },
    html = { "prettier" },
    json = { "prettier" },
    javascript = { "prettier" },
    typescript = { "prettier" },
    javascriptreact = { "prettier" },
    typescriptreact = { "prettier" },
    python = { "black" },
    erlang = { "efmt" },
    odin = { "odinfmt" },
    systemverilog = { "verible" },
  },

  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },

  formatters = {
    verible = {
      command = "verible-verilog-format",
      args = { "-indentation_spaces", "4", "-" }
    }
  },
}

return options

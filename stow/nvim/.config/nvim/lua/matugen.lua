 local M = {}

function M.setup()
  require('base16-colorscheme').setup({
    base00 = '#1f2335',
    base01 = '#2c314a',
    base02 = '#343957',
    base03 = '#646b95',
    base04 = '#c0caf5',
    base05 = '#a9b1d6',
    base06 = '#a9b1d6',
    base07 = '#a9b1d6',
    base08 = '#f7768e',
    base09 = '#9cd58a',
    base0A = '#d7729f',
    base0B = '#7a88cf',
    base0C = '#aae996',
    base0D = '#96a3e9',
    base0E = '#e996bb',
    base0F = '#f4bed6',
  })

  local hi = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  -- telescope.nvim
  hi('TelescopeNormal',         { fg = '#a9b1d6',          bg = '#1f2335' })
  hi('TelescopeBorder',         { fg = '#646b95',             bg = '#1f2335' })
  hi('TelescopePromptNormal',   { fg = '#a9b1d6',          bg = '#1f2335' })
  hi('TelescopePromptBorder',   { fg = '#646b95',             bg = '#1f2335' })
  hi('TelescopePromptPrefix',   { fg = '#7a88cf',             bg = '#1f2335' })
  hi('TelescopePromptCounter',  { fg = '#c0caf5',  bg = '#1f2335' })
  hi('TelescopePromptTitle',    { fg = '#1f2335',             bg = '#7a88cf' })
  hi('TelescopePreviewTitle',   { fg = '#1f2335',             bg = '#d7729f' })
  hi('TelescopeResultsTitle',   { fg = '#1f2335',             bg = '#9cd58a' })
  hi('TelescopeSelection',      { fg = '#a9b1d6',          bg = '#343957' })
  hi('TelescopeSelectionCaret', { fg = '#7a88cf',             bg = '#343957' })
  hi('TelescopeMatching',       { fg = '#7a88cf',             bold = true })

  -- mini.pick
  hi('MiniPickNormal',         { fg = '#a9b1d6',          bg = '#1f2335' })
  hi('MiniPickBorder',         { fg = '#646b95',             bg = '#1f2335' })
  hi('MiniPickPrompt',   { fg = '#a9b1d6',          bg = '#1f2335' })
  hi('MiniPickPromptPrefix',   { fg = '#7a88cf',             bg = '#1f2335' })
  hi('MiniPickBorderText',    { fg = '#1f2335',             bg = '#7a88cf' })
  hi('MiniPickMatchCurrent',      { fg = '#a9b1d6',          bg = '#343957' })
  hi('MiniPickPromptCaret', { fg = '#7a88cf',             bg = '#343957' })
  hi('MiniPickMatchRanges',       { fg = '#7a88cf',             bold = true })
end

-- Register a signal handler for SIGUSR1 (matugen updates).
-- The handler re-requires this module, which re-runs the code below, so the
-- previous handle is stopped first; otherwise handlers double on every signal.
if _G.__matugen_signal then
  _G.__matugen_signal:stop()
  _G.__matugen_signal:close()
end

local signal = vim.uv.new_signal()
_G.__matugen_signal = signal
signal:start(
  'sigusr1',
  vim.schedule_wrap(function()
    package.loaded['matugen'] = nil
    require('matugen').setup()
  end)
)

return M

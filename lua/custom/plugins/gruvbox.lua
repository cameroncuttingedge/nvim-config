return {
  'ellisonleao/gruvbox.nvim',
  priority = 1000,
  config = function()
    require('gruvbox').setup {
      contrast = 'hard', -- or "medium" or "soft"
      overrides = {
        -- 🟡 Noice floating cmdline
        NoiceCmdlinePopup = { bg = '#282828', fg = '#ebdbb2' },
        NoiceCmdlinePopupBorder = { fg = '#fabd2f' },

        -- 🟢 LSP progress spinner or status
        NoiceLspProgressSpinner = { fg = '#b8bb26' },
        NoiceLspProgressTitle = { fg = '#fabd2f', bold = true },
        NoiceLspProgressClient = { fg = '#83a598' },

        -- 🔵 Popup menus
        NoicePopupmenu = { bg = '#1d2021', fg = '#ebdbb2' },
        NoicePopupmenuSelected = { bg = '#3c3836', fg = '#fabd2f' },

        -- 🔲 Borders for everything
        NoicePopup = { bg = '#1d2021', fg = '#ebdbb2' },
        NoicePopupBorder = { fg = '#fabd2f' },
      },
    }
    vim.cmd 'colorscheme gruvbox'
  end,
}

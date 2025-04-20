return {
  { -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help ibl`
    main = 'ibl',
    opts = {
      enabled = false,
    },
    config = function()
      vim.api.nvim_set_keymap('n', '<F7>', ':IBLToggle<CR>', { noremap = true, silent = true })
    end,
  },
}

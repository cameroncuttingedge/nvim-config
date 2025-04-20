return {
  'ruifm/gitlinker.nvim',
  requires = 'nvim-lua/plenary.nvim',
  config = function()
    vim.api.nvim_set_keymap(
      'n',
      '<leader>gl',
      '<cmd>lua require"gitlinker".get_buf_range_url(\'n\', {action_callback = require"gitlinker.actions".open_in_browser})<CR>',
      { silent = true }
    )
  end,
}

return {
  'akinsho/toggleterm.nvim',
  version = '*',
  config = function()
    require('toggleterm').setup {
      open_mapping = [[<C-\>]],
      direction = 'float',
      float_opts = {
        border = 'curved',
        width = function()
          return math.floor(vim.o.columns * 0.85)
        end,
        height = function()
          return math.floor(vim.o.lines * 0.7)
        end,
      },
      shade_terminals = true,
    }

    -- Enable auto-read for external file changes
    vim.opt.autoread = true

    -- Run :checktime when ToggleTerm is hidden or closed
    vim.api.nvim_create_autocmd({ 'BufLeave', 'TermLeave', 'TermClose' }, {
      pattern = 'term://*toggleterm#*',
      callback = function()
        vim.cmd 'checktime'
      end,
    })
  end,
}

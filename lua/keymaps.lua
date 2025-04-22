-- ~/.config/nvim/lua/keymaps.lua
local M = {}

function M.setup()
  local map = vim.keymap.set
  local opts = { noremap = true, silent = true }

  -- Example keymaps
  map('n', '<C-d>', '<C-d>zz', opts)
  map('n', '<C-u>', '<C-u>zz', opts)
  map('n', '<leader>y', function()
    local Terminal = require('toggleterm.terminal').Terminal
    local yazi = Terminal:new {
      cmd = 'yazi',
      direction = 'float',
      float_opts = {
        border = 'double',
        width = 100,
        height = 30,
      },
      hidden = true,
    }
    yazi:toggle()
  end, { desc = 'Open Yazi file manager' })
end

return M

-- ~/.config/nvim/lua/keymaps.lua
local M = {}

function M.setup()
  local map = vim.keymap.set
  local opts = { noremap = true, silent = true }

  -- Example keymaps
  map('n', '<C-d>', '<C-d>zz', opts)
  map('n', '<C-u>', '<C-u>zz', opts)
  map('i', 'jj', '<Esc>', { noremap = false })
  map('i', 'jk', '<Esc>', { noremap = false })
  -- go to pr
  map('n', '<leader>gpr', function()
    local branch = vim.fn.system('git rev-parse --abbrev-ref HEAD'):gsub('%s+', '')
    local pr_exists = vim.fn.system('gh pr view ' .. branch .. ' --json number --jq .number')
    if pr_exists ~= '' then
      vim.fn.system('gh pr view ' .. branch .. ' --web')
      require('noice').notify('Opening pull request for branch ' .. branch, 'info')
    else
      require('noice').notify('No pull request exists for branch ' .. branch, 'error')
    end
  end, { desc = 'Open pull request for current branch' })

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

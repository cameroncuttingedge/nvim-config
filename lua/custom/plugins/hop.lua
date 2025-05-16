return {
  'phaazon/hop.nvim',
  branch = 'v2', -- Make sure to use v2
  config = function()
    local hop = require 'hop'
    hop.setup()

    local directions = require('hop.hint').HintDirection

    -- Jump to word start using <leader>s
    vim.keymap.set('n', '<leader><leader>', function()
      hop.hint_words()
    end, { desc = 'Hop to word' })

    -- Optional: Jump to single character with f
    vim.keymap.set('n', 'f', function()
      hop.hint_char1 { direction = directions.AFTER_CURSOR, current_line_only = true }
    end, { remap = true, desc = 'Hop forward to char' })

    -- Optional: Jump back with F
    vim.keymap.set('n', 'F', function()
      hop.hint_char1 { direction = directions.BEFORE_CURSOR, current_line_only = true }
    end, { remap = true, desc = 'Hop backward to char' })
  end,
}

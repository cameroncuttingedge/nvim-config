return {
  'mbbill/undotree',
  config = function()
    -- Set the undo directory
    vim.o.undodir = vim.fn.expand '~/.local/share/nvim/undodir'
    vim.o.undofile = true

    -- Create the undo directory if it doesn’t exist
    if vim.fn.isdirectory(vim.o.undodir) == 0 then
      vim.fn.mkdir(vim.o.undodir, 'p')
    end

    -- Key mapping to toggle Undotree
    vim.api.nvim_set_keymap('n', '<F6>', ':UndotreeToggle<CR>', { noremap = true, silent = true })
  end,
}

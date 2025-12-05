return {
  'ThePrimeagen/git-worktree.nvim',
  dependencies = {
    'nvim-telescope/telescope.nvim',
  },
  config = function()
    local worktree = require 'git-worktree'

    -- Configure worktree for sibling directories
    -- e.g., ~/projects/myrepo worktrees go to ~/projects/myrepo-branchname
    worktree.setup {
      change_directory_command = 'cd',
      update_on_change = true,
      update_on_change_command = 'e .',
      clearjumps_on_change = true,
      autopush = false,
    }

    -- Load telescope extension
    require('telescope').load_extension 'git_worktree'

    -- Keybindings: <leader>w for worktree operations
    -- <leader>wl - List/switch worktrees (use <C-d> in picker to delete)
    -- <leader>wc - Create new worktree
    -- <leader>wd - Delete worktree (opens picker, select and confirm)
    vim.keymap.set('n', '<leader>wl', function()
      require('telescope').extensions.git_worktree.git_worktrees()
    end, { desc = '[W]orktree [L]ist/switch' })

    vim.keymap.set('n', '<leader>wc', function()
      require('telescope').extensions.git_worktree.create_git_worktree()
    end, { desc = '[W]orktree [C]reate' })

    vim.keymap.set('n', '<leader>wd', function()
      -- Opens worktree picker - select one and press <C-d> to delete
      require('telescope').extensions.git_worktree.git_worktrees()
      vim.notify('Select worktree and press <C-d> to delete', vim.log.levels.INFO)
    end, { desc = '[W]orktree [D]elete' })

    -- Hook for notifications on worktree operations
    worktree.on_tree_change(function(op, metadata)
      if op == worktree.Operations.Create then
        vim.notify('Created worktree: ' .. metadata.path, vim.log.levels.INFO)
      elseif op == worktree.Operations.Switch then
        vim.notify('Switched to: ' .. metadata.path, vim.log.levels.INFO)
      elseif op == worktree.Operations.Delete then
        vim.notify('Deleted worktree: ' .. metadata.prev_path, vim.log.levels.INFO)
      end
    end)
  end,
}

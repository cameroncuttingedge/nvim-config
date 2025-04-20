-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  'nvim-tree/nvim-tree.lua',
  requires = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('nvim-tree').setup {
      update_focused_file = {
        enable = true,
      },
      actions = {
        open_file = {
          quit_on_open = true, -- Close the tree when opening a file
        },
      },
    }
  end,
}

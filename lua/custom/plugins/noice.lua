return {
  'folke/noice.nvim',
  event = 'VeryLazy',
  opts = {
    notify = {
      enabled = true,
      view = 'mini', -- or "notify" or "popup"
      timeout = 1000, -- milliseconds (default is 5000)
    },
    -- add any options here
  },
  dependencies = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    'MunifTanjim/nui.nvim',
    -- OPTIONAL:
    --   `nvim-notify` is only needed, if you want to use the notification view.
    --   If not available, we use `mini` as the fallback
    'rcarriga/nvim-notify',
  },
}

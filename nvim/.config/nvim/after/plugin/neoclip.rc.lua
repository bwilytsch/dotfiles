local status, neoclip = pcall(require, 'neoclip')
if (not status) then return end

neoclip.setup({
  history = 100,
  enable_persistent_history = true,
  preview = true,
})


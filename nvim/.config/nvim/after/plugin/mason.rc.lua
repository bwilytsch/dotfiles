local status, mason = pcall(require, 'mason')
if (not status) then return end
local status_two, mason_lspconfig = pcall(require, 'mason-lspconfig')
if (not status_two) then return end

mason.setup({})

mason_lspconfig.setup ({
  ensure_installed = { "sumneko_lua", "tailwindcss" },
})

local status, mason = pcall(require, 'mason')
if (not status) then return end
local status_two, mason_lspconfig = pcall(require, 'mason-lspconfig')
if (not status_two) then return end

mason.setup({
    ui = {
        border = 'rounded',
        width = 0.5,
        height = 0.6,
    }
})

mason_lspconfig.setup ({
  ensure_installed = { 
        "sumneko_lua", 
        "tailwindcss", 
        "astro",
        "graphql",
        "tsserver",
        "taplo",
        "solidity",
        "rust_analyzer",
        "marksman",
        "html",
        "dockerls",
        "eslint"
    },
})

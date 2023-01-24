local status, saga = pcall(require, "lspsaga")
if not status then
    return
end

saga.setup({
    ui = {
        border = 'rounded',
        title = false, -- enable & disable title in the float window
        winblend = '0',
        colors = {
            normal_bg = '',
            -- black = '#FFFFFF', // Change this in the future
            -- title_bg = '', // Change this in the future
        },
        expand = '',
        collaspe = '',
        preview = '  ',
    },
    preview = {
        line_above = 10,
        line_below = 10,
    },
    request_timeout = 4000, -- increased for larger projects
    symbol_in_winbar = {
        enable = true,
        separator = '  ',
        hide_keyword = true,
        show_file = true,
        folder_level = 2,
    },
    outline = {
        win_position = 'right',
        win_with = '',
        win_width = 30,
        show_detail = true,
        auto_preview = true,
        auto_refresh = true,
        auto_close = true,
        custom_sort = nil,
        keys = {
            jump = 'o',
            expand_collaspe = 'u',
            quit = 'q',
        },
    },
})

local opts = { noremap = true, silent = true }

-- Exception
vim.keymap.set("n", "<C-j>", function()
    require("lspsaga.diagnostic"):goto_next({ severity = { min = vim.diagnostic.severity.WARN } })
end, opts)

local mapper = function(mode, keys, func, desc)
    if desc then
        desc = 'LSP: ' .. desc
    end

    vim.keymap.set(mode, keys, func, { desc = desc, silent = true, noremap = true })
end

local nmap = function(keys, func, desc)
    mapper('n', keys, func, desc)
end

local vmap = function(keys, func, desc)
    mapper('v', keys, func, desc)
end

-- Goto
nmap("gd", "<cmd>Lspsaga goto_definition<CR>", '[G]oto [D]efinition')
nmap("gr", "<cmd>Lspsaga rename<CR>", '[R]ename File')

-- Utils
nmap("gp", "<cmd>Lspsaga peek_definition<CR>", '[D]efinition [P]eek')
nmap("<leader>o", "<cmd>Lspsaga outline<CR>", 'Toggle [O]utline')
nmap('K', "<cmd>Lspsaga hover_doc<CR>", 'Hover Documentation')

-- Search
nmap("<leader>sf", "<cmd>Lspsaga lsp_finder<CR>", '[S]earch [F]iles')

-- Diagnostic
nmap("<leader>sl", "<cmd>Lspsaga show_line_diagnostic<CR>", '[S]how [L]ine Diagnostic')
nmap("<leader>sc", "<cmd>Lspsaga show_cursor_diagnostic<CR>", '[S]how [C]ursor Diagnostic')
nmap("<leader>sb", "<cmd>Lspsaga show_buf_diagnostic<CR>", '[S]how [C]ursor Diagnostic')

-- Actions
nmap('<leader>ca', "<cmd>Lspsaga code_action<CR>")
vmap('<leader>ca', "<cmd>Lspsaga range_code_action<CR>")

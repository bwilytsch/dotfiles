keymapper {}

local map = function(mode, keys, func, desc)
    if desc then
        desc = 'LSP: ' .. desc
    end

    vim.keymap.set(mode, keys, func, { desc = desc, silent = true, noremap = true })
end

function keymapper.nmap(keys, func, desc)
    mapper('n', keys, func, desc)
end

function keymapper.vmap(keys, func, desc)
    mapper('v', keys, func, desc)
end

return utils

lua << END
local actions = require('telescope.actions')
require('telescope').setup{
    defaults = {
        file_ignore_patterns = {
            ".git",
            "node_modules"
        },
        prompt_prefix = " > ",
        mappings = {
            i = {
                ["<C-k>"] = actions.move_selection_previous,
                ["<C-j>"] = actions.move_selection_next,
                ["<esc>"] = actions.close
            }
        }
    },
    pickers = {
        lsp_code_actions = {
            theme = "cursor"
        },
        code_action = {
            theme = "cursor"
        },
        lsp_workspace_diagnostics = {
            theme = "dropdown"
        }
    },
    extensions = {
        ["ui-select"] = {
            require("telescope.themes").get_cursor {
            -- even more opts
            }
        },
        gitmoji = {
            action = function(entry)
                -- entry = {
                --     display = "🎨 Improve structure / format of the code.",
                --     index = 1,
                --     ordinal = "Improve structure / format of the code.",
                --     value = "🎨"
                -- }
                vim.ui.input({ prompt = "Enter commit msg: " .. entry.value .. " "}, function(msg)
                    if not msg then
                        return
                    end
                    vim.cmd(':G commit -m "' .. entry.value .. ' ' .. msg .. '"')
                end)
            end,
        },
        live_grep_args = {
          auto_quoting = true, -- enable/disable auto-quoting
        },
    }
}
require("telescope").load_extension("ui-select")
require('telescope').load_extension('lazygit')
require('telescope').load_extension('neoclip')
require('telescope').load_extension('gitmoji')
--  require('telescope').load_extension('emoji')
require('telescope').load_extension('live_grep_args')

END

nnoremap <C-P> <cmd>Telescope live_grep_args<CR>
nnoremap <C-L> <cmd>Telescope buffers<CR>
nnoremap <C-N> <cmd>Telescope git_files<CR>
nnoremap <C-H> <cmd>Telescope oldfiles<CR>

nnoremap <Leader>ac			<cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap <silent>gr			<cmd>Telescope lsp_references<CR>
nnoremap <silent>gi			<cmd>Telescope lsp_implementations<CR>
nnoremap <Leader>gs			<cmd>Telescope git_status<CR>
nnoremap <Leader>lg			<cmd>LazyGit<CR>
nnoremap <Leader>nc			<cmd>Telescope neoclip<CR>
" nnoremap <Leader>ge			<cmd>Telescope emoji<CR>

" Show diagnostics
nnoremap <Leader>sd <cmd>Telescope diagnostics<CR>

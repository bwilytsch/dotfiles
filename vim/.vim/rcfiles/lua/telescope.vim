lua << END
local actions = require('telescope.actions')
require('telescope').setup{
    defaults = {
        vimgrep_arguments = {
            'rg',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case',
            '--ignore',
            '--hidden'
        },
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
        emoji = {
          action = function(emoji)
          -- argument emoji is a table.
          -- {name="", value="", category="", description=""}

          vim.fn.setreg("C", emoji.value)
          print([[Press p or "*p to paste this emoji]] .. emoji.value)
        
          -- insert emoji when picked
          -- vim.api.nvim_put({ emoji.value }, 'c', false, true)
          end,
        }
    }
}
require("telescope").load_extension("ui-select")
require('telescope').load_extension('lazygit')
require('telescope').load_extension('neoclip')
require('telescope').load_extension('emoji')

END

nnoremap <C-P> <cmd>Telescope live_grep<CR>
nnoremap <C-L> <cmd>Telescope buffers<CR>
nnoremap <C-N> <cmd>Telescope git_files<CR>
nnoremap <C-H> <cmd>Telescope oldfiles<CR>

nnoremap <Leader>ac			<cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap <silent>gr			<cmd>Telescope lsp_references<CR>
nnoremap <Leader>gs			<cmd>Telescope git_status<CR>
nnoremap <Leader>lg			<cmd>LazyGit<CR>
nnoremap <Leader>nc			<cmd>Telescope neoclip<CR>
nnoremap <Leader>ge			<cmd>Telescope emoji<CR>

" Show diagnostics
nnoremap <Leader>sd <cmd>Telescope diagnostics<CR>

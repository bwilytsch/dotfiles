return {
  "linux-cultist/venv-selector.nvim",
  dependencies = { "neovim/nvim-lspconfig", "nvim-telescope/telescope.nvim", "mfussenegger/nvim-dap-python" },
  config = function()
    require("venv-selector").setup({
      poetry_path = "/Users/bwilytsch/Library/Caches/pypoetry/virtualenvs/qgolem-GP8jv81C-py3.1",
    })
  end,
  keys = {
    -- Keymap to open VenvSelector to pick a venv.
    { "<leader>pv",  "<cmd>VenvSelect<cr>" },
    -- Keymap to retrieve the venv from a cache (the one previously used for the same project directory).
    { "<leader>pvs", "<cmd>VenvSelectCached<cr>" },
  },
}

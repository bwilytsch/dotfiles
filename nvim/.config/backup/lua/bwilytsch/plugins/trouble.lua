return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    { "<leader>tt", "<cmd>lua require('trouble').toggle()<cr>",                                    mode = "n" },
    { "<leader>tn", "<cmd>lua require('trouble').next({skip_groups = true, jump = true})<cr>",     mode = "n" },
    { "<leader>tp", "<cmd>lua require('trouble').previous({skip_groups = true, jump = true})<cr>", mode = "n" },
  }
}

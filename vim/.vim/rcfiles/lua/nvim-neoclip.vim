lua << END

local neoclip = require("neoclip");

neoclip.setup({
  history = 100,
  enable_persistent_history = true,
  db_path = vim.fn.stdpath("data") .. "/databases/neoclip.sqlite3",
  preview = true,
})

END

return {
  "stevearc/oil.nvim",
  opts = {},
  -- Optional dependencies
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("oil").setup({
      view_options = {
        show_hidden = true,
      },
    })
  end,

  vim.api.nvim_set_keymap("n", "-", "<cmd>lua require('oil').open_float()<CR>", { noremap = true, silent = true })
}

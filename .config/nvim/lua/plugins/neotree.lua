return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup({
      auto_close = true,
      filesystem = {
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
          hide_gitignored = false,
        }
      },
      update_focused_file = {
        enable = true,
        update_cwd = true,
      },
    })
  end,
  vim.keymap.set("n", "<C-n>", ":Neotree toggle<CR>"),
}

return {
  "ziontee113/color-picker.nvim",
  config = function()
    require("color-picker").setup({
      vim.keymap.set("n", "<leader>cp", "<cmd>PickColor<cr>"),
      vim.keymap.set("i", "<leader>cp", "<cmd>PickColorInsert<cr>")
    })
  end,
}

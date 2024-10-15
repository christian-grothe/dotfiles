return {
  {
    "rebelot/kanagawa.nvim",
    config = function()
      -- vim.cmd.colorscheme("kanagawa")
      vim.cmd.colorscheme("kanagawa-wave")
      -- vim.cmd.colorscheme("kanagawa-dragon")
      -- vim.cmd.colorscheme("kanagawa-lotus")
    end,
  },
  {
    "sho-87/kanagawa-paper.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      -- vim.cmd.colorscheme("kanagawa-paper")
    end,
  }
}

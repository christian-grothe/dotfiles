return {
  {
    "rebelot/kanagawa.nvim",
    config = function()
      -- vim.cmd.colorscheme("kanagawa")
      -- vim.cmd.colorscheme("kanagawa-wave")
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
      vim.cmd.colorscheme("kanagawa-paper")
    end,
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      --      vim.cmd.colorscheme("tokionight-night")
    end,
  },
  {
    "vague2k/vague.nvim",
    config = function()
      require("vague").setup({
        -- vim.cmd.colorscheme("vague")
      })
    end
  },
}

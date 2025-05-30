return {
  {
    "joshdick/onedark.vim"
  },
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
      -- vim.cmd.colorscheme("kanagawa-paper")
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
  {
    'sainnhe/gruvbox-material',
    lazy = false,
    priority = 1000,
    config = function()
      -- Optionally configure and load the colorscheme
      -- directly inside the plugin declaration.
      vim.g.gruvbox_material_enable_italic = true
    end
  }
}

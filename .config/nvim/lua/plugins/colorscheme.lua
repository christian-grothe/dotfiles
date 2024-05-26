return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			--vim.cmd.colorscheme("catppuccin-mocha")
			--vim.cmd.colorscheme("catppuccin-latte")
			--vim.cmd.colorscheme("catppuccin-frappe")
			--vim.cmd.colorscheme("catppuccin-macchiato")
		end,
	},
	{
		"ellisonleao/gruvbox.nvim",
		config = function()
			require("gruvbox").setup({
				terminal_colors = true, -- add neovim terminal colors
				undercurl = true,
				underline = true,
				bold = true,
				italic = {
					strings = true,
					emphasis = true,
					comments = true,
					operators = false,
					folds = true,
				},
				strikethrough = true,
				invert_selection = false,
				invert_signs = false,
				invert_tabline = false,
				invert_intend_guides = false,
				inverse = true, -- invert background for search, diffs, statuslines and errors
				contrast = "", -- can be "hard", "soft" or empty string
				palette_overrides = {},
				overrides = {},
				dim_inactive = false,
				transparent_mode = false,
			})
			--vim.cmd.colorscheme("gruvbox")
			--vim.o.background = "light"
		end,
	},
	{
		"rebelot/kanagawa.nvim",
		config = function()
			--vim.cmd.colorscheme("kanagawa")
			vim.cmd.colorscheme("kanagawa-wave")
			--vim.cmd.colorscheme("kanagawa-dragon")
			--vim.cmd.colorscheme("kanagawa-lotus")
		end,
	},
}

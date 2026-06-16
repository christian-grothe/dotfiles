return {
	{
		"saghen/blink.cmp",
		dependencies = {
			"L3MON4D3/LuaSnip",
			"rafamadriz/friendly-snippets",
		},
		version = "*",
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load()

			require("blink.cmp").setup({
				keymap = {
					preset = "enter", -- similar to cmp <CR> confirm
					["<C-b>"] = { "scroll_documentation_up" },
					["<C-f>"] = { "scroll_documentation_down" },
					["<C-Space>"] = { "show" },
					["<C-e>"] = { "hide" },
				},

				appearance = {
					use_nvim_cmp_as_default = true, -- keeps familiar look
					nerd_font_variant = "mono",
				},

				completion = {
					documentation = {
						auto_show = true,
					},
				},

				sources = {
					default = { "lsp", "snippets", "buffer" },
				},

				snippets = {
					expand = function(snippet)
						require("luasnip").lsp_expand(snippet)
					end,
				},
			})
		end,
	},
}

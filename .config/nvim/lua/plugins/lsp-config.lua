return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "cssls", "lua_ls", "rust_analyzer", "cmake" },
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local vue_language_server_path =
				"/home/christian/.local/share/nvim/mason/packages/vue-language-server/node_modules/@vue/language-server"

			vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
			vim.keymap.set("n", "<leader>en", vim.diagnostic.goto_next, {})
			vim.keymap.set("n", "<leader>ep", vim.diagnostic.goto_prev, {})

			for _, method in ipairs({ "textDocument/diagnostic", "workspace/diagnostic" }) do
				local default_diagnostic_handler = vim.lsp.handlers[method]
				vim.lsp.handlers[method] = function(err, result, context, config)
					if err ~= nil and err.code == -32802 then
						return
					end
					return default_diagnostic_handler(err, result, context, config)
				end
			end
		end,
	},
}

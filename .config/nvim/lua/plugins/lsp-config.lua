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
        ensure_installed = { "cssls", "lua_ls", "vtsls", "clangd", "rust_analyzer", "cmake", "vue_ls" },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local vue_language_server_path =
      '/home/christian/.local/share/nvim/mason/packages/vue-language-server/node_modules/@vue/language-server'
      local tsserver_filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' }
      local vue_plugin = {
        name = '@vue/typescript-plugin',
        location = vue_language_server_path,
        languages = { 'vue' },
        configNamespace = 'typescript',
      }
      local vtsls_config = {
        settings = {
          vtsls = {
            tsserver = {
              globalPlugins = {
                vue_plugin,
              },
            },
          },
        },
        filetypes = tsserver_filetypes,
      }

      -- If you are on most recent `nvim-lspconfig`
      local vue_ls_config = {}

      -- nvim 0.11 or above
      vim.lsp.config('vtsls', vtsls_config)
      vim.lsp.config('vue_ls', vue_ls_config)
      vim.lsp.enable({ 'vtsls', 'vue_ls' }) -- If using `ts_ls` replace `vtsls` to `ts_ls`

      vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
      vim.keymap.set("n", "<leader>en", vim.diagnostic.goto_next, {})
      vim.keymap.set("n", "<leader>ep", vim.diagnostic.goto_prev, {})

      for _, method in ipairs({ 'textDocument/diagnostic', 'workspace/diagnostic' }) do
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

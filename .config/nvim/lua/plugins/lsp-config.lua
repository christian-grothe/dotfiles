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
        ensure_installed = { "cssls", "lua_ls", "tsserver", "clangd", "rust_analyzer", "cmake" },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")

      lspconfig.lua_ls.setup({})
      lspconfig.tsserver.setup({})
      lspconfig.clangd.setup({})
      lspconfig.cmake.setup({})
      lspconfig.rust_analyzer.setup({})
      lspconfig.cssls.setup({})
      lspconfig.gopls.setup({})
      lspconfig.html.setup({})
      lspconfig.asm_lsp.setup({})

      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
      vim.keymap.set("n", "<leader>en", vim.diagnostic.goto_next, {})
      vim.keymap.set("n", "<leader>ep", vim.diagnostic.goto_prev, {})
    end,
  },
}

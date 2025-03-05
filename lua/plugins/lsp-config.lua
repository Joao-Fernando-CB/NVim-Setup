return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "phpactor" }
      })
    end   
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      
      -- Configuração do Lua LSP
      lspconfig.lua_ls.setup({
        settings = {
          Lua = {
            runtime = {
              version = "LuaJIT",  -- LuaJIT ou versão Lua que você usa
              path = vim.split(package.path, ";"),  -- Caminho do Lua
            },
            diagnostics = {
              enable = true,
              globals = { "vim" },  -- Configuração para usar "vim" como variável global
            },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),  -- Inclui a biblioteca do Neovim
            },
            telemetry = {
              enable = false,  -- Desativa a coleta de telemetria
            },
          },
        },
      })

      -- Configuração do PHPActor
      lspconfig.phpactor.setup({
        cmd = { "phpactor", "language-server" },
        root_dir = lspconfig.util.root_pattern("composer.json", ".git"),
      })

      -- Keymaps úteis para LSP
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
      vim.keymap.set({ 'n', 'v'}, '<leader>ca', vim.lsp.buf.code_action, {})
    end
  }
}

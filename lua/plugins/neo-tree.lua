return {

  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- Ícones para o Neo-Tree
    "MunifTanjim/nui.nvim",
  },

  config = function()
    -- Configurar os ícones (essencial para eles aparecerem)
    require("nvim-web-devicons").setup()

    -- Configurar o Neo-Tree
    require("neo-tree").setup()

    -- Atalho para abrir o Neo-Tree
    vim.keymap.set('n', '<C-b>', ':Neotree filesystem reveal left<CR>')
  end
}


return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000, -- Ensures it loads before other plugins
    lazy = false, -- Forces immediate loading (not lazy)
    config = function()
      require("catppuccin").setup({
        flavour = "mocha", -- Change to "latte", "frappe", etc., as needed
        integrations = {
          cmp = true,
          gitsigns = true,
          nvimtree = true,
          treesitter = true,
          telescope = true,
          -- Add more if you use them (e.g., lsp = true)
        },
      })
      vim.cmd.colorscheme("catppuccin") -- Apply it immediately
    end,
  },
}

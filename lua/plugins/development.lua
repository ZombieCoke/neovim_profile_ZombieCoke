return {
  { import = "lazyvim.plugins.extras.lang.rust" },

  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "rust-analyzer" })
    end,
  },

  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = { "NvimTreeFocus", "NvimTreeToggle" },
    keys = {
      { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Explorer" },
    },
    opts = {
      renderer = { group_empty = true },
      view = { width = 35 },
    },
  },

  {
    "olimorris/onedarkpro.nvim",
    priority = 1000,
    opts = {
      options = {
        transparency = false,
      },
    },
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "onedark",
    },
  },

  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
    keys = {
      { "<C-h>", "<cmd><C-U>TmuxNavigateLeft<cr>", desc = "Window Left" },
      { "<C-j>", "<cmd><C-U>TmuxNavigateDown<cr>", desc = "Window Down" },
      { "<C-k>", "<cmd><C-U>TmuxNavigateUp<cr>", desc = "Window Up" },
      { "<C-l>", "<cmd><C-U>TmuxNavigateRight<cr>", desc = "Window Right" },
      { "<C-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>", desc = "Window Previous" },
    },
  },
}

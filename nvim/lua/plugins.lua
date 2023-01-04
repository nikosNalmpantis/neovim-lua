local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

local ok, lazy = pcall(require, 'lazy')
if not ok then
  return
end

lazy.setup({
  -- Colorscheme
  {
    'rebelot/kanagawa.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      -- load the colorscheme here
      vim.cmd([[colorscheme kanagawa]])
    end,
  },

  -- Simple plugins
  "goolord/alpha-nvim",
  "windwp/nvim-autopairs", -- Autopairs, integrates with both cmp and treesitter
  "kyazdani42/nvim-web-devicons", -- Icons for nvim-tree
  "kyazdani42/nvim-tree.lua",
  "akinsho/bufferline.nvim", -- Buffer line
  "moll/vim-bbye", -- Bbye allows you to do delete buffers (close files) 
                   -- without closing your windows or messing up your layout
  "numToStr/Comment.nvim",
  "lewis6991/gitsigns.nvim",
  "rmagatti/goto-preview", -- Preview window for definitions
  "lukas-reineke/indent-blankline.nvim", -- Indents Balnklines
  "nvim-lualine/lualine.nvim", -- Status line
  { -- Documentation generation
    "danymat/neogen",
    dependencies = "nvim-treesitter/nvim-treesitter",
    -- Uncomment next line if you want to follow only stable versions
    version = "*"
  },
  "ahmedkhalf/project.nvim", -- Project managment utils
  "akinsho/toggleterm.nvim", -- Plugin to persist and toggle multiple
  "Pocco81/true-zen.nvim", -- Focus mode
  "folke/which-key.nvim", -- Key bindings previes
  { -- Markdown Preview
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  },

  -- Telescope
  "nvim-lua/plenary.nvim",
  "nvim-telescope/telescope.nvim",
  "nvim-telescope/telescope-media-files.nvim",

  -- LSP
  {
    'VonHeikemen/lsp-zero.nvim',
    dependencies = {
      -- LSP Support
      'neovim/nvim-lspconfig',
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      -- Autocompletion
      'hrsh7th/nvim-cmp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lua',
      -- Snippets
      'L3MON4D3/LuaSnip',
      'rafamadriz/friendly-snippets',
    }
  },
  {
    'glepnir/lspsaga.nvim',
    branch = 'main',
  },
  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
  },
  "p00f/nvim-ts-rainbow",
  "JoosepAlviste/nvim-ts-context-commentstring",
})

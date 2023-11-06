local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
        return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
  use "kyazdani42/nvim-web-devicons" -- Used by multiple plugins

  -- ColorScheme
  use "navarasu/onedark.nvim"

  -- autopairs
  use {
      'windwp/nvim-autopairs',
      config = function() 
        require("nvim-autopairs").setup {}
      end
  }

  -- LSP
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    requires = {
        -- mange LSP servers from neovim
        {'williamboman/mason.nvim'},
        {'williamboman/mason-lspconfig.nvim'},

        -- LSP Support
        {'neovim/nvim-lspconfig'},
        -- Autocompletion
        {'hrsh7th/nvim-cmp'},
        {'hrsh7th/cmp-nvim-lsp'},
        {'L3MON4D3/LuaSnip'},
    }
  }

  -- Telescope fuzzy finding
  use "nvim-telescope/telescope.nvim"

  -- Treesitter
  use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate", }
  use {"nvim-treesitter/playground"}

  -- Comments Just starting it here, if I want to change settings I'll move into it's own file
  use {
      "numToStr/Comment.nvim",
      config = function ()
        require("Comment").setup()
      end
  }

  -- gitsigns setup up here, if I want to change things about it I'll move it into it's own file
  use {
      "lewis6991/gitsigns.nvim",
      config = function ()
        require("gitsigns").setup()
      end
  }

  -- NVIM Tree
  use "kyazdani42/nvim-tree.lua"

  -- Setting up "buffered tabbings"
  use "akinsho/bufferline.nvim"
  use "moll/vim-bbye"

  -- Status Bar
  use {
      "tamton-aquib/staline.nvim",
      config = function ()
        require("staline").setup()
      end
  }

  -- Terminal Integration
  use "akinsho/toggleterm.nvim"

  -- Adding indent lines
  use "lukas-reineke/indent-blankline.nvim"

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)

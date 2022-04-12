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
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
  use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
  }
  -- nvim-tree seems really slow to write files
  -- use "kyazdani42/nvim-web-devicons"
  -- use "kyazdani42/nvim-tree.lua"
  -- use { 'ms-jpq/chadtree', run = ':CHADdeps' } this seems to cause slowdowns...
  use "nvim-lualine/lualine.nvim"
  use "antoinemadec/FixCursorHold.nvim" -- This is needed to fix lsp doc highlight
  use "RRethy/nvim-base16"
  use "NvChad/nvim-base16.lua"

  -- cmp plugins
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp"

  -- snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use
  -- vsnip seems to really slow down write speeds, disabling for now
  use "hrsh7th/cmp-vsnip" -- nice because it's easier to add custom
  use "hrsh7th/vim-vsnip"
  use "hrsh7th/vim-vsnip-integ"

  -- LSP
  use "neovim/nvim-lspconfig" -- enable LSP
  use "williamboman/nvim-lsp-installer" -- simple to use language server installer
  use "tamago324/nlsp-settings.nvim" -- language server settings defined in json for
  use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters

  -- Telescope
  use "nvim-telescope/telescope.nvim"
  use { "nvim-telescope/telescope-file-browser.nvim" } -- testing this out instead of nvchadtree since it was causing slowdowns

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  use "JoosepAlviste/nvim-ts-context-commentstring"

  -- Git
  use "lewis6991/gitsigns.nvim"
  -- Git blame that I like more
  use { 'tpope/vim-fugitive' }

  use {
    "lazytanuki/nvim-mapper",
    config = function() require("nvim-mapper").setup{} end,
    before = "telescope.nvim"
  }

  use 'ruanyl/vim-gh-line'
  use {
    'phaazon/hop.nvim',
    branch = 'v1', -- optional but strongly recommended
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require'hop'.setup { keys = 'asonetuhid', term_seq_bias = 0.5 }
    end
  }
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use 'tpope/vim-surround'
  use 'tpope/vim-repeat'
  use {
    'AndrewRadev/splitjoin.vim',
    event = "InsertEnter",
  }
  use {
    'goldfeld/vim-seek',
    event = "InsertEnter",
  }
  use 'machakann/vim-swap'
  use 'rbgrouleff/bclose.vim'
  use 'junegunn/fzf.vim'
  use { 'junegunn/fzf', run = function() vim.fn['fzf#install'](0) end }

  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
  }

  use { 'mhinz/vim-grepper', on = {'GrepperAg', '<plug>(GrepperOperator)'} }
  use { 'tpope/vim-eunuch', cmd = {'Delete', 'Rename' }}
  use { 'dhruvasagar/vim-table-mode', cmd = 'TableModeToggle' }
  use {
    'iamcco/markdown-preview.nvim',
    -- you might need to manually call this in vim: :call mkdp#util#install()
    run = function() vim.fn['mkdp#util#install']() end,
    ft = {'markdown'}
  }
  use { 'fatih/vim-go', run = ':GoUpdateBinaries', ft = 'go' }
  use { 'mg979/vim-visual-multi', branch = 'test'}
  use { 'schickling/vim-bufonly', cmd = 'BufOnly' }
  use { 'AndrewRadev/switch.vim' }
  -- use { 'brooth/far.vim', cmd = 'Far' }
  use { 'windwp/nvim-spectre' }


  use {
    "norcalli/nvim-colorizer.lua",
    -- event = "BufRead",
  }

  use {
    "SmiteshP/nvim-gps",
    requires = "nvim-treesitter/nvim-treesitter",
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require("nvim-gps").setup()
    end
  }

  -- speedup load times
  use 'nathom/filetype.nvim'
  use "lewis6991/impatient.nvim"

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)

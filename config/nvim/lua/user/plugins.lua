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
  -- cmp plugins
  -- buffer completions
  use { "hrsh7th/nvim-cmp",
    requires = {
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path", -- path completions
      "hrsh7th/cmp-cmdline", -- cmdline completions
      "saadparwaiz1/cmp_luasnip", -- snippet completions
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      "windwp/nvim-autopairs",
    },
    config = function()
      require("user.config.cmp").setup()
    end
  } -- The completion plugin

  use { "github/copilot.vim" }

  use { "windwp/nvim-autopairs",
    config = function()
      require("user.config.autopairs").setup()
    end
  } -- Autopairs, integrates with both cmp and treesitter

  -- Nvim Tree
  use { 'kyazdani42/nvim-tree.lua',
    requires = {
      "kyazdani42/nvim-web-devicons"
    },
    config = function()
      require("user.config.nvim-tree").setup()
    end,
    disable = false,

  }

  -- Colorschemes
  use "folke/tokyonight.nvim"
  use "doums/darcula"
  use "dracula/vim"

  -- snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  -- LSP
  use "neovim/nvim-lspconfig" -- enable LSP
  use "williamboman/nvim-lsp-installer" -- simple to use language server installer
  use { "dense-analysis/ale",
    disable = false,
    config = function()
      require("user.config.ale").setup()
    end
  }
  use {
    "tami5/lspsaga.nvim",
    config = function()
      require("lspsaga").setup {}
    end,
  }
  use { "williamboman/mason.nvim",
    config = function()
      require("mason").setup {}
    end
  }

  -- Finding
  use { "nvim-telescope/telescope.nvim",
    requires = {
      'nvim-telescope/telescope-media-files.nvim',
      "nvim-telescope/telescope-file-browser.nvim",
      "nvim-telescope/telescope-dap.nvim",
      "nvim-telescope/telescope-smart-history.nvim",
      "nvim-telescope/telescope-project.nvim",
      "nvim-telescope/telescope-live-grep-args.nvim",
      "kkharji/sqlite.lua", -- required for telescope-smart-history to work and also sudo apt-get install sqlite3 libsqlite3-dev
    },
    config = function()
      -- vim.g.sqlite_clib_path = "/usr/local/bin/sqlite3"
      require("user.config.telescope").setup()
    end
  }
  use {
    "liuchengxu/vim-clap",
    run = ":Clap install-binary!"
  }

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    requires = {
      "p00f/nvim-ts-rainbow",
    },
    config = function()
      require("user.config.treesitter").setup()
    end,
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end, -- It avoids failing on TSUpdate
  }
  use { "nvim-treesitter/playground",
    requires = "nvim-treesitter/nvim-treesitter",
  }

  -- Slime: execute code in another window
  use { "jpalardy/vim-slime",
    config = function()
      vim.g.slime_target = "tmux"
      vim.g.slime_cell_delimiter = "#%%"
    end
  }

  -- Git
  use { "f-person/git-blame.nvim",
    config = function()
      vim.g.gitblame_message_template = '<author> • <date> • <summary>'
      vim.g.gitblame_enabled = 0
    end
  }
  use { "lewis6991/gitsigns.nvim",
    config = function()
      require("user.config.gitsigns").setup()
    end
  }
  use { 'sindrets/diffview.nvim',
    requires = 'nvim-lua/plenary.nvim',
    config = function()
      require("user.config.diffview").setup()
    end
  }
  use { 'tpope/vim-fugitive' }
  -- Dashboard
  use { "glepnir/dashboard-nvim",
    config = function()
      require("user.config.dashboard").setup()
    end,
    disable = false
  }

  -- Debug
  use { "folke/trouble.nvim",
    config = function()
      require('user.config.trouble').setup()
    end
  }

  -- Refactoring
  use {
    "ThePrimeagen/refactoring.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "nvim-telescope/telescope.nvim"
    },
    config = function()
      require("user.config.refactoring").setup()
    end,
  }
  use "jose-elias-alvarez/null-ls.nvim"

  -- Scala
  use({
    'scalameta/nvim-metals',
    requires = {
      "mfussenegger/nvim-dap",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim"
    },
    config = function()
      require("user.config.metals").setup()
    end
  })

  -- Files Management
  use { 'akinsho/bufferline.nvim',
    disable = false,
    tag = "v2.*",
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require('user.config.bufferline').setup()
    end,
  }
  use { 'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = function()
      require('user.config.lualine').setup()
    end,
  }
  use "moll/vim-bbye" -- Provides Bdelete, so it does not closes the current window

  -- Neovim developing utilities'
  use 'tpope/vim-scriptease'

  -- Testing

  use {
    "nvim-neotest/neotest",
    opt = true,
    wants = {
      "plenary.nvim",
      "nvim-treesitter",
      "FixCursorHold.nvim",
      "neotest-python",
      "neotest-plenary",
      "neotest-go",
      "neotest-jest",
      "neotest-vim-test",
    },
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-neotest/neotest-python",
      "nvim-neotest/neotest-plenary",
      "nvim-neotest/neotest-go",
      "haydenmeade/neotest-jest",
      "nvim-neotest/neotest-vim-test",
      "vim-test/vim-test",
    },
    module = { "neotest" },
    config = function()
      require("user.config.neotest").setup()
    end,
  }

  -- Markdown
  -- This needs node and yarn installed
  use { "iamcco/markdown-preview.nvim", run = "cd app && npm install",
    setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" },
    disable = false
  }

  use 'ekickx/clipboard-image.nvim'
  use({
    'jakewvincent/mkdnflow.nvim',
    rocks = 'luautf8', -- Ensures optional luautf8 dependency is installed
    config = function()
      require("user.config.mkdnflow").setup()
    end,
    disable = false
  })
  -- Jupyter
  -- To install magma verify magma plugin is loaded. Running nvim with a python env that contains
  -- all dependencies. If you didn't, reload with the correct env and run manually :UpdateRemotePlugins
  -- until it messages out that magma plugin was loaded
  use { 'dccsillag/magma-nvim',
    disable = true,
    run = ':UpdateRemotePlugins', requires = { "rcarriga/nvim-notify" }, }
  use { 'rcarriga/nvim-notify', config = function()
    require("user.config.nvim-notify").setup()
  end }
  use { 'goerz/jupytext.vim', -- pip install jupytext in the local python environment
    disable = false
  }
  use { "glacambre/firenvim",
    disable = true,
    run = function() vim.fn["firenvim#install"](0) end,
  }
  use "untitled-ai/jupyter_ascending.vim"
  -- Debugging
  use {
    "mfussenegger/nvim-dap",
    opt = false,
    requires = {
      "theHamsta/nvim-dap-virtual-text",
      "rcarriga/nvim-dap-ui",
      "mfussenegger/nvim-dap-python",
    },
    config = function()
      require("user.config.dap").setup()
    end,
  }
  -- Folding
  use {
    "kevinhwang91/nvim-ufo",
    requires = { "kevinhwang91/promise-async",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("user.config.ufo").setup()
    end,
  }
  -- Comment
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }
  -- Iluminate current word usages
  use({
    "RRethy/vim-illuminate",
    event = "CursorHold",
    module = "illuminate",
    config = function()
      vim.g.Illuminate_delay = 1000
    end,
  })
  -- Quicker movements
  use {
    'phaazon/hop.nvim',
    branch = 'v2', -- optional but strongly recommended
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require 'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
    end
  }
  -- Terminal
  use { "akinsho/toggleterm.nvim", tag = 'v2.*', config = function()
    require("toggleterm").setup()
  end }
  -- Rest
  use { "rest-nvim/rest.nvim",
    requires = { "nvim-lua/plenary.nvim" },
    config = function()
      require('user.config.rest').setup()
    end
  }
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)

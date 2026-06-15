return {
  {
    "mason-org/mason.nvim",
    lazy = false,
    opts = function()
      return require "nvchad.configs.mason"
    end,
    config = function(_, opts)
      require("mason").setup(opts)

      local registry = require "mason-registry"
      local ensure_installed = {
        "csharpier",
        "eslint-lsp",
        "netcoredbg",
        "prettier",
        "roslyn-language-server",
        "stylua",
        "typescript-language-server",
      }

      local function install_missing()
        for _, name in ipairs(ensure_installed) do
          local ok, package = pcall(registry.get_package, name)
          if not ok then
            return false
          end

          if not package:is_installed() then
            package:install()
          end
        end

        return true
      end

      if not install_missing() and registry.refresh then
        registry.refresh(install_missing)
      end
    end,
  },
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },
  {
    "seblyng/roslyn.nvim",
    ft = "cs",
    opts = {},
  },
  {
    "mfussenegger/nvim-dap",
    config = function()
      require "configs.dap"
    end,
  },
  {
    "kdheepak/lazygit.nvim",
    cmd = "LazyGit",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    keys = {
      { "<leader>gg", "<cmd>LazyGit<cr>", desc = "Open LazyGit" },
    },
  },
  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

  {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    opts = function(_, opts)
      opts.highlight = {
        enable = true,
      }

      opts.ensure_installed = vim.tbl_deep_extend("force", opts.ensure_installed or {}, {
        "css",
        "c_sharp",
        "html",
        "javascript",
        "jsdoc",
        "tsx",
        "typescript",
      })
    end,
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },
}

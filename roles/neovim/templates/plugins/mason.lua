local utils = require("astrocommunity.utils")

-- customize mason plugins
return {
  -- use mason-lspconfig to configure LSP installations
  {
    "williamboman/mason-lspconfig.nvim",
    -- overrides `require("mason-lspconfig").setup(...)`
    opts = function(_, opts)
      if not opts.ensure_installed then
        opts.ensure_installed = {}
      end
      -- Add to opts.ensure_installed using vim.list_extend.
      utils.list_insert_unique(opts.ensure_installed, "bashls")
      utils.list_insert_unique(opts.ensure_installed, "lua_ls")
      utils.list_insert_unique(opts.ensure_installed, "tsserver")
      utils.list_insert_unique(opts.ensure_installed, "jsonls")
      utils.list_insert_unique(opts.ensure_installed, "html")
      utils.list_insert_unique(opts.ensure_installed, "cssls")
      utils.list_insert_unique(opts.ensure_installed, "tailwindcss")
      utils.list_insert_unique(opts.ensure_installed, "intelephense")
      utils.list_insert_unique(opts.ensure_installed, "phpactor")
      utils.list_insert_unique(opts.ensure_installed, "rust_analyzer")
      utils.list_insert_unique(opts.ensure_installed, "terraformls")
      utils.list_insert_unique(opts.ensure_installed, "dockerls")
      utils.list_insert_unique(opts.ensure_installed, "marksman")
      utils.list_insert_unique(opts.ensure_installed, "perlnavigator")
      utils.list_insert_unique(opts.ensure_installed, "gopls")
      utils.list_insert_unique(opts.ensure_installed, "pyright")
      utils.list_insert_unique(opts.ensure_installed, "ruff_lsp")
      utils.list_insert_unique(opts.ensure_installed, "ansiblels")
      utils.list_insert_unique(opts.ensure_installed, "yamlls")
    end,
  },
  -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
  {
    "jay-babu/mason-null-ls.nvim",
    -- overrides `require("mason-null-ls").setup(...)`
    opts = function(_, opts)
      if not opts.ensure_installed then
        opts.ensure_installed = {}
      end
      -- Add to opts.ensure_installed using vim.list_extend.
      utils.list_insert_unique(opts.ensure_installed, "stylua")
      utils.list_insert_unique(opts.ensure_installed, "eslint_d")
      utils.list_insert_unique(opts.ensure_installed, "terraform_fmt")
      utils.list_insert_unique(opts.ensure_installed, "phpcsfixer")
      utils.list_insert_unique(opts.ensure_installed, "shellcheck")
      utils.list_insert_unique(opts.ensure_installed, "shfmt")
      utils.list_insert_unique(opts.ensure_installed, "php")
      utils.list_insert_unique(opts.ensure_installed, "yamllint")
      utils.list_insert_unique(opts.ensure_installed, "perltidy")
      utils.list_insert_unique(opts.ensure_installed, "hadolint")
      utils.list_insert_unique(opts.ensure_installed, "golangci-lint")
      utils.list_insert_unique(opts.ensure_installed, "isort")
      utils.list_insert_unique(opts.ensure_installed, "pylint")
      utils.list_insert_unique(opts.ensure_installed, "black")
      utils.list_insert_unique(opts.ensure_installed, "ansible-lint")
      utils.list_insert_unique(opts.ensure_installed, "markdown-toc")
    end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    -- overrides `require("mason-nvim-dap").setup(...)`
    opts = {
      -- ensure_installed = { "python" },
    },
  },
}

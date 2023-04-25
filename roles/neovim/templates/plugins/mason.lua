local utils = require("astronvim.utils")
utils = utils.extend_tbl(utils, require("astrocommunity.utils"))

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
      utils.list_insert_unique(opts.ensure_installed, "dotenv_linter")

      local null_ls = require("null-ls")

      opts.handlers = utils.extend_tbl(opts.handlers, {
        dotenv_linter = function()
          null_ls.register(null_ls.builtins.diagnostics.dotenv_linter.with({
            filetypes = { "env" },
          }))
        end,
        stylua = function()
          null_ls.register(null_ls.builtins.formatting.stylua.with({
            extra_args = {
              "--indent-type",
              "Spaces",
              "--indent-width",
              "2",
            },
          }))
        end,
        yamllint = function()
          null_ls.register(null_ls.builtins.diagnostics.yamllint.with({
            args = {
              "--format",
              "parsable",
              "--config-data",
              "{extends: default, rules: {line-length: {max: 120}}}",
              "-",
            },
          }))
        end,
      })
    end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    tag = "v2.0.1",
    -- overrides `require("mason-nvim-dap").setup(...)`
    opts = {
      -- ensure_installed = { "python" },
    },
  },
}

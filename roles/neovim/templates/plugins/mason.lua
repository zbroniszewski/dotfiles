local utils = require("astronvim.utils")

-- customize mason plugins
return {
  -- use mason-lspconfig to configure LSP installations
  {
    "williamboman/mason-lspconfig.nvim",
    -- overrides `require("mason-lspconfig").setup(...)`
    opts = function(_, opts)
      opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, {
        "bashls",
        "lua_ls",
        "tsserver",
        "jsonls",
        "html",
        "cssls",
        "tailwindcss",
        "intelephense",
        -- "phpactor",
        "rust_analyzer",
        "terraformls",
        "dockerls",
        "marksman",
        "perlnavigator",
        "gopls",
        "pyright",
        -- "ruff_lsp",
        "ansiblels",
        "yamlls",
      })
    end,
  },
  -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
  {
    "jay-babu/mason-null-ls.nvim",
    -- overrides `require("mason-null-ls").setup(...)`
    opts = function(_, opts)
      opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, {
        "stylua",
        "eslint_d",
        -- "phpcsfixer",
        "shellcheck",
        "shfmt",
        "yamllint",
        "hadolint",
        "golangci-lint",
        "isort",
        "pylint",
        -- "black",
        "ansible-lint",
        "markdown-toc",
      })

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
        eslint_d = function()
          null_ls.register(null_ls.builtins.diagnostics.eslint_d.with({
            filter = function(diagnostic)
              if not string.find(diagnostic.message, "No ESLint configuration found") then
                return true
              end
            end,
          }))
        end,
        shellcheck = function()
          null_ls.register(null_ls.builtins.diagnostics.shellcheck.with({
            condition = function(_utils)
              local filename = vim.fn.expand("%:t")
              return not (filename == ".env")
            end,
          }))
        end,
        shfmt = function()
          null_ls.register(null_ls.builtins.formatting.shfmt.with({
            extra_args = { "-i", "2" },
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
    -- overrides `require("mason-nvim-dap").setup(...)`
    opts = {
      -- ensure_installed = { "python" },
    },
  },
}

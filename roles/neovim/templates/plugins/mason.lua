-- customize mason plugins
return {
  -- use mason-lspconfig to configure LSP installations
  {
    "williamboman/mason-lspconfig.nvim",
    -- overrides `require("mason-lspconfig").setup(...)`
    opts = {
      ensure_installed = {
        "lua_ls",
        "tsserver",
        "html",
        "cssls",
        "tailwindcss",
        "intelephense",
        "phpactor",
        "eslint",
        "rust_analyzer",
        "terraformls",
        "dockerls",
        "marksman",
        "perlnavigator",
        "gopls",
        "pylsp",
        "ansiblels",
        "yamlls",
      },
    },
  },
  -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
  {
    "jay-babu/mason-null-ls.nvim",
    -- overrides `require("mason-null-ls").setup(...)`
    opts = {
      ensure_installed = {
        -- "luacheck",
        "stylua",
        "prettier",
        "eslint_d",
        "terraform_fmt",
        "phpcsfixer",
        "shellcheck",
        "php",
        -- "yamlfmt",
        "yamllint",
        "perltidy",
        "hadolint",
        "golangci-lint",
        "pylint",
        "autopep8",
        "ansible-lint",
      },
    },
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    -- overrides `require("mason-nvim-dap").setup(...)`
    opts = {
      -- ensure_installed = { "python" },
    },
  },
}

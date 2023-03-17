return {
  "jose-elias-alvarez/null-ls.nvim",
  opts = function(_, config)
    -- config variable is the default configuration table for the setup function call
    local null_ls = require "null-ls"

    -- Check supported formatters and linters
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
    config.sources = {
      -- Set a formatter
      null_ls.builtins.formatting.stylua.with {
        extra_args = {
          "--indent-type",
          "Spaces",
          "--indent-width",
          "2",
        },
      },
      null_ls.builtins.formatting.prettier,
      null_ls.builtins.formatting.eslint_d,
      null_ls.builtins.formatting.phpcsfixer,
      null_ls.builtins.formatting.terraform_fmt,
      null_ls.builtins.formatting.autopep8,
      -- null_ls.builtins.formatting.yamlfmt,
      -- null_ls.builtins.formatting.perlimports,
      null_ls.builtins.formatting.perltidy,
      -- Set code actions
      null_ls.builtins.code_actions.eslint_d,
      null_ls.builtins.code_actions.shellcheck,
      -- Set diagnostics
      -- null_ls.builtins.diagnostics.luacheck,
      null_ls.builtins.diagnostics.eslint_d,
      null_ls.builtins.diagnostics.php,
      null_ls.builtins.diagnostics.shellcheck,
      null_ls.builtins.diagnostics.yamllint.with {
        args = {
          "--format",
          "parsable",
          "--config-data",
          "{extends: default, rules: {line-length: {max: 140}}}",
          "-",
        },
      },
      -- null_ls.builtins.diagnostics.perlimports,
      null_ls.builtins.diagnostics.hadolint,
      null_ls.builtins.diagnostics.golangci_lint,
      null_ls.builtins.diagnostics.pylint,
      null_ls.builtins.diagnostics.ansiblelint,
    }
    return config -- return final config table
  end,
}

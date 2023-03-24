return {
  "jose-elias-alvarez/null-ls.nvim",
  opts = function(_, config)
    -- config variable is the default configuration table for the setup function call
    local null_ls = require("null-ls")

    -- Check supported formatters and linters
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics

    config.sources = {
      null_ls.builtins.formatting.stylua.with({
        extra_args = {
          "--indent-type",
          "Spaces",
          "--indent-width",
          "2",
        },
      }),

      null_ls.builtins.diagnostics.yamllint.with({
        args = {
          "--format",
          "parsable",
          "--config-data",
          "{extends: default, rules: {line-length: {max: 140}}}",
          "-",
        },
      }),
    }

    return config -- return final config table
  end,
}

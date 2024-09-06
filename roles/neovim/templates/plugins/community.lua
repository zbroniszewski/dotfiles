local utils = require("astronvim.utils")

return {
  -- Add the community repository of plugin specifications
  "AstroNvim/astrocommunity",
  -- example of imporing a plugin, comment out to use it or add your own
  -- available plugins can be found at https://github.com/AstroNvim/astrocommunity

  -- { import = "astrocommunity.colorscheme.catppuccin" },
  {
    import = "astrocommunity.completion.copilot-lua-cmp",
    -- event = "BufEnter",
    -- opts = function(_, opts)
    --   opts.filetypes = {
    --     ["*"] = false,
    --     lua = true,
    --     javascript = true,
    --     typescript = true,
    --     rust = true,
    --     python = true,
    --     php = true,
    --     json = true,
    --     bash = true,
    --     sh = true,
    --     yaml = true,
    --   }
    --   return opts
    -- end,
  },
  { import = "astrocommunity.pack.typescript" },
  { import = "astrocommunity.pack.rust" },
  { import = "astrocommunity.pack.go" },
  { import = "astrocommunity.diagnostics.lsp_lines-nvim" },
  { import = "astrocommunity.diagnostics.trouble-nvim" },
}

return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
  {
    "davidgranstrom/nvim-markdown-preview",
    as = "MarkdownPreview",
    run = "npm install -g @compodoc/live-server && brew install pandoc",
    ft = { "markdown" },
  },
}

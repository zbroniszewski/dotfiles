return {
  "nvim-treesitter/nvim-treesitter",
  -- dependencies = {
  --   "HiPhish/nvim-ts-rainbow2",
  --   config = function()
  --     -- HACK: https://github.com/p00f/nvim-ts-rainbow/issues/112#issuecomment-1310835936
  --     vim.api.nvim_create_autocmd({ "BufWritePost", "FocusGained" }, {
  --       callback = function()
  --         vim.cmd("TSDisable rainbow")
  --         vim.cmd("TSEnable rainbow")
  --       end,
  --     })
  --   end,
  -- },
  opts = {
    ensure_installed = {
      "bash",
      "lua",
      "luap",
      "javascript",
      "json",
      "jsonc",
      "typescript",
      "tsx",
      "rust",
      "hcl",
      "dockerfile",
      "markdown",
      "markdown_inline",
      "php",
      "yaml",
      "perl",
      "go",
      "python",
      "toml",
    },
    -- rainbow = {
    --   enable = true,
    --   extended_mode = true,
    --   max_file_lines = nil,
    -- },
  },
}

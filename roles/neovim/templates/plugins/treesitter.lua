return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "lua",
      "javascript",
      "typescript",
      "rust",
      "hcl",
      "dockerfile",
      "markdown",
      "php",
      "yaml",
      "perl",
      "go",
      "python",
    },
    rainbow = {
      enable = true,
      extended_mode = true,
      max_file_lines = nil,
    },
  },
}

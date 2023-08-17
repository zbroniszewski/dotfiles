local utils = require("astronvim.utils")

return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- local ft_to_parser = require("nvim-treesitter.parsers").filetype_to_parsername
      -- ft_to_parser["terraform"] = "terraform"
      if opts.ensure_installed == "all" then
        return
      end

      opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, {
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
        "terraform",
        "dockerfile",
        "markdown",
        "markdown_inline",
        "php",
        "yaml",
        "perl",
        "go",
        "python",
        "toml",
      })
    end,
  },
}

local utils = require("astronvim.utils")

return {
  {
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
    -- rainbow = {
    --   enable = true,
    --   extended_mode = true,
    --   max_file_lines = nil,
    -- },
  },
}

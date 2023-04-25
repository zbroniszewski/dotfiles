local utils = require("astrocommunity.utils")

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
    opts = function(opts)
      -- local ft_to_parser = require("nvim-treesitter.parsers").filetype_to_parsername
      -- ft_to_parser["terraform"] = "terraform"
      if not opts.ensure_installed then
        opts.ensure_installed = {}
      end
      utils.list_insert_unique(opts.ensure_installed, "bash")
      utils.list_insert_unique(opts.ensure_installed, "lua")
      utils.list_insert_unique(opts.ensure_installed, "luap")
      utils.list_insert_unique(opts.ensure_installed, "javascript")
      utils.list_insert_unique(opts.ensure_installed, "json")
      utils.list_insert_unique(opts.ensure_installed, "jsonc")
      utils.list_insert_unique(opts.ensure_installed, "typescript")
      utils.list_insert_unique(opts.ensure_installed, "tsx")
      utils.list_insert_unique(opts.ensure_installed, "rust")
      utils.list_insert_unique(opts.ensure_installed, "hcl")
      utils.list_insert_unique(opts.ensure_installed, "terraform")
      utils.list_insert_unique(opts.ensure_installed, "dockerfile")
      utils.list_insert_unique(opts.ensure_installed, "markdown")
      utils.list_insert_unique(opts.ensure_installed, "markdown_inline")
      utils.list_insert_unique(opts.ensure_installed, "php")
      utils.list_insert_unique(opts.ensure_installed, "yaml")
      utils.list_insert_unique(opts.ensure_installed, "perl")
      utils.list_insert_unique(opts.ensure_installed, "go")
      utils.list_insert_unique(opts.ensure_installed, "python")
      utils.list_insert_unique(opts.ensure_installed, "toml")
      return opts
    end,
    -- rainbow = {
    --   enable = true,
    --   extended_mode = true,
    --   max_file_lines = nil,
    -- },
  },
}

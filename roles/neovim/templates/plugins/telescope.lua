return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-telescope/telescope-media-files.nvim",
  },
  config = function(plugin, opts)
    opts.pickers = {
      find_files = {
        find_command = {
          "rg",
          "--files",
          "--hidden",
          "--no-ignore",
          "--follow",
          "--glob",
          "!.git/*",
        },
      },
    }

    require "plugins.configs.telescope" (plugin, opts)

    local telescope = require "telescope"
    telescope.load_extension "media_files"
  end,
}

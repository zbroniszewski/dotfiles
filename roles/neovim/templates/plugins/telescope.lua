local trouble = require("trouble.providers.telescope")
local actions = require("telescope.actions")

return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "folke/trouble.nvim",
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
      buffers = {
        path_display = { "smart" },
        mappings = {
          i = { ["<c-d>"] = actions.delete_buffer },
          n = { ["d"] = actions.delete_buffer },
        },
      },
    }

    opts.defaults.mappings.i["<C-b>"] = trouble.open_with_trouble
    opts.defaults.mappings.n["<C-b>"] = trouble.open_with_trouble

    require("plugins.configs.telescope")(plugin, opts)

    local telescope = require("telescope")
    telescope.load_extension("media_files")
  end,
}

local trouble = require("trouble.providers.telescope")
local actions = require("telescope.actions")

return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "folke/trouble.nvim",
  },
  opts = function(_, opts)
    return require("astronvim.utils").extend_tbl(opts, {
      defaults = {
        mappings = {
          i = {
            ["<C-b>"] = trouble.open_with_trouble,
          },
          n = {
            ["<C-b>"] = trouble.open_with_trouble,
          },
        },
        vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
          "--hidden",
          "--no-ignore",
          "--follow",
          "--glob",
          "!.git/*",
        },
      },
      pickers = {
        buffers = {
          path_display = { "smart" },
          mappings = {
            i = { ["<c-d>"] = actions.delete_buffer },
            n = { ["d"] = actions.delete_buffer },
          },
        },
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
      },
    })
  end,
}

return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    close_if_last_window = true,
    popup_border_style = "rounded",
    log_level = "warn",
    default_component_configs = {
      indent = {
        padding = 1,
        indent_size = 1,
      },
    },
    filesystem = {
      filtered_items = {
        hide_dotfiles = false,
        hide_gitignored = false,
        hide_by_pattern = {
          "*.git",
        },
      },
    },
  },
}

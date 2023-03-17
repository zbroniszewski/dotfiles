return {
  "toppair/peek.nvim",
  run = "deno task --quiet build:fast",
  config = function()
    require("peek").setup {
      app = "browser",
    }
  end,
}

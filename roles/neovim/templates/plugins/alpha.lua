return {
  "goolord/alpha-nvim",
  opts = function(_, opts)
    opts.section.header.val = {
      [[                                  __]],
      [[     ___     ___    ___   __  __ /\_\    ___ ___]],
      [[    / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\]],
      [[   /\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \]],
      [[   \ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
      [[    \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
    }
    opts.section.header.opts.hl = "AlphaHeader"

    local handle = io.popen "fortune 50% wisdom 50% computers"
    local result = ""
    if handle ~= nil then
      result = handle:read "*a"
      handle:close()
    end

    opts.section.footer.val = result
    opts.section.footer.opts.hl = "AlphaQuote"

    opts.section.buttons.opts.hl = "AlphaButtons"

    opts.config.layout[1].val = vim.fn.max { 2, vim.fn.floor(vim.fn.winheight(0) * 0.1) }
    opts.config.layout[3].val = 2

    return opts
  end,
  config = function(_, opts) require("alpha").setup(opts.config) end,
}

return {
  "AstroNvim/astrotheme",
  config = function()
    require("astrotheme").setup {
      highlights = {
        astrodark = {
          modify_hl_groups = function(hl, c)
            -- c.fg = "#dcdcdc"
            c.fg = "#acb2bf"
            c.bg = "#292c34"
            c.black = "#292c34"
            c.blue = "#4e606c"
            c.blue_2 = "#22252b"
            c.grey_8 = "#2d313c"
            c.lua = "#4365ba"

            hl.Normal = { fg = c.fg, bg = c.bg }
            hl.NormalNC = { fg = c.fg, bg = c.bg }
            hl.WinBar = { fg = c.fg, bg = c.bg }
            hl.WinBarNC = { fg = c.fg, bg = c.bg }
            hl.WinSeparator = { fg = c.blue_2, bg = c.blue_2 }
            hl.StatusLine = { fg = c.fg, bg = c.blue_2 }
            hl.NeoTreeNormal = { bg = c.blue_2 }
            hl.NeoTreeNormalNC = { bg = c.blue_2 }
            hl.CursorLine = { bg = c.grey_8 }
            hl.TelescopePromptNormal = { bg = c.bg }
            hl.TelescopePromptBorder = { fg = c.fg }
            hl.TelescopeResultsNormal = { bg = c.bg }
            hl.TelescopeResultsBorder = { fg = c.fg }
            hl.TelescopePreviewNormal = { bg = c.bg }
            hl.TelescopePreviewBorder = { fg = c.fg }
            hl.NeoTreeDirectoryIcon = { fg = c.blue }
            hl.NeoTreeFloatBorder = { bg = c.blue_2, fg = c.fg }
            hl.NeoTreeFloatNormal = { bg = c.blue_2, fg = c.fg }
            hl.NeoTreeFloatTitle = { fg = c.fg, bg = c.blue_2 }
            hl.DevIconLua = { fg = c.lua }
            hl.AlphaQuote = { fg = "#dfb552" }
            hl.AlphaHeader = { fg = "#7dbbdf" }
          end,
        },
      },
    }
  end,
}

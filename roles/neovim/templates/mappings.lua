-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)

local astro_utils = require("astronvim.utils")

return {
  -- first key is the mode
  n = {
    -- ["<Tab>"] = {
    --   function()
    --     if #vim.t.bufs > 1 then
    --       require("telescope.builtin").buffers({ sort_mru = true, ignore_current_buffer = true })
    --     else
    --       astro_utils.notify("No other buffers open")
    --     end
    --   end,
    --   desc = "Switch Buffers",
    -- },
    -- remove default bindings
    ["<C-s>"] = false,
    ["<C-q>"] = false,
    ["[b"] = false,
    ["]b"] = false,
    ["<leader>w"] = { "<cmd>update<cr>", desc = "Save" },
    -- second key is the lefthand side of the map
    -- mappings seen under group name "Buffer"
    ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(function(bufnr)
          require("astronvim.utils.buffer").close(bufnr)
        end)
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    -- ["<leader>bb"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    -- ["<leader>bc"] = { "<cmd>BufferLinePickClose<cr>", desc = "Pick to close" },
    -- ["<leader>bj"] = { "<cmd>BufferLinePick<cr>", desc = "Pick to jump" },
    -- ["<leader>bt"] = { "<cmd>BufferLineSortByTabs<cr>", desc = "Sort by tabs" },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
    ["<A-j>"] = { "<ESC><CMD>move .+1<CR>==", desc = "Move current line down by one line" },
    ["<A-k>"] = { "<ESC><CMD>move .-2<CR>==", desc = "Move current line up by one line" },
    -- ["<leader>d"] = { "<CMD>TroubleToggle<CR>", desc = "Toggle Trouble window", silent = true },
    L = {
      function()
        require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1)
      end,
      desc = "Next buffer",
    },
    H = {
      function()
        require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1))
      end,
      desc = "Previous buffer",
    },
    ["<leader>m"] = { name = "Markdown" },
    ["<leader>mp"] = {
      function()
        require("peek").open()
      end,
      desc = "Markdown Preview",
    },
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
  x = {
    ["<A-j>"] = { ":move '>+1<CR><CR>gv=gv", desc = "Move current selection down by one line", silent = true },
    ["<A-k>"] = { ":move '<-2<CR><CR>gv=gv", desc = "Move current selection up by one line", silent = true },
    [">"] = { ">gv", desc = "Indent current block" },
    ["<"] = { "<gv", desc = "Unindent current block" },
  },
}

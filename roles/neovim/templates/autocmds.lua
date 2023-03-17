vim.api.nvim_create_augroup("buffer_views", { clear = true })

vim.api.nvim_create_autocmd({ "BufWinLeave", "WinLeave", "BufWritePost" }, {
  desc = "Save view",
  group = "buffer_views",
  pattern = "*",
  callback = function()
    if vim.fn.has "quickfix" and vim.bo.filetype == "nofile" then
      -- Buffer is marked as not a file
      return
    end
    if vim.fn.index({ "neo-tree" }, vim.bo.filetype) >= 0 then
      -- Exclude filetypes
      return
    end
    if vim.fn.expand "%:p" == "" then
      -- File does not exist on disk
      return
    end
    if string.sub(vim.fn.expand "%", -14, -1) == "COMMIT_EDITMSG" then
      -- Exclude filenames
      return
    end
    vim.cmd "mkview"
  end,
})

vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
  desc = "Restore view",
  group = "buffer_views",
  pattern = "*",
  callback = function()
    if vim.fn.has "quickfix" and vim.bo.filetype == "nofile" then
      -- Buffer is marked as not a file
      return
    end
    if vim.fn.index({ "neo-tree" }, vim.bo.filetype) >= 0 then
      -- Exclude filetypes
      return
    end
    if vim.fn.expand "%:p" == "" then
      -- File does not exist on disk
      return
    end
    if string.sub(vim.fn.expand "%", -14, -1) == "COMMIT_EDITMSG" then
      -- Exclude filenames
      return
    end
    vim.cmd "silent! loadview"
  end,
})

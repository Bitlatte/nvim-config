local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Remove whitespace on save
autocmd("BufWritePre", {
  pattern = "*",
  command = ":%s/\\s\\+$//e",
})

-- Don't auto comment new lines
autocmd("BufEnter", {
  pattern = "*",
  command = "set fo-=c fo-=r fo-=o",
})

-- Restore cursor position
autocmd("BufReadPost", {
  pattern = "*",
  callback = function()
    local line = vim.fn.line("'\"")
    if line > 1 and line <= vim.fn.line("$") then
      vim.cmd("normal! g'\"")
    end
  end,
})

-- Auto format on save (if formatter available)
autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    -- Check if there's a formatter
    local ok, _ = pcall(vim.cmd, "silent! lua vim.lsp.buf.format()")
    if not ok then
      -- No formatter available, silently continue
    end
  end,
})

-- Terminal Settings
autocmd("TermOpen", {
  pattern = "*",
  command = "setlocal nonumber norelativenumber signcolumn=no"
})

-- Auto enter insert mode when switching to terminal
autocmd("BufWinEnter", {
  pattern = "term://*",
  command = "startinsert"
})

autocmd("WinEnter", {
  pattern = "term://*",
  command = "startinsert"
})

-- Close terminal buffer on process exit
autocmd("TermClose", {
  pattern = "*",
  command = "if !v:event.status | exe 'bdelete! '..expand('<abuf>') | endif"
})

local keymap = vim.keymap
local base_opts = { noremap = true, silent = true }

local function opts(description)
  local new_opts = vim.tbl_extend("force", base_opts, { desc = description })
  return new_opts
end

-- File Explorer
-- keymap.set("n", "<leader>e", ":Explore<CR>", opts) -- Open file explorer_method

-- Buffer Navigation
keymap.set("n", "<leader>bn", ":bnext<CR>", opts("Next Buffer"))     -- Next Buffer
keymap.set("n", "<leader>bp", ":bprevious<CR>", opts("Previous Buffer")) -- Previous Buffer
keymap.set("n", "<leader>db", ":bdelete<CR>", opts("Delete Current Buffer"))   -- Delete Current Buffer

-- Window Management
keymap.set("n", "<leader>sv", "<C-w>v", opts("Split Window Vertically"))     -- Split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", opts("Split Window Horizontally"))     -- Split window horizontally
keymap.set("n", "<leader>sx", ":close<CR>", opts("Close Current Split Window")) -- Close current split window

-- Tab Management
keymap.set("n", "<leader>to", ":tabnew<CR>", opts("New Tab"))   -- Open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>", opts("Close Current Tab")) -- Close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>", opts("Next Tab"))     -- Next tab
keymap.set("n", "<leader>tp", ":tabp<CR>", opts("Previous Tab"))     -- Previous tab

-- Window Navigation
keymap.set("n", "<C-h>", "<C-w>h", opts("Navigate Left")) -- Navigate left
keymap.set("n", "<C-j>", "<C-w>j", opts("Navigate Down")) -- Navigate down
keymap.set("n", "<C-k>", "<C-w>k", opts("Navigate Up")) -- Navigate up
keymap.set("n", "<C-l>", "<C-w>l", opts("Navigate Right")) -- Navigate right

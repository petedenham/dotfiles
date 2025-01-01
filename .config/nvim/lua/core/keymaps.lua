local keymap = vim.keymap

-- Leader key
vim.g.mapleader = " "

-- Clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "No highlights" })

-- Increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" })
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" })

-- Move up and down the page
keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Move down the page and recenter the line on the cursor" })
keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Move up the page and recenter the line on the cursor" })

-- Node
keymap.set("n", "<leader>rn", "<cmd>!node %<CR>", { desc = "Run current file in Node" })

-- Copy current file name/path
keymap.set("n", "<leader>cf", '<cmd>let @+ = expand("%:t")<CR>', { desc = "Copy file name" })
keymap.set("n", "<leader>cp", '<cmd>let @+ = expand("%:p")<CR>', { desc = "Copy file path" })

-- Window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window veritcally" })
keymap.set("n", "<leader>sh", "<C-w>h", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

-- Tab management
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })

-- Diagnostics
keymap.set("n", "<leader>ed", "<cmd>lua vim.diagnostic.enable()<CR>", { desc = "Show diagnostics" })
keymap.set("n", "<leader>dd", "<cmd>lua vim.diagnostic.disable()<CR>", { desc = "Hide diagnostics" })

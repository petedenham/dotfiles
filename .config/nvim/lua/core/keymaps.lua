vim.g.mapleader = " "

local keymap = vim.keymap

-- Move up and down the page
keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Move down the page and recenter the line on the cursor" })
keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Move up the page and recenter the line on the cursor" })

-- Node
keymap.set("n", "<leader>js", "<cmd>!node %<CR>", { desc = "Run current file in Node" })

-- Copy current file name/path
keymap.set("n", "<leader>cf", '<cmd>let @+ = expand("%:t")<CR>', { desc = "Copy file name" })
keymap.set("n", "<leader>cp", '<cmd>let @+ = expand("%:p")<CR>', { desc = "Copy file path" })

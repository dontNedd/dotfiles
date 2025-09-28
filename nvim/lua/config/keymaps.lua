local function normal_map(lhs, rhs, opts)
	vim.keymap.set("n", lhs, rhs, opts or {})
end

local function insert_map(lhs, rhs, opts)
	vim.keymap.set("i", lhs, rhs, opts or {})
end

local function visual_map(lhs, rhs, opts)
	vim.keymap.set("v", lhs, rhs, opts or {})
end

normal_map("<leader>e", ":Ex<CR>") 
normal_map("<Esc>", "<cmd>nohlsearch<CR>")
normal_map("<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list"})
normal_map("C-h", "<C-w><C-h>")
normal_map("C-l", "<C-w><C-l>")
normal_map("C-j", "<C-w><C-j>")
normal_map("C-k", "<C-w><C-k>")



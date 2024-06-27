-- Space as leader
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>q", "<cmd>confirm q<CR>", { desc = "Quit ", silent = true })
vim.keymap.set("n", "<leader>w", ":w!<CR>", { desc = "Write", silent = true })

-- Always use soft move in normal and visual mode
vim.api.nvim_set_keymap("n", "k", "gk", { noremap = true, silent = true, silent = true })
vim.api.nvim_set_keymap("n", "j", "gj", { noremap = true, silent = true, silent = true })
vim.api.nvim_set_keymap("v", "j", "gj", { noremap = true, silent = true, silent = true })
vim.api.nvim_set_keymap("v", "k", "gk", { noremap = true, silent = true, silent = true })

-- Move row up and down in normal, insert and visual mode.
vim.api.nvim_set_keymap("n", "<A-j>", ":m .+1<CR>==", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<A-k>", ":m .-2<CR>==", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<A-k>", "<ESC>:m .-2<CR>==gi", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<A-j>", "<ESC>:m .+1<CR>==gi", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<A-j>", ":m '>+1<cr>gv-gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<A-k>", ":m '<-2<cr>gv-gv", { noremap = true, silent = true })

vim.api.nvim_set_keymap("v", "<", "<gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", ">", ">gv", { noremap = true, silent = true })

-- File explorer
vim.keymap.set("n", "<leader>e", ":Neotree<CR>", { desc = "Explore", silent = true })

-- Telescope/search mappings
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "Search Help" })
vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "Search Keymaps" })
vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "Search Files" })
vim.keymap.set("n", "<leader>ss", builtin.builtin, { desc = "Search Select Telescope" })
vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "Search current Word" })
vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "Search by Grep" })
vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "Search Diagnostics" })
vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "Search Resume" })
vim.keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = 'Search Recent Files ("." for repeat)' })
-- vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })

-- Formatting
vim.keymap.set({ "n", "v" }, "<leader>cf", function()
	require("conform").format({
		lsp_fallback = true,
		async = false,
		timeout_ms = 500,
	})
end, { desc = "Format file or range (in visual mode)", silent = true })

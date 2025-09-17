local map = vim.keymap.set

-- Space as leader
vim.g.mapleader = ' '

map('n', '<leader>q', '<cmd>confirm q<CR>', { desc = 'Quit', silent = true })
map('n', '<leader>w', ':w!<CR>', { desc = 'Write', silent = true })

-- Always use soft move in normal and visual mode
map('n', 'k', 'gk', { noremap = true, silent = true })
map('n', 'j', 'gj', { noremap = true, silent = true })
map('v', 'j', 'gj', { noremap = true, silent = true })
map('v', 'k', 'gk', { noremap = true, silent = true })

-- Move row up and down in normal, insert and visual mode.
map('n', '<A-j>', ':m .+1<CR>==', { noremap = true, silent = true })
map('n', '<A-k>', ':m .-2<CR>==', { noremap = true, silent = true })
map('i', '<A-k>', '<ESC>:m .-2<CR>==gi', { noremap = true, silent = true })
map('i', '<A-j>', '<ESC>:m .+1<CR>==gi', { noremap = true, silent = true })
map('v', '<A-j>', ":m '>+1<cr>gv-gv", { noremap = true, silent = true })
map('v', '<A-k>', ":m '<-2<cr>gv-gv", { noremap = true, silent = true })

map('v', '<', '<gv', { noremap = true, silent = true })
map('v', '>', '>gv', { noremap = true, silent = true })

-- File explorer
map('n', '<leader>e', ':Neotree toggle<CR>', { desc = 'Toggle Neotree', silent = true })
map('n', '<leader>o', ':Neotree focus<CR>', { desc = 'Focus Neotree', silent = true })

-- Telescope/search mappings
local telescope = require 'telescope.builtin'
map('n', '<leader>fh', telescope.help_tags, { desc = 'Search Help' })
map('n', '<leader>fk', telescope.keymaps, { desc = 'Search Keymaps' })
map('n', '<leader>ff', telescope.find_files, { desc = 'Search Files' })
map('n', '<leader>fs', telescope.builtin, { desc = 'Search Select Telescope' })
map('n', '<leader>fw', telescope.grep_string, { desc = 'Search current Word' })
map('n', '<leader>fg', telescope.live_grep, { desc = 'Search by Grep' })
map('n', '<leader>fd', telescope.diagnostics, { desc = 'Search Diagnostics' })
map('n', '<leader>fr', telescope.resume, { desc = 'Search Resume' })
map('n', '<leader>f.', telescope.oldfiles, { desc = 'Search Recent Files ("." for repeat)' })
map('n', '<leader>fq', telescope.git_files, { desc = 'Search among Git Files' })

-- LSP mappings
map('n', '<leader>cd', telescope.lsp_definitions, { desc = 'Goto Definition' })
map('n', '<leader>cr', telescope.lsp_references, { desc = 'Goto References' })
map('n', '<leader>ci', telescope.lsp_implementations, { desc = 'Goto Implementation' })
map('n', '<leader>cd', telescope.lsp_type_definitions, { desc = 'Type Definition' })
map('n', '<leader>cs', telescope.lsp_document_symbols, { desc = 'Document Symbols' })
map('n', '<leader>cR', vim.lsp.buf.rename, { desc = 'Rename' })
map('n', '<leader>ca', vim.lsp.buf.code_action, { desc = 'Code Action' })

map('n', '<A-p>', function() vim.diagnostic.jump { count = 1, float = true } end, { desc = 'Next Diagnostic' })

map('n', '<A-o>', function() vim.diagnostic.jump { count = -1, float = true } end, { desc = 'Prev Diagnostic' })

map('n', '<leader>cq', vim.diagnostic.setloclist, { desc = 'Quickfix Diagnostics' })
map('n', 'K', vim.lsp.buf.hover, { desc = 'Hover Documentation' })

-- Bufferline
map('n', 'gt', ':BufferLineCycleNext<CR>', { desc = 'Bufferline next', silent = true })
map('n', 'gT', ':BufferLineCyclePrev<CR>', { desc = 'Bufferline prev', silent = true })
map('n', 'gw', ':bdelete<CR>', { desc = 'Close buffer', silent = true })

-- Friendly snippets

local ls = require 'luasnip'
map('i', '<C-CR>', function() ls.expand() end, { desc = 'Expand snippet' })

-- Formatting
map(
	{ 'n', 'v' },
	'<leader>cf',
	function()
		require('conform').format {
			lsp_fallback = true,
			async = false,
			timeout_ms = 500,
		}
	end,
	{ desc = 'Format file or selection', silent = true }
)

map('n', '<C-CR>', ':lua vim.lsp.buf.code_action()<CR>', { desc = 'Fix' })
map('n', '<C-+>', ':lua vim.diagnostic.open_float()<CR>', { desc = 'Float' })

map('n', '<leader>ut', function()
	if vim.o.showtabline == 2 then
		vim.o.showtabline = 0
	else
		vim.o.showtabline = 2
	end
end, { desc = 'Toggle tab line' })

map(
	'n',
	'<leader>ui',
	'<cmd>lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())<CR>',
	{ desc = 'Toggle inlay hints' }
)

map('n', '<leader>uw', '<cmd>set wrap!<CR>', { desc = 'Set wrap' })

vim.pack.add {
	{ src = 'https://github.com/windwp/nvim-ts-autotag' },
	{ src = 'https://github.com/kylechui/nvim-surround' },
	{ src = 'https://github.com/nvim-neo-tree/neo-tree.nvim' },
	{ src = 'https://github.com/windwp/nvim-autopairs' },
	{ src = 'https://github.com/numToStr/Comment.nvim' },
	{ src = 'https://github.com/folke/which-key.nvim' },
	{ src = 'https://github.com/lervag/vimtex' },
	{ src = 'https://github.com/neovim/nvim-lspconfig' },
	{ src = 'https://github.com/mfussenegger/nvim-lint' },
	{ src = 'https://github.com/stevearc/conform.nvim' },
	{ src = 'https://github.com/nvim-telescope/telescope.nvim' },
	{ src = 'https://github.com/nvim-treesitter/nvim-treesitter' },
	{ src = 'https://github.com/nvim-treesitter/nvim-treesitter-context' },
	{ src = 'https://github.com/hrsh7th/cmp-nvim-lsp' },
	{ src = 'https://github.com/hrsh7th/nvim-cmp' },
	{ src = 'https://github.com/L3MON4D3/LuaSnip' },
	{ src = 'https://github.com/ellisonleao/gruvbox.nvim' },
	{ src = 'https://github.com/nvim-lualine/lualine.nvim' },
	{ src = 'https://github.com/akinsho/bufferline.nvim' },

	-- Dependencies
	{ src = 'https://github.com/rafamadriz/friendly-snippets' },
	{ src = 'https://github.com/nvim-telescope/telescope-fzf-native.nvim' },
	{ src = 'https://github.com/nvim-telescope/telescope-ui-select.nvim' },
	{ src = 'https://github.com/nvim-lua/plenary.nvim' },
	{ src = 'https://github.com/nvim-tree/nvim-web-devicons' },
	{ src = 'https://github.com/MunifTanjim/nui.nvim' },
}

vim.lsp.enable {
	'lua_ls',
	'clangd',
	'bashls',
	'pyright',
	'jdtls',
	'ts_ls',
	'eslint',
	'tailwindcss',
	'yamlls',
	'rust_analyzer',
	'tinymist',
	'hls',
	'nil_ls',
	'dockerls',
}

vim.lsp.config('jdtls', {
	cmd = {
		'jdtls',
		'--jvm-arg=-javaagent:' .. os.getenv 'HOME' .. '/.local/share/lombok/lombok.jar',
	},
})

local inlayHintsSettings = {
	includeInlayParameterNameHints = 'literals',
	includeInlayParameterNameHintsWhenArgumentMatchesName = true,
	includeInlayVariableTypeHints = true,
	includeInlayFunctionParameterTypeHints = true,
	includeInlayVariableTypeHintsWhenTypeMatchesName = true,
	includeInlayPropertyDeclarationTypeHints = true,
	includeInlayFunctionLikeReturnTypeHints = true,
	includeInlayEnumMemberValueHints = true,
}

vim.lsp.config('ts_ls', {
	cmd = { 'typescript-language-server', '--stdio' },
	settings = {
		typescript = {
			inlayHints = { inlayHintsSettings },
		},
		javascript = {
			inlayHints = { inlayHintsSettings },
		},
	},
})

require('conform').setup {
	formatters_by_ft = {
		lua = { 'stylua' },
		svelte = { 'prettierd', 'prettier' },
		javascript = { 'prettierd', 'prettier' },
		typescript = { 'prettierd', 'prettier' },
		javascriptreact = { 'prettierd', 'prettier' },
		typescriptreact = { 'prettierd', 'prettier' },
		json = { 'prettierd', 'prettier' },
		graphql = { 'prettierd', 'prettier' },
		java = { 'google-java-format' },
		kotlin = { 'ktlint' },
		markdown = { 'prettierd', 'prettier' },
		bash = { 'beautysh' },
		rust = { 'rustfmt' },
		yaml = { 'yamlfix' },
		css = { 'prettierd', 'prettier' },
		scss = { 'prettierd', 'prettier' },
		c = { 'clang_format' },
		cpp = { 'clang_format' },
		typst = { 'typstfmt' },
	},

	format_on_save = {
		lsp_fallback = true,
		timeout_ms = 500,
	},
}

require('neo-tree').setup {
	filesystem = {
		follow_current_file = {
			enabled = true,
		},
	},
	event_handlers = {
		{
			event = 'neo_tree_buffer_enter',
			handler = function(_) vim.opt_local.relativenumber = true end,
		},
		{
			event = 'neo_tree_popup_input_ready',
			handler = function()
				-- enter input popup with normal mode by default.
				vim.cmd 'stopinsert'
			end,
		},
		{
			event = 'neo_tree_popup_input_ready',
			---@param args { bufnr: integer, winid: integer }
			handler = function(args)
				-- map <esc> to enter normal mode (by default closes prompt)
				-- don't forget `opts.buffer` to specify the buffer of the popup.
				vim.keymap.set('i', '<esc>', vim.cmd.stopinsert, { noremap = true, buffer = args.bufnr })
			end,
		},
	},
}

require('nvim-surround').setup {}
require('nvim-autopairs').setup {}
require('telescope').setup {
	extensions = {
		['ui-select'] = {
			require('telescope.themes').get_dropdown(),
		},
	},
}
require('nvim-treesitter.configs').setup {
	ensure_installed = {
		'lua',
		'javascript',
		'typescript',
		'html',
		'rust',
		'css',
		'scss',
		'python',
		'java',
		'c',
		'cpp',
		'tsx',
	},
	highlight = {
		enable = true,
	},
	indent = {
		enable = true,
	},
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
}
require('nvim-ts-autotag').setup {}
require('bufferline').setup {
	options = {
		mode = 'buffers',
		separator_style = 'slant',
		show_buffer_close_icons = true,
		show_close_icons = false,
	},
}

pcall(require('telescope').load_extension, 'fzf')
pcall(require('telescope').load_extension, 'ui-select')

local cmp = require 'cmp'

cmp.setup {
	sources = {
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' },
	},
	mapping = {
		['<CR>'] = cmp.mapping.confirm { select = false },
		['<C-e>'] = cmp.mapping.abort(),
		['<Up>'] = cmp.mapping.select_prev_item { behavior = 'select' },
		['<Down>'] = cmp.mapping.select_next_item { behavior = 'select' },
		['<S-Tab>'] = cmp.mapping.select_prev_item { behavior = 'insert' },
		['<Tab>'] = cmp.mapping.select_next_item { behavior = 'insert' },
	},
}

require('lualine').setup {
	sections = {
		lualine_a = { 'mode' },
		lualine_b = { 'branch', 'diagnostics' },
		lualine_c = { 'filename' },
		lualine_x = {},
		lualine_y = { 'filetype' },
		lualine_z = { 'lspstatus' },
	},
}

-- lua/keymappings.lua
require 'keymappings'

-- lua/options.lua
require 'options'

-- Snippets
require('luasnip.loaders.from_lua').load { paths = '~/.config/nvim/lua/my_snippets' }
require 'my_snippets.dates'

-- theme
vim.cmd.colorscheme 'gruvbox'

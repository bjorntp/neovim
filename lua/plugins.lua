return {

	-- Theme
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
	},

	-- Lualine as statusbar
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },

		config = function()
			require("lualine").setup()
		end,
	},

	-- LaTeX
	{ "lervag/vimtex" },

	-- Keymapping screen
	{
		"folke/which-key.nvim",
		event = "VimEnter", -- Sets the loading event to 'VimEnter'
		config = function() -- This is the function that runs, AFTER loading
			require("which-key").setup()

			-- Document existing key chains
			require("which-key").register({
				["<leader>c"] = { name = "Code", _ = "which_key_ignore" },
				["<leader>s"] = { name = "Search", _ = "which_key_ignore" },
			})
		end,
	},

	-- Fixes tabs
	{
		"tpope/vim-sleuth",
	},

	-- Commenting with gc
	{
		"numToStr/Comment.nvim",
	},

	-- File explorer
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
		config = function()
			require("neo-tree").setup({
				close_if_last_window = true,
				filesystem = {
					filtered_items = {
						hide_dotfiles = false,
					},
					window = {
						mappings = {
							["<CR>"] = "open_nofocus",
						},
					},
					commands = {
						open_nofocus = function(state)
							require("neo-tree.sources.filesystem.commands").open(state)
							vim.schedule(function()
								vim.cmd([[Neotree close]])
							end)
						end,
					},
				},
			})
		end,
	},

	-- Autoparing for certain characters
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		-- Optional dependency
		dependencies = { "hrsh7th/nvim-cmp" },
		config = function()
			require("nvim-autopairs").setup({})
			-- If you want to automatically add `(` after selecting a function or method
			local cmp_autopairs = require("nvim-autopairs.completion.cmp")
			local cmp = require("cmp")
			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
		end,
	},

	-- Blankline
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {
			exclude = {
				filetypes = {
					"dashboard",
				},
			},
		},
	},

	-- Todo och andra kommentarer
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
	},

	-- Navigering
	{
		"ggandor/leap.nvim",
		config = function()
			require("leap").create_default_mappings()
		end,
	},
	-- LSP, linting, completion and more
	require("plugins.lsplint"),

	-- Dashboard
	require("plugins.alpha"),

	-- Debug
	require("plugins.debug"),

	-- Search among files, help, keymaps with more
	require("plugins.telescope"),
}

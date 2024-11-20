return {
	{
		"folke/which-key.nvim",
		event = "VimEnter", -- Sets the loading event to 'VimEnter'
		config = function() -- This is the function that runs, AFTER loading
			require("which-key").setup()
		end,
		keys = {
			{
				"<leader>f",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Search",
			},
			{
				"<leader>c",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Code related",
			},
			{
				"<leader>s",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Surround",
			},
		},
	},
}

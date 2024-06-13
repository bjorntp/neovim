return {
	{
		"nvimdev/dashboard-nvim",
		event = "VimEnter",
		config = function()
			require("dashboard").setup({
				theme = "doom",
				config = {
					header = {
						"                                  ",
						"                                  ",
						"    ____      ______  ____  _   __",
						"   / __ )    / / __ \\/ __ \\/ | / /",
						"  / __  |_  / / / / / /_/ /  |/ / ",
						" / /_/ / /_/ / /_/ / _, _/ /|  /  ",
						"/_____/\\____/\\____/_/ |_/_/ |_/   ",
						"                                  ",
					}, --your header
					center = {
						{
							-- icon = " ",
							desc = "New file",
							key = "n",
							keymap = "",
							key_format = " %s",
							action = "ene!",
						},
						{
							-- icon = " ",
							icon_hl = "Title",
							desc = "Find File           ",
							desc_hl = "String",
							key = "f",
							keymap = "",
							key_hl = "Number",
							key_format = " %s",
							action = "Telescope find_files",
						},
						{
							-- icon = " ",
							desc = "Recent files",
							key = "r",
							keymap = "",
							key_format = " %s",
							action = "Telescope oldfiles",
						},
						{
							-- icon = " ",
							desc = "File browser",
							key = "e",
							keymap = "",
							key_format = " %s",
							action = "Neotree",
						},
						{
							-- icon = " ",
							desc = "Live grep",
							key = "g",
							keymap = "",
							key_format = " %s",
							action = "Telescope live_grep",
						},
						{
							-- icon = " ",
							desc = "Lazy",
							key = "l",
							keymap = "",
							key_format = " %s",
							action = "Lazy",
						},
						{
							-- icon = " ",
							desc = "Quit",
							key = "q",
							keymap = "",
							key_format = " %s",
							action = "q!",
						},
					},
					footer = {}, --your footer
				},
			})
		end,
		dependencies = { { "nvim-tree/nvim-web-devicons" } },
	},
}

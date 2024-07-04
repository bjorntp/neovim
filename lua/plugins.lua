return {
	-- Theme
	require("plugins.catppuccin"),

	-- Lualine as statusbar
	require("plugins.lualine"),

	-- LaTeX
	require("plugins.vimtex"),

	-- Keymapping screen
	require("plugins.whichkey"),

	-- Commenting with gc
	require("plugins.comment"),

	-- File explorer
	require("plugins.neotree"),

	-- Autoparing for certain characters
	require("plugins.autopair"),

	-- Blankline
	require("plugins.blankline"),

	-- Todo och andra kommentarer
	require("plugins.todo"),

	-- LSP, linting, completion and more
	require("plugins.lsplint"),

	-- Dashboard
	require("plugins.alpha"),

	-- Debug
	-- require("plugins.debug"),

	-- Search among files, help, keymaps with more
	require("plugins.telescope"),

	-- Noice command line
	require("plugins.noice"),

	-- Surround
	require("plugins.nvim-surround"),
}

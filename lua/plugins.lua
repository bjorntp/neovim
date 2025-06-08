return {
  -- Theme
  require("plugins.colorschemes"),

  require("plugins.dap"),

  -- Lualine as statusbar
  -- require("plugins.lualine"),

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

  -- LSP
  require("plugins.lsp"),

  -- Linting
  require("plugins.linting"),

  -- Format code
  require("plugins.autoformat"),

  -- Completion
  require("plugins.completion"),

  -- Dashboard
  -- require("plugins.alpha"),

  -- Search among files, help, keymaps with more
  require("plugins.telescope"),

  -- Treesitter
  require("plugins.treesitter"),

  -- Surround
  require("plugins.nvim-surround"),

  -- Markdown
  require("plugins.markdown"),

  -- Vimwiki
  -- require("plugins.vimwiki"),

  -- Obsidian
  require("plugins.obsidian"),
}

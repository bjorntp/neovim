return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" }, -- icons for the branch symbol
    config = function()
      require("lualine").setup({
        options           = {
          theme = "auto",          -- pick colours from your colorscheme
          section_separators = "", -- remove “▊” style bars
          component_separators = "",
          disabled_filetypes = {
            statusline = { "neo-tree", "TelescopePrompt" }, -- hide here
            winbar     = {},
          },
        },

        -- active window
        sections          = {
          lualine_a = { "mode" }, -- NORMAL / INSERT / etc.
          lualine_b = { { "branch", icon = "" } }, -- Git branch
          lualine_c = { "filename" }, -- still minimal: no filename
          lualine_x = { "" }, -- leave empty
          lualine_y = {
            { "diagnostics", sources = { "nvim_diagnostic" } }, -- LSP counts
          },
          lualine_z = { "location" }, -- Ln 10, Col 3
        },

        -- inactive windows (splits you’re not focused on)
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { "filename" }, -- just show the file name
          lualine_x = { "location" },
          lualine_y = {},
          lualine_z = {},
        },

        tabline           = {}, -- none
        winbar            = {}, -- none
        inactive_winbar   = {},
        extensions        = {}, -- add “nvim-tree”, “fugitive” etc. if you ever need them
      })
    end,
  },
}

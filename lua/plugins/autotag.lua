-- lua/plugins/autotag.lua
return {
  "windwp/nvim-ts-autotag",
  event = "InsertEnter", -- load only when you start typing
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  config = function()
    -- put the autotag section inside your existing Treesitter setup
    require("nvim-treesitter.configs").setup {
      autotag = {
        enable = true,
        -- expand / trim this list to taste
        filetypes = {
          "html", "xml",
          "javascript", "javascriptreact",
          "typescript", "typescriptreact", "tsx",
          "vue", "svelte",
        },
      },
    }
  end,
}

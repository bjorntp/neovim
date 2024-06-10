return {
  -- lazy.lua plugins
  {
    "vimwiki/vimwiki",
    init = function()
      vim.g.vimwiki_list = {
        {
          path = "~/workspace/vimwiki",
          syntax = "default",
          ext = ".wiki",
          diary_rel_path = "output/",
          template_path = "~/workspace/vimwiki/templates/",
          template_default = "template",
          template_ext = ".html",
        },
        {
          path = "~/workspace/dagbok",
          syntax = "markdown",
          ext = ".md",
          diary_rel_path = "./",
          template_path = "~/workspace/vimwiki/templates/",
          template_default = "template",
          template_ext = ".html",
        },
      }
      vim.g.vimwiki_key_mappings = {
        global = 0,
      }
    end,
  },
}

-- Lazy plugin manager
require("lazy_init")
require("lazy").setup(require("plugins"))

-- lua/keymappings.lua
require("keymappings")

-- lua/options.lua
require("options")

-- theme
vim.cmd.colorscheme("catppuccin-mocha")

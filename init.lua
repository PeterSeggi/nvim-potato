require "potato.options"
require "potato.keymaps"
require "potato.plugins"
require "potato.colorscheme"
require "potato.cmp"
require "potato.lsp"
require "potato.scope"
require "potato.sitter"
require "potato.autopairs"
require "potato.gitsigns"
require "potato.tree"
require "potato.lualine"
require "potato.startup"
require "potato.bufferline"
require "potato.null-ls"
require "potato.autotag"

-- Deja esto comentado a menos que estes con un proyecto que utilice prettier. Sino te va a aparecer un warning cuando no lo usas
-- require "potato.prettier"

-- Mental note: due to the transparent thingy working with other configs like bufferline its better to keep it at the bottom
-- require "potato.transparent"

-- DO NOT uncomment this if there is a lualine config already uncommented
-- Full disclosure, not sure what would happen but feel free to try
-- require "potato.feline"

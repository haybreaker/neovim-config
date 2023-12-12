local harpoon_mark = require("harpoon.mark")
local harpoon_ui = require("harpoon.ui")

-- Add
vim.keymap.set("n", "Ha", harpoon_mark.add_file)

-- UI
vim.keymap.set("n", "Hv", harpoon_ui.toggle_quick_menu)

-- Nav
vim.keymap.set("n", "Hj", harpoon_ui.nav_next)
vim.keymap.set("n", "Hk", harpoon_ui.nav_prev)

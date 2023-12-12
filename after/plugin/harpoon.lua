local harpoon_mark = require("harpoon.mark")
local harpoon_ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>haf", harpoon_mark.add_file)
vim.keymap.set("n", "<leader>hvf", harpoon_ui.toggle_quick_menu)


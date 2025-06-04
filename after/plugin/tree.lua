-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- Set highlights for nvim-tree diagnostics
vim.api.nvim_set_hl(0, "NvimTreeDiagnosticError", { link = "DiagnosticError" })
vim.api.nvim_set_hl(0, "NvimTreeDiagnosticWarning", { link = "DiagnosticWarning" })

require("nvim-tree").setup({
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 30,
  },
  diagnostics = {
    enable = true,
    show_on_dirs = true, -- This is crucial for showing diagnostics on folders
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  renderer = {
    group_empty = true,
    icons = {
        web_devicons = {
            file = {
                enable = true,
                color = true
            },
            folder = {
                enable = true,
                color = true
            }
        }
    }
  },
  filters = {
    dotfiles = true,
  },
})

local treesitter = require('nvim-treesitter.configs');

treesitter.setup {

  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = { "javascript", "dart", "cpp", "c", "lua", "vim", "vimdoc", "query", "rust" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },

  indent = {
    disable = { "dart" },
    enable = true
  },

  fold = {
    enable = true
  }

}

-- treesitter folding setup
vim.o.foldmethod = 'expr'
vim.o.foldexpr = 'nvim_treesitter#foldexpr()'
vim.o.foldlevelstart = 99
vim.o.foldminlines = 1

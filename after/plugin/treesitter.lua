require'nvim-treesitter.configs'.setup {
  -- Customized from initial install by video of Primagen


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
}

local treesitter = require('nvim-treesitter.configs');

treesitter.setup {

  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = {
    "bash",
    "c",
    "c_sharp", -- Often needed for Unity or .NET projects
    "cpp",
    "css",
    "dart",
    "dockerfile", -- Crucial for DevOps/Containerization
    "go",       -- Added as requested
    "html",
    "java",
    "javascript",
    "json",          -- Ubiquitous config format
    "lua",
    "markdown",      -- For README.md files
    "markdown_inline", -- Needed for syntax highlighting inside Markdown
    "python",        -- Essential for AI/Data/Scripting
    "query",
    "regex",         -- Very helpful for debugging regex
    "ruby",
    "rust",
    "sql",
    "terraform", -- Common for Infrastructure as Code
    "tsx",     -- TypeScript with React/JSX
    "typescript",
    "vim",
    "vimdoc",
    "yaml", -- Standard for CI/CD workflows and K8s
  },

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

local lsp_zero = require('lsp-zero')

-- Create the augroup once, outside of on_attach for AutoFormatting
vim.api.nvim_create_augroup("AutoFormatting", { clear = true })

lsp_zero.on_attach(function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }

  -- LSP Keymaps
  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)  -- Go Definition
  vim.keymap.set("n", "gh", function() vim.lsp.buf.hover() end, opts)       -- Go Hover (show signature help/documentation)
  vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end, opts)  -- Go References
  vim.keymap.set("n", "gn", function() vim.lsp.buf.rename() end, opts)      -- Go Rename
  vim.keymap.set("n", "ga", function() vim.lsp.buf.code_action() end, opts) -- Go Code Action
  vim.keymap.set("n", "gf", function() vim.lsp.buf.format() end, opts)      -- Go Format (on demand)

  -- Diagnostic Keymaps
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev() end, opts) -- Go to previous diagnostic
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next() end, opts) -- Go to next diagnostic

  -- Additional Useful Keymaps
  vim.keymap.set("n", "gws", function() vim.lsp.buf.workspace_symbol() end, opts) -- Workspace Symbols
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts) -- Signature Help in Insert mode

  -- Auto-format on save
  vim.api.nvim_create_autocmd("BufWritePre", {
    group = "AutoFormatting",
    buffer = bufnr,
    callback = function()
      vim.lsp.buf.format({ async = false })
    end,
    desc = "Format file on save"
  })
end)

-- Automatic Error Details Popup
vim.diagnostic.config({
  virtual_text = true, -- Show virtual text for diagnostics
  float = {
    focusable = false,
    style = "minimal",
    border = "rounded"
  }
})

vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
    vim.diagnostic.open_float(nil, { cursor_pos = true })
  end,
  desc = "Show diagnostic float on CursorHold"
})


-- Mason and LSP Setup
require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = { 'clangd', 'ts_ls', 'rust_analyzer' },
  handlers = {
    lsp_zero.default_setup,
    clangd = function()
      require('lspconfig').clangd.setup({
        cmd = { "clangd", "--fallback-style={BasedOnStyle: Google, ColumnLimit: 125, BinPackParameters: false}" },
        on_attach = lsp_zero.on_attach,
      })
    end,
    lua_ls = function()
      local lua_opts = lsp_zero.nvim_lua_ls()
      require('lspconfig').lua_ls.setup(lua_opts)
    end,
  }
})

-- Completion (cmp) Setup
local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }

cmp.setup({
  sources = {
    { name = 'path' },
    { name = 'nvim_lsp' },
    { name = 'nvim_lua' },
  },
  formatting = lsp_zero.cmp_format(),
  mapping = cmp.mapping.preset.insert({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<Tab>'] = cmp.mapping.select_next_item(cmp_select),
    ['<Space>'] = cmp.mapping.confirm({ select = false }),
    ['<CR>'] = cmp.mapping.confirm({ select = false })
  }),
})

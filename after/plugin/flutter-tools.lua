local flutter_tools = require('flutter-tools')

flutter_tools.setup {
  debugger = {
    enabled = true,
    run_via_dap = true,
  },
  dev_log = {
    enabled = false,
  },
  dev_tools = {
    autostart = true,         -- autostart devtools server if not detected
    auto_open_browser = true, -- Automatically opens devtools in the browser
  },
  lsp = {
    settings = {
        lineLength = 125, -- <-- correct location
        documentation = true
    },
    on_attach = function(client, bufnr)
        vim.api.nvim_create_autocmd("BufWritePre", {
          group = vim.api.nvim_create_augroup("LspFormatOnSave", { clear = true }),
          buffer = bufnr,
          callback = function()
            vim.lsp.buf.format({ async = false, timeout_ms = 10000, bufnr = bufnr })
          end,
          desc = "Format file on save"
        })
    end
  },
}

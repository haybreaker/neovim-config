local flutter_tools = require('flutter-tools')
local lsp_zero = require('lsp-zero')

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
    capabilities = lsp_zero.get_capabilities(),
    on_attach = function(client, bufnr)
      lsp_zero.on_attach(client, bufnr)
    end
  },
}

vim.g.dart_format_on_save = false

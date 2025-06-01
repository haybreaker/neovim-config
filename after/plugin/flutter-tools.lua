local flutter_tools = require('flutter-tools')

flutter_tools.setup{
    debugger = {
        enabled = true,
        run_via_dap = true, 
      },
}

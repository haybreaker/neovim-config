local dap, dapui = require("dap"), require("dapui")
local dapgo = require("dap-go")


-- Debugging Adapters Setup 

-- Go Debugging Adapter Setup (using Mason installed adapter)
dapgo.setup {
  dap_configurations = {
    {
      -- Must be "go" or it will be ignored by the plugin
      type = "go",
      name = "Attach remote",
      mode = "remote",
      request = "attach",
    },
  },
  -- delve configurations
  delve = {
    path = "dlv",
    initialize_timeout_sec = 20,
    port = "${port}",
    args = {},
    build_flags = "",
  },
}

-- LLDB Debugger Adapater Setup (C++, C, Rust)
dap.adapters.codelldb = {
    type = 'server',
    port = '13000',
    executable = {
        command = 'codelldb',
        args = { '--port', '13000' },
    },
}

dap.configurations.cpp = {
    {
        type = 'codelldb',
        request = 'launch',
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd()..'/build/', 'file')
        end,
        cwd = '${workspaceFolder}',
        terminal = 'integrated'
    }
}

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp

dapui.setup()

dap.listeners.before.attach.dapui_config = function()
  dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
  dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
  dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
  dapui.close()
end

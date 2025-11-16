return {
  -- core dap plugin
  {
    "mfussenegger/nvim-dap",
  },

  -- dap-ui for scopes, variables, and call stack
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio", -- required for async operations
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      dapui.setup()

      -- Automatically open/close UI on debug sessions
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end,
  },

  -- virtual text to show variable values inline
  {
    "theHamsta/nvim-dap-virtual-text",
    dependencies = { "mfussenegger/nvim-dap" },
    config = function()
      require("nvim-dap-virtual-text").setup()
    end,
  },

  -- Python DAP adapter
  {
    "mfussenegger/nvim-dap-python",
    dependencies = { "mfussenegger/nvim-dap" },
    ft = "python",
    config = function()
      local dap = require("dap")
      local dap_python = require("dap-python")

      -- set your Python interpreter here
      dap_python.setup("python3") -- replace with your venv if needed

      -- configure adapters
      dap.adapters.python = {
        type = "executable",
        command = "python3",
        args = { "-m", "debugpy.adapter" },
      }

      -- Python configurations
      dap.configurations.python = {
        {
          type = "python",
          request = "launch",
          name = "Current File",
          program = "${file}",
          pythonPath = function()
            return "python3" -- replace with venv path if needed
          end,
        },
        {
          type = "python",
          request = "launch",
          name = "Django server",
          program = "${workspaceFolder}/manage.py",
          args = { "runserver", "--noreload" },
          django = true,
          pythonPath = function()
            return "python3"
          end,
        },
      }
    end,
  },
}

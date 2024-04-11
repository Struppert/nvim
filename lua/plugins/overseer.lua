return {
  {
    "stevearc/overseer.nvim",
    lazy = false,
    opts = {
      templates = { strategy = "toggleterm", "builtin" },
      actions = {
        ["My custom action"] = {
          desc = "This is an optional description. It may be omitted.",
          -- Optional function that will determine when this action is available
          condition = function(task)
            if task.name == "foobar" then
              return true
            else
              return false
            end
          end,
          run = function(task)
            -- Your custom logic here
          end,
        },

        -- Disable built-in actions by setting them to 'false'
        watch = false,
      },
    },

    init = function()
      require("overseer").register_template({
        name = "B5841 zis5 mit msbuild",
        builder = function()
          return {
            cmd = {
              "powershell",
              "-Command",
              "& {msbuild /property:GenerateFullPaths=true /t:build /p:Configuration=Debug /p:Platform='x64' ZIS50.sln -maxcpucount:8}",
            },
            cwd = "f:/git/B5841/all/windows", -- Setze das Arbeitsverzeichnis
            env = {}, -- Umgebungsvariablen, falls benötigt
          }
        end,
      })
      require("overseer").register_template({
        name = "B5841 zis_hardware mit msbuild",
        builder = function()
          return {
            cmd = {
              "powershell",
              "-Command",
              "& {msbuild /property:GenerateFullPaths=true /t:build /p:Configuration=Debug /p:Platform='x64' hardware.vcxproj -maxcpucount:8}",
            },
            cwd = "f:/git/B5841/all/windows/mfc/hardware", -- Setze das Arbeitsverzeichnis
            env = {}, -- Umgebungsvariablen, falls benötigt
          }
        end,
      })
      require("overseer").register_template({
        name = "B5841 zis_agent mit msbuild",
        builder = function()
          return {
            cmd = {
              "powershell",
              "-Command",
              "& {msbuild /property:GenerateFullPaths=true /t:build /p:Configuration=Debug /p:Platform='x64' agent.vcxproj -maxcpucount:8}",
            },
            cwd = "f:/git/B5841/all/windows/mfc/agent", -- Setze das Arbeitsverzeichnis
            env = {}, -- Umgebungsvariablen, falls benötigt
          }
        end,
      })
    end,
  },
}

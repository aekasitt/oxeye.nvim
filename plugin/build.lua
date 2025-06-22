-- plugin/build.lua --

local Job = require('plenary.job')

if vim.fn.executable('sg') == 0 then
  vim.schedule(function()
    vim.notify('Installing ast-grep for oxeye.nvim…', vim.log.levels.INFO)
  end)
  Job:new({
    args = { 'install', 'ast-grep', '--locked' },
    command = 'cargo',
    on_stdout = function(_, data)
      if data then
        if not data:match("^%s*Updating crates.io index") and not data:match("^%s*Compiling") then
          vim.schedule(function()
            vim.notify(data, vim.log.levels.INFO)
          end)
        end
      end
    end,
    on_stderr = function(_, data)
      if data then
        if not data:match("^%s*Updating crates.io index") and not data:match("^%s*Compiling") then
          vim.schedule(function()
            vim.notify(data, vim.log.levels.INFO)
          end)
        end
      end
    end,
    on_exit = function(_, return_val)
      if return_val ~= 0 then
        vim.schedule(function()
          vim.notify('Unable to install ast-grep required for plugin', vim.log.levels.ERROR)
        end)
      else
        vim.schedule(function()
          vim.notify('Successfully installed ast-grep', vim.log.levels.SUCCESS)
        end)
      end
    end,
  }):start()
end

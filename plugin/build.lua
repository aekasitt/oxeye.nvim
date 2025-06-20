-- plugin/build.lua --

local Job = require('plenary.job')

Job:new({
  args = { 'install', 'ast-grep', '--locked' },
  command = 'cargo',
  on_exit = function(_, build_return_val)
    if build_return_val ~= 0 then
      error('Unable to install ast-grep required for plugin')
    else
      print('Successfully installed ast-grep')
    end
  end,
}):start()

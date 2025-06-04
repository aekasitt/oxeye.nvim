-- plugin/oxeye.lua --

local has_plenary, _ = pcall(require, 'plenary')
if not has_plenary then
  return
end

require('oxeye').setup()

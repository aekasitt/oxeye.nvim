-- plugin/oxeye.lua --

local has_fzf_lua, _ = pcall(require, 'fzf-lua')
local has_plenary, _ = pcall(require, 'plenary')

if not has_fzf_lua or not has_plenary then
  error('Unmet dependencies for oxeye.nvim')
end

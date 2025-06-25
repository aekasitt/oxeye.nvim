-- plugin/oxeye.lua --

local has_fzf_lua, _ = pcall(require, 'fzf-lua')
local has_plenary, _ = pcall(require, 'plenary')

if not has_fzf_lua or not has_plenary then
  vim.schedule(function()
    vim.notify('Unmet dependencies for oxeye.nvim', vim.log.levels.ERROR)
  end)
end

vim.api.nvim_create_user_command('Oxeye', function()
  require('oxeye').live_grep()
end, { desc = 'Syntax-aware live grep (ast-grep + fzf)' })

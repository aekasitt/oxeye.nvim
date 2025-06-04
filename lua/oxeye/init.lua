-- lua/oxeye/init.lua --

local M = {}
local state = require('oxeye/state')

local load_game_of_life = function()
  local ok, lib = pcall(require, 'game_of_life')
  if not ok then
    error("Failed to load conway library: " .. tostring(lib))
    return nil
  end
  return lib
end

M.setup = function()
  vim.api.nvim_set_keymap(
    'n',
    '<leader>cw',
    ':lua require("oxeye").start()<CR>',
    {noremap = true, silent = true }
  )
  print('setup completed')
end

M.start = function()
  local lib = load_game_of_life()
  if lib == nil then
    return
  end
  state.buf = vim.api.nvim_create_buf(false, true)
  local width = vim.api.nvim_get_option('columns')
  local height = vim.api.nvim_get_option('lines')
  state.height = math.ceil(height * 0.6)
  state.width = math.ceil(width * 0.6)
  local row = math.ceil((height - state.height) / 2)
  local col = math.ceil((width - state.width) / 2)
  local opts = {
    relative = 'editor',
    width = state.width,
    height = state.height,
    row = row,
    col = col,
    style = 'minimal',
    border = 'rounded'
  }
  state.win = vim.api.nvim_open_win(state.buf, true, opts)
  vim.api.nvim_set_option_value('wrap', false, { win = state.win })
  vim.api.nvim_set_option_value('cursorline', true, { win = state.win })
  vim.api.nvim_set_current_win(state.win)
  -- vim.api.nvim_buf_set_option(state.buf, 'modifiable', true)
  lib.run()
  -- vim.api.nvim_win_close(state.win, true)
end

return M

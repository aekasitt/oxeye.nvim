-- lua/oxeye/init.lua --

local M = {}
local fzf = require 'fzf-lua'

M.search = function()
  local query = vim.fn.input('Query: ', '')
  fzf.fzf_exec(
    'sg --context 0 --heading never --pattern "' .. query .. '" 2>/dev/null',
    {
      actions = {
        ['default'] = fzf.actions.file_edit,
        ['ctrl-q'] = {
          fn = fzf.actions.file_edit_or_qf,
          prefix = 'select-all+',
        },
      },
      exec_empty_query = false,
      previewer = 'builtin',
    }
  )
end

M.live_grep = function()
  fzf.fzf_live(
    'sg --context 0 --heading never --pattern <query> 2>/dev/null',
    {
      actions = {
        ['default'] = fzf.actions.file_edit,
        ['ctrl-q'] = {
          fn = fzf.actions.file_edit_or_qf,
          prefix = 'select-all+'
        }
      },
      exec_empty_query = false,
      previewer = 'builtin',
    }
  )
end

return M

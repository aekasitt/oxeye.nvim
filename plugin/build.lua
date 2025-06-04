-- plugin/build.lua --

local Job = require('plenary.job')

-- locate plugin directory and derive path to binary --
local source_path = debug.getinfo(1, 'S').source:sub(2)
local script_dir = source_path:match('(.*/)') or './'
local plugin_dir = script_dir:match('(.*/)[^/]+/$') or './'
local binary_path = 'target/release/libgame_of_life'
if vim.fn.has('win32') == 1 then
  binary_path = binary_path .. '.dll'
elseif vim.fn.has('macunix') == 1 then
  binary_path = binary_path .. '.dylib'
else  -- linux
  binary_path = binary_path .. '.so'
end

-- build binary --
Job:new({
  args = { 'build', '--release' },
  command = 'cargo',
  cwd = plugin_dir,
  on_exit = function(_, build_return_val)
    if build_return_val ~= 0 then
      error('Unable to build binary necessary for plugin')
    else
      -- move binary to lua modules --
      Job:new({
        args = { binary_path, 'lua/game_of_life.so' },
        command = 'mv',
        cwd = plugin_dir,
        on_exit = function(_, move_return_val)
          if move_return_val ~= 0 then
            error('Unable to relocate built binary to module directory')
          end
        end,
      }):start()
    end
  end,
}):start()

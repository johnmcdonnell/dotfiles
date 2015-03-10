-- Load Extensions
local window      = require "mjolnir.window"
local hotkey      = require "mjolnir.hotkey"
local grid        = require "mjolnir.bg.grid"

-- Set up hotkey combinations
local mash      = {"cmd", "ctrl"}
local mashshift = {"cmd", "shift", "ctrl"}
local mashalt = {"cmd", "alt", "ctrl"}

-- Set grid size.
grid.MARGINX = 0
grid.MARGINY = 0
grid.GRIDWIDTH = 2
grid.GRIDHEIGHT = 2

local gridset = function(x, y, w, h)
    return function()
        cur_window = window.focusedwindow()
        grid.set(
            cur_window,
            {x=x, y=y, w=w, h=h},
            cur_window:screen()
        )
    end
end

hotkey.bind(mash, ';', function() grid.snap(window.focusedwindow()) end)
hotkey.bind(mash, "'", function() fnutils.map(window.visiblewindows(), grid.snap) end)


hotkey.bind(mash, "D", function()
  local win = window.focusedwindow()
  local f = win:frame()
  f.x = f.x + 10
  win:setframe(f)
end)

hotkey.bind(mash, 'H', gridset(0, 0, 1, 2)) -- left half
hotkey.bind(mash, 'L', gridset(1, 0, 1, 2)) -- right half
hotkey.bind(mash, 'K', gridset(0, 0, 2, 1)) -- top half
hotkey.bind(mash, 'J', gridset(0, 1, 2, 1)) -- bottom half

hotkey.bind(mashalt, 'J', gridset(0, 0, 1, 1)) -- upper left
hotkey.bind(mashalt, 'L', gridset(1, 0, 1, 1)) -- upper right
hotkey.bind(mashalt, 'K', gridset(1, 1, 1, 1)) -- lower right
hotkey.bind(mashalt, 'H', gridset(0, 1, 1, 1)) -- lower left

hotkey.bind(mash,      'U', grid.maximize_window)

hotkey.bind(mashshift, 'left', grid.pushwindow_nextscreen)
hotkey.bind(mashshift, 'right', grid.pushwindow_prevscreen)

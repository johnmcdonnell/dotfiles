-- REMINDER: Hammerspoon will throw `attempt to index a nil value` if you don't
-- give it Accessibility permissions in System Preferences.

-- Load Extensions
-- local hints = require "mjolnir.th.hints"

-- Set up hotkey combinations
local mash      = {"cmd", "ctrl"}
local mashshift = {"cmd", "shift", "ctrl"}
local mashalt = {"cmd", "alt", "ctrl"}

-- Set grid size.
-- hs.grid.MARGINX = 0
-- hs.grid.MARGINY = 0
-- hs.grid.GRIDWIDTH = 2
-- hs.grid.GRIDHEIGHT = 2

hs.grid.setGrid('2x2')
hs.window.animationDuration = 0


local gridset = function(x, y, w, h)
    return function()
        local win = hs.window.focusedWindow()
        local f = win:frame()

        f.x = x
        f.y = y
        f.w = w
        f.h = h
        hs.grid.set(win, f)
    end
end

hs.hotkey.bind(mash, ';', function() grid.snap(hs.window.focusedWindow()) end)
hs.hotkey.bind(mash, "'", function() fnutils.map(hs.window.visibleWindows(), grid.snap) end)


hs.hotkey.bind(mash, "D", function()
  local win = window.focusedwindow()
  local f = win:frame()
  f.x = f.x + 10
  win:setframe(f)
end)

hs.hotkey.bind(mash, 'left', gridset(0, 0, 1, 2)) -- left half
hs.hotkey.bind(mash, 'right', gridset(1, 0, 1, 2)) -- right half
hs.hotkey.bind(mash, 'up', gridset(0, 0, 2, 1)) -- top half
hs.hotkey.bind(mash, 'down', gridset(0, 1, 2, 1)) -- bottom half

hs.hotkey.bind(mashshift, 'up', gridset(0, 0, 1, 1)) -- upper left
hs.hotkey.bind(mashshift, 'right', gridset(1, 0, 1, 1)) -- upper right
hs.hotkey.bind(mashshift, 'down', gridset(1, 1, 1, 1)) -- lower right
hs.hotkey.bind(mashshift, 'left', gridset(0, 1, 1, 1)) -- lower left

hs.hotkey.bind(mash,      'U', hs.grid.maximizeWindow)

hs.hotkey.bind(mashalt, 'left', hs.grid.pushWindowNextScreen)
hs.hotkey.bind(mashalt, 'right', hs.grid.pushWindowPrevScreen)

-- hotkey.bind(mash,"e",hints.windowHints)


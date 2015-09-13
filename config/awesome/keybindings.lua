--[[
    Nice Theme:
     Powerarrow Darker Awesome WM config 2.0
     github.com/copycat-killer
--]]
local menubar = require("menubar")
local awful = require("awful")

-- {{{ Key bindings
globalkeys = awful.util.table.join(
    awful.key({ modkey,           }, "Left",   awful.tag.viewprev       ),
    awful.key({ modkey,           }, "Right",  awful.tag.viewnext       ),
    awful.key({ modkey,           }, "Escape", awful.tag.history.restore),
    awful.key({ modkey,           }, "w", function () mymainmenu:show() end),

    -- Window Selection
    -- 'T', 'N' select different windows on the same screen.
    -- 'H', 'S' select different screens.
    awful.key({ modkey,           }, "t",
        function ()
            awful.client.focus.byidx(-1)
            if client.focus then client.focus:raise() end
        end),
    awful.key({ modkey,           }, "n",
        function ()
            awful.client.focus.byidx(1)
            if client.focus then client.focus:raise() end
        end),
    awful.key({ modkey,           }, "h", function () awful.screen.focus_relative( 1) end),
    awful.key({ modkey,           }, "s", function () awful.screen.focus_relative(-1) end),

    -- Layout manipulation
    awful.key({ modkey, "Control" }, "h", function () awful.tag.incnmaster( 1)      end),
    awful.key({ modkey, "Control" }, "s", function () awful.tag.incnmaster(-1)      end),
    awful.key({ modkey, "Control" }, "t", function () awful.tag.incncol( 1)         end),
    awful.key({ modkey, "Control" }, "n", function () awful.tag.incncol(-1)         end),
    awful.key({ modkey, "Shift"   }, "h", function () awful.tag.incmwfact(-0.05)    end),
    awful.key({ modkey, "Shift"   }, "s", function () awful.tag.incmwfact( 0.05)    end),
    awful.key({ modkey, "Shift"   }, "t", function () awful.client.swap.byidx(-1)  end),
    awful.key({ modkey, "Shift"   }, "n", function () awful.client.swap.byidx(1)  end),
    awful.key({ modkey,           }, "u", awful.client.urgent.jumpto),

    awful.key({ modkey,           }, "space", function () awful.layout.inc(layouts,  1) end),
    awful.key({ modkey, "Shift"   }, "space", function () awful.layout.inc(layouts, -1) end),

    awful.key({ modkey,           }, "Tab",
        function ()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end),

    -- Standard program
    awful.key({ modkey,           }, "Return", function () awful.util.spawn(terminal)     end),
    awful.key({ modkey, "Shift"   }, "b",      function () awful.util.spawn(browser)      end),
    awful.key({ "Mod1", "Control" }, "l",      function () awful.util.spawn(lock_command) end),

    awful.key({ modkey, "Control" }, "r",      function () awesome.restart()              end),
    awful.key({ modkey, "Shift"   }, "q",      function () awesome.quit()                 end),

    -- Menubar
    awful.key({ modkey }, "r", function() menubar.show() end),

    awful.key({ modkey }, "x",
              function ()
                  awful.prompt.run({ prompt = "Run Lua code: " },
                  mypromptbox[mouse.screen].widget,
                  awful.util.eval, nil,
                  awful.util.getdir("cache") .. "/history_eval")
              end),
    -- bind PrintScrn to capture a screen
    awful.key({}, "Print",
              function()
                  awful.util.spawn("capscr",false)
              end)
)

-- These are commands that can be performed on a specific window.
-- Ex: Make current window new master, kill this window, etc...
clientkeys = awful.util.table.join(
    --awful.key({ modkey,           }, "f",      function (c) c.fullscreen = not c.fullscreen  end),
    awful.key({ modkey, "Control" }, "c",      function (c) c:kill()                         end),
    awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle                     ),
    awful.key({ modkey, "Control" }, "m",      function (c) c:swap(awful.client.getmaster()) end),
    awful.key({ modkey,           }, "o",      awful.client.movetoscreen                        ),
    awful.key({ modkey,           }, "m",
        function (c)
            c.maximized_horizontal = not c.maximized_horizontal
            c.maximized_vertical   = not c.maximized_vertical
        end)
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it works on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
    globalkeys = awful.util.table.join(globalkeys,
        -- View tag only.
        awful.key({ modkey }, "#" .. i + 9,
                  function ()
                        local screen = mouse.screen
                        local tag = awful.tag.gettags(screen)[i]
                        if tag then
                           awful.tag.viewonly(tag)
                        end
                  end),
        -- Toggle tag.
        awful.key({ modkey, "Control" }, "#" .. i + 9,
                  function ()
                      local screen = mouse.screen
                      local tag = awful.tag.gettags(screen)[i]
                      if tag then
                         awful.tag.viewtoggle(tag)
                      end
                  end),
        -- Move client to tag.
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = awful.tag.gettags(client.focus.screen)[i]
                          if tag then
                              awful.client.movetotag(tag)
                          end
                     end
                  end),
        -- Toggle tag.
        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = awful.tag.gettags(client.focus.screen)[i]
                          if tag then
                              awful.client.toggletag(tag)
                          end
                      end
                  end))
end

-- These are the mouse buttons.
clientbuttons = awful.util.table.join(
    awful.button({ }, 1, function (c) client.focus = c; c:raise() end),
    awful.button({ modkey }, 1, awful.mouse.client.move),
    awful.button({ modkey }, 3, awful.mouse.client.resize))

-- Set keys
root.keys(globalkeys)
-- }}}

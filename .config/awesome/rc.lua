require("awful")
require("awful.autofocus")
require("awful.rules")
-- Theme handling library
require("beautiful")
-- Notification library
require("naughty")
require("vicious")
require("vicious.contrib")

awesome.add_signal("debug::error", function (err)
                      naughty.notify({ preset = naughty.config.presets.critical,
                                       title = "Oops, there were errors during startup!",
                                       text = err })
                                   end)

-- {{{ Variable definitions
-- Themes define colours, icons, and wallpapers
beautiful.init("/home/sotakone/.config/awesome/themes/zenburn_custom/theme.lua")

hn = io.popen("hostname")
hostname = hn:read()
hn:close()

if hostname == 'rusty' then
   awesome.font = "DejaVu Sans 7"
else
   awesome.font = "DejaVu Sans 9"
end

-- This is used later as the default terminal and editor to run.
terminal = "urxvtc"
editor = os.getenv("EDITOR") or "vim"
editor_cmd = terminal .. " -e " .. editor

-- Default modkey.
-- Usually, Mod4 is the key with a logo between Control and Alt.
-- If you do not like this or do not have such a key,
-- I suggest you to remap Mod4 to another key using xmodmap or other tools.
-- However, you can use another modifier like Mod1, but it may interact with others.
modkey = "Mod4"

-- Table of layouts to cover with awful.layout.inc, order matters.
layouts =
{
    awful.layout.suit.floating,
    -- awful.layout.suit.tile,
    awful.layout.suit.tile.left,
    awful.layout.suit.tile.bottom,
    -- awful.layout.suit.tile.top,
    awful.layout.suit.fair,
    -- awful.layout.suit.fair.horizontal,
    -- awful.layout.suit.spiral,
    -- awful.layout.suit.spiral.dwindle,
    awful.layout.suit.max,
    -- awful.layout.suit.max.fullscreen,
    awful.layout.suit.magnifier
}
-- }}}

-- {{{ Tags
-- Define a tag table which hold all screen tags.
tags = {
  names = { "[1]", "[2]", "[3]", "[4]", "[5]", "[6]", "[7]", "[8]", "[9]", nil },
  layout = { layouts[2], layouts[2], layouts[4], layouts[1], layouts[1], layouts[4], layouts[2], layouts[5], layouts[2], nil }
}

tags_per_screen = math.ceil(#tags.names / screen.count())
for s = 1, screen.count() do
    screen_tags = {
      names = {},
      layout = {}
    }

    for t = (s - 1) * tags_per_screen + 1, s * tags_per_screen do
      if tags.names[t] then
        table.insert(screen_tags.names, tags.names[t])
        table.insert(screen_tags.layout, tags.layout[t])
      end
    end

    tags[s] = awful.tag(screen_tags.names, s, screen_tags.layout or layouts[1])
end
-- }}}

-- {{{ Menu
-- Create a laucher widget and a main menu
myawesomemenu = {
   { "manual", terminal .. " -e man awesome" },
   { "edit config", editor_cmd .. " " .. awful.util.getdir("config") .. "/rc.lua" },
   { "restart", awesome.restart },
   { "quit", awesome.quit }
}

mymainmenu = awful.menu({ items = { { "awesome", myawesomemenu, beautiful.awesome_icon },
                                    { "open terminal", terminal }
                                  }
                        })

mylauncher = awful.widget.launcher({ image = image(beautiful.awesome_icon),
                                    menu = mymainmenu })

-- }}}

-- {{{ Wibox
-- Create a textclock widget
mytextclock = awful.widget.textclock({ align = "right" })

-- Create a systray
mysystray = widget({ type = "systray" })

-- Create a wibox for each screen and add it
mywibox = {}
mypromptbox = {}
mylayoutbox = {}
mytaglist = {}
mytaglist.buttons = awful.util.table.join(
                    awful.button({ }, 1, awful.tag.viewonly),
                    awful.button({ modkey }, 1, awful.client.movetotag),
                    awful.button({ }, 3, awful.tag.viewtoggle),
                    awful.button({ modkey }, 3, awful.client.toggletag),
                    awful.button({ }, 4, awful.tag.viewnext),
                    awful.button({ }, 5, awful.tag.viewprev)
                    )
mytasklist = {}
mytasklist.buttons = awful.util.table.join(
                     awful.button({ }, 1, function (c)
                                              if not c:isvisible() then
                                                  awful.tag.viewonly(c:tags()[1])
                                              end
                                              client.focus = c
                                              c:raise()
                                          end),
                     awful.button({ }, 3, function ()
                                              if instance then
                                                  instance:hide()
                                                  instance = nil
                                              else
                                                  instance = awful.menu.clients({ width=250 })
                                              end
                                          end),
                     awful.button({ }, 4, function ()
                                              awful.client.focus.byidx(1)
                                              if client.focus then client.focus:raise() end
                                          end),
                     awful.button({ }, 5, function ()
                                              awful.client.focus.byidx(-1)
                                              if client.focus then client.focus:raise() end
                                          end))

-- Initialize widgets
---------------------------------------------------

-- Create fraxbat widget
fraxbat = widget({ type = "textbox", name = "fraxbat", align = "right" })
fraxbat.text = '        ';

-- Globals used by fraxbat
fraxbat_st= nil
fraxbat_ts= nil
fraxbat_ch= nil
fraxbat_now = nil
fraxbat_est= nil

-- Function for updating fraxbat
function hook_fraxbat (tbw, bat)
  -- Battery Present?
  local fh= io.open("/sys/class/power_supply/"..bat.."/present", "r")
  if fh == nil then
    tbw.text="No Bat"
    return(nil)
  end
  local stat= fh:read()
  fh:close()
  if tonumber(stat) < 1 then
    tbw.text="Bat Not Present"
    return(nil)
  end

  -- Status (Charging, Full or Discharging)
  fh= io.open("/sys/class/power_supply/"..bat.."/status", "r")
  if fh == nil then
    tbw.text="N/S"
    return(nil)
  end
  stat= fh:read()
  fh:close()
  if stat == 'Full' then
    tbw.text="100%"
    return(nil)
  end
  stat= string.upper(string.sub(stat, 1, 1))
  if stat == 'D' then tag= 'i' else tag= 'b' end

  -- Remaining + Estimated (Dis)Charging Time
  local charge= nil
  fh= io.open("/sys/class/power_supply/"..bat.."/charge_full_design", "r")
  if fh ~= nil then
    local full= fh:read()
    fh:close()
    full= tonumber(full)
    if full ~= nil then
      fh= io.open("/sys/class/power_supply/"..bat.."/charge_now", "r")
      if fh ~= nil then
        local now= fh:read()
        local est=
          fh:close()
        if fraxbat_st == stat then
          delta= os.difftime(os.time(),fraxbat_ts)
          est= math.abs(fraxbat_ch - now)
          if delta > 30 and est > 0 then
            est= delta/est
            if now == fraxbat_now then
              est= fraxbat_est
            else
              fraxbat_est= est
              fraxbat_now= now
            end
            if stat == 'D' then
              est= now*est
            else
              est= (full-now)*est
            end
            local h= math.floor(est/3600)
            est= est - h*3600
            est= string.format(' %02d:%02d',h,math.floor(est/60))
          else
            est= ''
          end
        else
          fraxbat_st= stat
          fraxbat_ts= os.time()
          fraxbat_ch= now
          fraxbat_now= nil
          fraxbat_est= nil
        end
        charge=': <'..tag..'>'..tostring(math.ceil((100*now)/full))..'%</'..tag..'> '..tostring(est)
      end
    end
  end
  tbw.text= stat..charge
end
awful.hooks.timer.register(10, function () hook_fraxbat(fraxbat, 'BAT1') end)

separator = widget({ type = "textbox" })
separator.text = "  "

long_separator = widget({ type = "textbox" })
long_separator.text = " :: "

cpuwidget = awful.widget.graph()
cpuwidget:set_width(50)
cpuwidget:set_background_color("#111111")
cpuwidget:set_gradient_colors({ "#00aaff", "#4bbfff", "#99daff" })
cpuwidget:set_gradient_angle(0)
vicious.register(cpuwidget, vicious.widgets.cpu, "$1", 1)

memwidget = awful.widget.graph()
memwidget:set_width(50)
memwidget:set_background_color("#111111")
memwidget:set_gradient_colors({ "#84c30b", "#e0ffa5" })
memwidget:set_gradient_angle(0)
vicious.register(memwidget, vicious.widgets.mem, "$1", 1)

-- netwidget = awful.widget.graph()
-- netwidget:set_width(50)
-- netwidget:set_background_color("#111111")
-- netwidget:set_gradient_colors({ "#84c30b", "#e0ffa5" })
-- netwidget:set_gradient_angle(0)
netwidget = widget({ type = "textbox" })
netwidget.width = 130
vicious.register(netwidget, vicious.contrib.net, '<span color="#CC9393"><b><big>↓</big></b>${total down_mb} MB</span>  <span color="#7F9F7F"><b><big>↑</big></b>${total up_kb} KB</span>', 1)

-- Initialize THERMAL widget
thermalwidget  = widget({ type = "textbox" })
-- Register widget
vicious.register(thermalwidget, vicious.widgets.thermal, "$1°C ", 20, { "thermal_zone0", "sys"} )

for s = 1, screen.count() do
    -- Create a promptbox for each screen
    mypromptbox[s] = awful.widget.prompt({ layout = awful.widget.layout.horizontal.leftright })
    -- Create an imagebox widget which will contains an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    mylayoutbox[s] = awful.widget.layoutbox(s)
    mylayoutbox[s]:buttons(awful.util.table.join(
                           awful.button({ }, 1, function () awful.layout.inc(layouts, 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(layouts, -1) end),
                           awful.button({ }, 4, function () awful.layout.inc(layouts, 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(layouts, -1) end)))
    -- Create a taglist widget
    mytaglist[s] = awful.widget.taglist(s, awful.widget.taglist.label.all, mytaglist.buttons)

    -- Create a tasklist widget
    mytasklist[s] = awful.widget.tasklist(function(c)
                                              return awful.widget.tasklist.label.currenttags(c, s)
                                          end, mytasklist.buttons)

    -- Create the wibox
    mywibox[s] = awful.wibox({ position = "top", screen = s })
    -- Add widgets to the wibox - order matters
    widgets = {
        {
            -- mylauncher,
            mytaglist[s],
            mypromptbox[s],
            layout = awful.widget.layout.horizontal.leftright
        },
        mylayoutbox[s],
        mytextclock,
        mytasklist[s],
        layout = awful.widget.layout.horizontal.rightleft
      }

    if s == 1 then
      insert_pos = 4
      table.insert(widgets, insert_pos, cpuwidget.widget)
      table.insert(widgets, insert_pos, separator)
      table.insert(widgets, insert_pos, memwidget.widget)
      table.insert(widgets, insert_pos, separator)
      table.insert(widgets, insert_pos, thermalwidget)
      table.insert(widgets, insert_pos, separator)
      table.insert(widgets, insert_pos, fraxbat)
      table.insert(widgets, insert_pos, separator)
      table.insert(widgets, insert_pos, netwidget)
      table.insert(widgets, insert_pos, mysystray)
      table.insert(widgets, insert_pos, separator)
    end

    mywibox[s].widgets = widgets;
end
-- }}}

-- {{{ Mouse bindings
root.buttons(awful.util.table.join(
    awful.button({ }, 3, function () mymainmenu:toggle() end),
    awful.button({ }, 4, awful.tag.viewnext),
    awful.button({ }, 5, awful.tag.viewprev)
))
-- }}}

function next_client ()
  awful.client.focus.byidx(1)
  if client.focus then client.focus:raise() end
end

function previous_client ()
  awful.client.focus.byidx(-1)
  if client.focus then client.focus:raise() end
end

-- {{{ Key bindings
globalkeys = awful.util.table.join(
    awful.key({ modkey,           }, "Left",   awful.tag.viewprev       ),
    awful.key({ modkey,           }, "Right",  awful.tag.viewnext       ),
    awful.key({ modkey,           }, "Escape", awful.tag.history.restore),

    awful.key({ modkey,           }, "j", next_client),
    awful.key({ modkey,           }, "k", previous_client),
    awful.key({ modkey, "Control" }, "Left", previous_client),
    awful.key({ modkey, "Control" }, "Right", next_client),
    awful.key({ modkey,           }, "w", function () mymainmenu:show({keygrabber=true}) end),

    -- Layout manipulation
    awful.key({ modkey, "Shift"   }, "j", function () awful.client.swap.byidx(  1)    end),
    awful.key({ modkey, "Shift"   }, "k", function () awful.client.swap.byidx( -1)    end),
    awful.key({ modkey,           }, "Tab", function () awful.screen.focus_relative( 1) end),
    awful.key({ modkey,           }, "u", awful.client.urgent.jumpto),
    awful.key({ "Mod1"            }, "Tab", next_client),

    -- Standard program
    awful.key({ modkey,           }, "Return", function () awful.util.spawn(terminal) end),
    awful.key({ modkey, "Control" }, "r", awesome.restart),
    awful.key({ modkey, "Shift"   }, "q", awesome.quit),

    awful.key({ modkey,           }, "l",     function () awful.tag.incmwfact( 0.05)    end),
    awful.key({ modkey,           }, "h",     function () awful.tag.incmwfact(-0.05)    end),
    awful.key({ modkey, "Shift"   }, "h",     function () awful.tag.incnmaster( 1)      end),
    awful.key({ modkey, "Shift"   }, "l",     function () awful.tag.incnmaster(-1)      end),
    awful.key({ modkey, "Control" }, "h",     function () awful.tag.incncol( 1)         end),
    awful.key({ modkey, "Control" }, "l",     function () awful.tag.incncol(-1)         end),
    awful.key({ modkey,           }, "space", function () awful.layout.inc(layouts,  1) end),
    awful.key({ modkey, "Shift"   }, "space", function () awful.layout.inc(layouts, -1) end),

    -- Prompt
    awful.key({ modkey },            "r",     function () mypromptbox[mouse.screen]:run() end),

    awful.key({ modkey }, "x",
              function ()
                  awful.prompt.run({ prompt = "Run Lua code: " },
                  mypromptbox[mouse.screen].widget,
                  awful.util.eval, nil,
                  awful.util.getdir("cache") .. "/history_eval")
              end)
)

clientkeys = awful.util.table.join(
    awful.key({ modkey,           }, "f",      function (c) c.fullscreen = not c.fullscreen  end),
    awful.key({ modkey, "Shift"   }, "c",      function (c) c:kill()                         end),
    awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle                     ),
    awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end),
    awful.key({ modkey,           }, "o",      awful.client.movetoscreen                        ),
    awful.key({ modkey, "Shift"   }, "r",      function (c) c:redraw()                       end),
    awful.key({ modkey,           }, "t",      function (c) c.ontop = not c.ontop            end),
    awful.key({ modkey,           }, "n",      function (c) c.minimized = not c.minimized    end),
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
        awful.key({ modkey }, "#" .. i + 9,
                  function ()
                    local screen = math.ceil(i / tags_per_screen)
                    local tag_number = (i % (tags_per_screen + 1)) + 1;
                    if i <= tags_per_screen then
                      tag_number = i
                    end

                    if tags[screen][tag_number] then
                      awful.tag.viewonly(tags[screen][tag_number])
                    end
                  end),
        awful.key({ modkey, "Control" }, "#" .. i + 9,
                  function ()
                    local screen = math.ceil(i / tags_per_screen)
                    local tag_number = (i % (tags_per_screen + 1)) + 1;
                    if i <= tags_per_screen then
                      tag_number = i
                    end

                    if tags[screen][tag_number] then
                      awful.tag.viewtoggle(tags[screen][tag_number])
                    end
                  end),
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
                  function ()
                    local screen = math.ceil(i / tags_per_screen)
                    local tag_number = (i % (tags_per_screen + 1)) + 1;
                    if i <= tags_per_screen then
                      tag_number = i
                    end

                    if client.focus and tags[screen][tag_number] then
                      awful.client.movetotag(tags[screen][tag_number])
                    end
                  end),
        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
                  function ()
                    local screen = math.ceil(i / tags_per_screen)
                    local tag_number = (i % (tags_per_screen + 1)) + 1;
                    if i <= tags_per_screen then
                      tag_number = i
                    end

                    if client.focus and tags[screen][tag_number] then
                      awful.client.toggletag(tags[screen][tag_number])
                    end
                  end))
end

clientbuttons = awful.util.table.join(
    awful.button({ }, 1, function (c) client.focus = c; c:raise() end),
    awful.button({ modkey }, 1, awful.mouse.client.move),
    awful.button({ modkey }, 3, awful.mouse.client.resize))

-- Set keys
root.keys(globalkeys)
-- }}}

-- {{{ Rules
awful.rules.rules = {
    -- All clients will match this rule.
    { rule = { },
      properties = { border_width = beautiful.border_width,
                     border_color = beautiful.border_normal,
                     focus = true,
                     keys = clientkeys,
                     buttons = clientbuttons } },

    -- Emacs compilation window
    { rule = { name = "*compilation*" },
      properties = { floating = true } },

    { rule = { class = "MPlayer" },
      properties = { floating = true } },
    { rule = { class = "pinentry" },
      properties = { floating = true } },
    { rule = { class = "gimp" },
      properties = { floating = true } },
    -- Set Firefox to always map on tags number 2 of screen 1.
    -- { rule = { class = "Firefox" },
    --   properties = { tag = tags[1][2] } },
}
-- }}}

-- {{{ Signals
-- Signal function to execute when a new client appears.
client.add_signal("manage", function (c, startup)
    -- Add a titlebar
    -- awful.titlebar.add(c, { modkey = modkey })

    -- Enable sloppy focus
    c:add_signal("mouse::enter", function(c)
        if awful.layout.get(c.screen) ~= awful.layout.suit.magnifier
            and awful.client.focus.filter(c) then
            client.focus = c
        end
    end)

    if not startup then
        -- Set the windows at the slave,
        -- i.e. put it at the end of others instead of setting it master.
        -- awful.client.setslave(c)

        -- Put windows in a smart way, only if they does not set an initial position.
        if not c.size_hints.user_position and not c.size_hints.program_position then
            awful.placement.no_overlap(c)
            awful.placement.no_offscreen(c)
        end
    end
end)

client.add_signal("focus", function(c) c.border_color = "#FF0000" end)
client.add_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)

os.execute "/home/sotakone/bin/apodwallpaper &"

-- }}}

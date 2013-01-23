
-- {{{ Menu
-- Create a laucher widget and a main menu
myAwesomeMenu = {
   { "Edit Config", editor .. " " .. awful.util.getdir("config") .. "/rc.lua" },
   { "Restart", awesome.restart },
   { "Quit", awesome.quit }
}

myWebMenu = {
   { "Firefox", "firefox" },
   { "Chromium", "chromium-browser" }
}

mySystemMenu = {
   { "Restart", "gksudo reboot" },
   { "Shut down", "gksudo halt" }
}

mymainmenu = awful.menu({ items = { { "awesome", myAwesomeMenu, beautiful.awesome_icon },
                                    { "System", mySystemMenu },
                                    { "Web", myWebMenu },
                                    { "File Explorer", "pcmanfm" },
                                    { "Editor", editor },
                                    { "open terminal", terminal }
                                  }
                        })

mylauncher = awful.widget.launcher({ image = image(beautiful.awesome_icon),
                                     menu = mymainmenu })
-- }}}

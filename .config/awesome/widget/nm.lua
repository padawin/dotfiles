myNmManager = widget({type = "imagebox"})
myNmManager.image = image(awful.util.getdir("config") .. "/icons/network-icon.png")
myNmManager.networkState = 0
myNmManager:buttons(
    awful.util.table.join(
        awful.button(
            { }, 1,
            function ()
                if myNmManager.networkState == 0 then
                    awful.util.spawn("dropbox start")
                    awful.util.spawn("gksudo ifconfig eth0 up")
                    awful.util.spawn("gksudo ifconfig wlan0 up")
                    myNmManager.networkState = 1
                else
                    awful.util.spawn("dropbox stop")
                    awful.util.spawn("gksudo ifconfig eth0 down")
                    awful.util.spawn("gksudo ifconfig wlan0 down")
                    myNmManager.networkState = 0
                end
            end
        )
    )
)

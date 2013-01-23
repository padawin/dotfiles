-- Sound Control
cardid  = 0
channel = "Master"
function volume (mode, widget)
    if mode == "update" then
             local fd = io.popen("amixer -c " .. cardid .. " -- sget " .. channel)
             local status = fd:read("*all")
             fd:close()

        local volume = string.match(status, "(%d?%d?%d)%%")
        volume = string.format("% 3d", volume)

        status = string.match(status, "%[(o[^%]]*)%]")

        if string.find(status, "on", 1, true) then
            volume = "Vol:<span color='green'>" .. volume .. "</span>%"
        else
            volume = "Vol:<span color='red'>" .. volume .. "</span>M"
        end
        widget.text = volume
    elseif mode == "up" then
        io.popen("amixer -q -c " .. cardid .. " sset " .. channel .. " 5%+"):read("*all")
        volume("update", widget)
    elseif mode == "down" then
        io.popen("amixer -q -c " .. cardid .. " sset " .. channel .. " 5%-"):read("*all")
        volume("update", widget)
    else
        io.popen("amixer -c " .. cardid .. " sset " .. channel .. " toggle"):read("*all")
        volume("update", widget)
    end
end

-- Create Volume Control Widget
 tb_volume = widget({ type = "textbox", name = "tb_volume", align = "right" })
 tb_volume:buttons(awful.util.table.join(
    awful.button({ }, 4, function () volume("up", tb_volume) end),
    awful.button({ }, 5, function () volume("down", tb_volume) end),
    awful.button({ }, 1, function () volume("mute", tb_volume) end)
 ))
 volume("update", tb_volume)



-- refresh the Volume Control Widget
tb_volume_timer = timer({ timeout = 10 })
tb_volume_timer:add_signal("timeout", function () volume("update", tb_volume) end)
tb_volume_timer:start()
 --end volume

-- Battery status Widget

-- get the full capacity of the battery
for line in io.lines("/proc/acpi/battery/BAT0/info") do
    bat_stat = string.match(line, "last full capacity:\ +(%d+)")

    if bat_stat then
        -- define stat_tot for reuse later for battery status
        stat_tot = bat_stat
    end
end

function activebat()
    local stat_actu, res

    for line in io.lines("/proc/acpi/battery/BAT0/state") do
        local present = string.match(line, "present:\ +(%a+)")
        if (present == "no") then
            return '<span color="red">not present</span>'
        end
        local status  =  string.match(line, "remaining capacity:\ +(%d+)")
        local state = string.match(line, "charging state:\ +(%a+)")
        if status then
            stat_actu = status
        end
        if state then
            stat_bat = state
        end
    end

    res = string.format("%.2f", (stat_actu/stat_tot) * 100);

    if ((stat_actu/stat_tot) * 100)  < 10 then
        res = '<span color="red">' .. res .. '</span>'
    elseif  ((stat_actu/stat_tot) * 100) < 20 then
        res = '<span color="orange">' .. res .. '</span>'
    elseif  ((stat_actu/stat_tot) * 100)  < 30 then
        res = '<span color="yellow">' .. res .. '</span>'
    elseif ((stat_actu/stat_tot) * 100) >= 100 then
        return '<span color="green">fully charged</span>'
    else
        res = '<span color="green">' .. res .. '</span>'
    end

    if (stat_bat == 'discharging') then
        stat_bat = '<span color="red">discharging</span>'
    elseif (stat_bat == 'charging') then
        stat_bat = '<span color = "green">charging</span>'
    end

    res = res .. '% ' .. stat_bat


    return res
end

batinfo = widget({ type = "textbox" , name = "batinfo" })

-- Assign a hook to update info
-- awful.hooks.timer.register(1, function() batinfo.text = "BAT: " .. activebatrc.lua() .. " |" end)
activebat_timer = timer({timeout = 1})
activebat_timer:add_signal("timeout", function() batinfo.text = "BAT: " .. activebat() end)
activebat_timer:start()

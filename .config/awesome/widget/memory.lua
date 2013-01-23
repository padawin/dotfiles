-- Create a RAM widget giving the MB used by the RAM
-- declare memtot for reuse below
memtot = 2061056

function activeram()
    local active, ramusg, res

    for line in io.lines("/proc/meminfo") do
        for key , value in string.gmatch(line, "(%w+):\ +(%d+).+") do
            if key == "Active" then active = tonumber(value)
            end
        end
    end

    ramusg = (active/memtot)*100

    res = string.format("%.2f", (active/1024))

    if ramusg < 51 then
        res = '<span color="green">' .. res .. '</span> Mo (<span color="green">' .. string.format("%.2f",ramusg) .. '</span>%)'
    elseif  ramusg < 71 then
        res = '<span color="yellow">' .. res .. '</span> Mo (<span color="green">' .. string.format("%.2f",ramusg) .. '</span>%)'
    elseif  ramusg < 86 then
        res = '<span color="orange">' .. res .. '</span> Mo (<span color="green">' .. string.format("%.2f",ramusg) .. '</span>%)'
    else
        res = '<span color="red">' .. res .. '</span> Mo (<span color="green">' .. string.format("%.2f",ramusg) .. '</span>%)'
    end

    return res
end

meminfo = widget({ type = "textbox", name = "meminfo" })

-- Assign a hook to update info
meminfo_timer = timer({timeout = 1})
meminfo_timer:add_signal("timeout", function() meminfo.text = activeram() end)
meminfo_timer:start()

--end ram

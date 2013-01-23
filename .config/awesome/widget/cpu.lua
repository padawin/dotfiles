-- Create a CPU widget
jiffies = {}
function activecpu()
    local s, str

    for line in io.lines("/proc/stat") do
        local cpu,newjiffies = string.match(line, "(cpu)\ +(%d+)")
        if cpu and newjiffies then
            if not jiffies[cpu] then
                jiffies[cpu] = newjiffies
            end
            -- The string.format prevents your task list from jumping around
            -- When CPU usage goes above/below 10%
            str = string.format("%02d", newjiffies-jiffies[cpu])

            if str < "31" then
                str = '<span color="green">' .. str .. '</span>'
            elseif str < "51" then
                str = '<span color="yellow">' .. str .. '</span>'
            elseif str < "70" then
                str = '<span color="orange">' .. str .. '</span>'
            else
                str = '<span color="red">' .. str .. '</span>'
            end

            s = 'CPU: ' .. str .. '% '
            jiffies[cpu] = newjiffies
        end
    end

    return s
end

cpuinfo = widget({ type = "textbox", name = "cpuinfo" })
-- register the hook to update the display
cpuinfo_timer = timer({timeout = 1})
cpuinfo_timer:add_signal("timeout", function() cpuinfo.text = activecpu() end)
cpuinfo_timer:start()

--end cpu

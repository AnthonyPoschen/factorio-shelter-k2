if not storage.shelter then
	storage.shelter = {}
end
if not storage.shelter.script_initialization_status then
	storage.shelter.script_initialization_status = {}
end

local path = "__shelter-k2__/"
require(path .. "scripts/shelter.lua")

-- Load scripts callbacks
--for _, callback in require(path .. "scripts/shelter.lua") do
--    local fn = callback[0] or nil
--    local event_name = callback[1] or nil
--    local filter = callback[2] or nil
--    if event_name == "on_init" then
--        script.on_init(fn)
--    elseif event_name == "on_configuration_changed" then
--        script.on_configuration_changed(fn)
--    else
--        script.on_event(event_name,fn,filter)
--    end
--end

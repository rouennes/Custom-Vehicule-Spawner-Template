local MODDATA_KEY = "FixedVehicles"

-- =====================================================================
-- CONFIG : add your cars here
-- =====================================================================
local FIXED_VEHICLES = {
    {
        id    = "randomID_01",
        vtype = "Base.Template",
        x=6381, y=5337, z=0, -- spawn front of Riverside toolstore
        -- Y = horizontale rotation (yaw) (0 = North, 90 = East, 180 = South, 270 = West)
        angles = {0, 270, 0},
    },
    -- Here you can add more vehicles :
    --{
    --    id    = "randomID_02",
    --    vtype = "Base.Template_02",
    --    x=6385, y=5337, z=0,
    --    angles = {0, 90, 0},
    --},
}

-- =====================================================================
-- INTERNALS
-- =====================================================================

local function mdTable()
    return ModData.getOrCreate(MODDATA_KEY)
end

local function alreadySpawned(id)
    return mdTable()[id] == true
end

local function markSpawned(id)
    local t = mdTable()
    t[id] = true
    ModData.transmit(MODDATA_KEY)
end

local function applyAngles(veh, angles)
    if not veh or type(angles) ~= "table" then return end
    if veh.setPhysicsActive then veh:setPhysicsActive(false) end
    if veh.setAngles then veh:setAngles(angles[1] or 0, angles[2] or 0, angles[3] or 0) end
    if veh.setPhysicsActive then veh:setPhysicsActive(true) end
end

local function trySpawn(def)
    if isClient() then return end
    if alreadySpawned(def.id) then return end

    local sq = getSquare(def.x, def.y, def.z)
    if not sq then return end

    local veh = addVehicle(def.vtype, def.x, def.y, def.z)
    if not veh then return end

    applyAngles(veh, def.angles)
    markSpawned(def.id)
end

local function spawnAll()
    if isClient() then return end
    if type(FIXED_VEHICLES) ~= "table" then return end

    for _,def in ipairs(FIXED_VEHICLES) do
        if type(def) == "table" and def.id and def.vtype then
            trySpawn(def)
        end
    end
end

Events.OnGameStart.Add(spawnAll)

if Events.LoadGridsquare and Events.LoadGridsquare.Add then
    Events.LoadGridsquare.Add(spawnAll)

end

-- SMODS.Atlas {
-- 	key = "JokersAtlas",
-- 	path = "UnanimatedJokers.png",
-- 	px = 71,
-- 	py = 95
-- }

local Animated = NFS.getDirectoryItems(Nuboker.path .. "/Assets/1x/Animated")
for _, filename in ipairs(files) do -- iterate over all files in the directory
	if filename:match(".png$") and filename:match("^_") then -- check lua n wahtever
		SMODS.Atlas {
			key = filename .."Atlas",
			path = "Animated/".. filename,
			px = 71,
			py = 95
		}
	end
end

-- Icon!
-- SMODS.Atlas {
--     key = "modicon",
--     path = "icon.png",
--     px = 250,
--     py = 250,
--     atlas_table = 'ANIMATION_ATLAS'
-- }
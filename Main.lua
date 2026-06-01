--- ahhhhhhhhhhhhhhhhhhh
to_big = to_big or function(x) return x end
function len(table)
	local count = 0
	for i in pairs(table) do
		count = count + 1
	end
	return count
end

-- variables
Nuboker = SMODS.current_mod
Nuboker.ModsUsing = 0
G.effectmanager = {}

-- setup
Nuboker.optional_features = {
	retrigger_joker = true -- Holy Squid
}

-- Fucntions
Nuboker.calculate = function(self, context)
end

function Nuboker.Load_file(file) -- basically just SMODS.load_file() but safer, so i can accidentally have somethign break and it be chill | taken from my old mod :3
	local chunk = SMODS.load_file(file, "Bitters_nub")
	if chunk then
		local ok, func = pcall(chunk)
		if ok then
			print("Bitter's Stuff | loaded ".. file)
			return func
		else
			print("Bitter's Stuff | Failed on ".. file, " : ", func)
		end
	end
	return nil
end

function Nuboker.Load_Dir(directory)
	local files = NFS.getDirectoryItems(Nuboker.path .. "/" .. directory)
	local regular_files = {}

	for _, filename in ipairs(files) do -- iterate over all files in the directory
		local file_path = directory .. "/" .. filename
		if file_path:match(".lua$") then -- check if its lua
			if filename:match("^_") then -- i dont even know
				Nuboker.Load_file(file_path) -- load lua file
			else
				table.insert(regular_files, file_path) -- add non lua to other table
			end
		end
	end

	for _, file_path in ipairs(regular_files) do
		Nuboker.Load_file(file_path) -- load the other things
	end
end

-- okay okay, actually load the objects now
Nuboker.Load_Dir("Scripts")
Nuboker.Load_Dir("Scripts/Items")
Nuboker.Load_Dir("Scripts/Assets")

-- Nuboker.crossmodded = {}

-- for _, file in pairs(NFS.getDirectoryItems(Nuboker.path .. "/Scripts/Compatibility")) do
-- 	local mod = SMODS.find_mod(file)
-- 	if next(mod) then
-- 		Nuboker.crossmodded[mod[1].id] = mod
-- 		Nuboker.Load_Dir("Scripts/Compatibility/".. file)
-- 	end
-- end

-- other stuff

function Nuboker.reset_game_globals(init, _GAME)
end

function Reset_card_picker_selection()
end

Nuboker.reset_game_globals(false, true) -- so sketch but im like a gay twink furry or smth
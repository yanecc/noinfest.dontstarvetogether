local PLANT_DEFS = require("prefabs/farm_plant_defs").PLANT_DEFS
TUNING.GRASS_UNINFECTABLE = GetModConfigData("grass_uninfectable")
TUNING.BERRY_UNINFECTABLE = GetModConfigData("berry_uninfectable")
TUNING.JUICY_UNINFECTABLE = GetModConfigData("juicy_uninfectable")
TUNING.VEGGIE_UNINFECTABLE = GetModConfigData("veggie_uninfectable")
TUNING.LET_PASS_BACKPACKER = GetModConfigData("let_pass_backpacker")
TUNING.LET_PASS_EQUIPMENT = GetModConfigData("let_pass_equipment")
TUNING.SAPLING_MOON_UNINFECTABLE = GetModConfigData("sapling_moon_uninfectable")

AddPrefabPostInit("fertilizer", function(inst)
	inst.components.fertilizer.onappliedfn = function(inst, final_use, doer, target)
		if TUNING.GRASS_UNINFECTABLE and target.prefab == "grass" or
			TUNING.BERRY_UNINFECTABLE and target.prefab == "berrybush" or
			TUNING.BERRY_UNINFECTABLE and target.prefab == "berrybush2" or
			TUNING.JUICY_UNINFECTABLE and target.prefab == "berrybush_juicy" then
			target.noinfest = true
			target:RemoveTag("lunarplant_target")
		end
	end
end)

local function DisinfectPlant(prefab)
	AddPrefabPostInit(prefab, function(inst)
		local oldOnPreLoad = inst.OnPreLoad
		local oldOnSave = inst.OnSave

		inst.OnPreLoad = function(inst, data)
			oldOnPreLoad(inst, data)
			if data then inst.noinfest = data.noinfest end
		end
		inst.OnLoad = function(inst, data)
			if inst.noinfest then inst:RemoveTag("lunarplant_target") end
		end
		inst.OnSave = function(inst, data)
			oldOnSave(inst, data)
			data.noinfest = inst.noinfest
		end
	end)
end

AddComponentPostInit("lunarthrall_plantspawner", function(self)
	self.FindPlant = function(self)
		local plant = nil
		local choices = {}

		for i, herd in ipairs(self.plantherds) do
			local plants = herd.components.herd.members
			for plant, p in pairs(plants) do
				if plant.lunarthrall_plant == nil and plant:HasTag("lunarplant_target") then
					table.insert(choices, plant)
				end
			end
		end

		if #choices > 0 then
			local plant = choices[math.random(1, #choices)]
			return plant
		end
	end
end)

if TUNING.GRASS_UNINFECTABLE then
	DisinfectPlant("grass")
end
if TUNING.BERRY_UNINFECTABLE then
	DisinfectPlant("berrybush")
	DisinfectPlant("berrybush2")
end
if TUNING.JUICY_UNINFECTABLE then
	DisinfectPlant("berrybush_juicy")
end
if TUNING.VEGGIE_UNINFECTABLE then
	for veggie, data in pairs(PLANT_DEFS) do
		AddPrefabPostInit(data.prefab, function(inst)
			inst:RemoveTag("lunarplant_target")
		end)
	end
end
if TUNING.SAPLING_MOON_UNINFECTABLE then
	AddPrefabPostInit("sapling_moon", function(inst)
		inst:RemoveTag("lunarplant_target")
	end)
end
if TUNING.LET_PASS_BACKPACKER then
	AddPrefabPostInit("lunarthrall_plant", function(inst)
		inst.components.combat.shouldaggrofn = function(inst, target)
			local isLastAttacker = inst.components.combat.lastattacker == target
			inst.components.combat.lastattacker = nil
			return not target.components.inventory:EquipHasTag("backpack") or isLastAttacker
		end
	end)
end
if TUNING.LET_PASS_EQUIPMENT then
	AddPrefabPostInit("lunarthrall_plant", function(inst)
		inst.components.combat:AddNoAggroTag(TUNING.LET_PASS_EQUIPMENT)
		inst.components.combat.onhitfn = function(inst, attacker)
			if attacker ~= nil and attacker:HasTag(TUNING.LET_PASS_EQUIPMENT) then
				inst.components.combat:RemoveNoAggroTag(TUNING.LET_PASS_EQUIPMENT)
			end
		end
	end)
end

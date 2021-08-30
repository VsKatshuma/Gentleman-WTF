require("timers")

if GentlemanWTF == nil then
	GentlemanWTF = class( {} )
end

livesRadiant = 40
livesDire = 40

spiritBears = { "empty", "empty", "empty", "empty", "empty", "empty", "empty", "empty", "empty", "empty" }

heroesList = {"npc_dota_hero_antimage","npc_dota_hero_axe","npc_dota_hero_bane","npc_dota_hero_bloodseeker","npc_dota_hero_crystal_maiden","npc_dota_hero_drow_ranger","npc_dota_hero_earthshaker","npc_dota_hero_juggernaut","npc_dota_hero_mirana","npc_dota_hero_morphling","npc_dota_hero_nevermore","npc_dota_hero_phantom_lancer","npc_dota_hero_puck","npc_dota_hero_pudge","npc_dota_hero_razor","npc_dota_hero_sand_king","npc_dota_hero_storm_spirit","npc_dota_hero_sven","npc_dota_hero_tiny","npc_dota_hero_vengefulspirit","npc_dota_hero_windrunner","npc_dota_hero_zuus","npc_dota_hero_kunkka","npc_dota_hero_lina","npc_dota_hero_lion","npc_dota_hero_shadow_shaman","npc_dota_hero_slardar","npc_dota_hero_tidehunter","npc_dota_hero_witch_doctor","npc_dota_hero_lich","npc_dota_hero_riki","npc_dota_hero_enigma","npc_dota_hero_tinker","npc_dota_hero_sniper","npc_dota_hero_necrolyte","npc_dota_hero_warlock","npc_dota_hero_beastmaster","npc_dota_hero_queenofpain","npc_dota_hero_venomancer","npc_dota_hero_faceless_void","npc_dota_hero_skeleton_king","npc_dota_hero_death_prophet","npc_dota_hero_phantom_assassin","npc_dota_hero_pugna","npc_dota_hero_templar_assassin","npc_dota_hero_viper","npc_dota_hero_luna","npc_dota_hero_dragon_knight","npc_dota_hero_dazzle","npc_dota_hero_rattletrap","npc_dota_hero_leshrac","npc_dota_hero_furion","npc_dota_hero_life_stealer","npc_dota_hero_dark_seer","npc_dota_hero_clinkz","npc_dota_hero_omniknight","npc_dota_hero_enchantress","npc_dota_hero_huskar","npc_dota_hero_night_stalker","npc_dota_hero_broodmother","npc_dota_hero_bounty_hunter","npc_dota_hero_weaver","npc_dota_hero_jakiro","npc_dota_hero_batrider","npc_dota_hero_chen","npc_dota_hero_spectre","npc_dota_hero_ancient_apparition","npc_dota_hero_doom_bringer","npc_dota_hero_ursa","npc_dota_hero_spirit_breaker","npc_dota_hero_gyrocopter","npc_dota_hero_alchemist","npc_dota_hero_invoker","npc_dota_hero_silencer","npc_dota_hero_obsidian_destroyer","npc_dota_hero_lycan","npc_dota_hero_brewmaster","npc_dota_hero_shadow_demon","npc_dota_hero_lone_druid","npc_dota_hero_chaos_knight","npc_dota_hero_meepo","npc_dota_hero_treant","npc_dota_hero_ogre_magi","npc_dota_hero_undying","npc_dota_hero_rubick","npc_dota_hero_disruptor","npc_dota_hero_nyx_assassin","npc_dota_hero_naga_siren","npc_dota_hero_keeper_of_the_light","npc_dota_hero_wisp","npc_dota_hero_visage","npc_dota_hero_slark","npc_dota_hero_medusa","npc_dota_hero_troll_warlord","npc_dota_hero_centaur","npc_dota_hero_magnataur","npc_dota_hero_shredder","npc_dota_hero_bristleback","npc_dota_hero_tusk","npc_dota_hero_skywrath_mage","npc_dota_hero_abaddon","npc_dota_hero_elder_titan","npc_dota_hero_legion_commander","npc_dota_hero_techies","npc_dota_hero_ember_spirit","npc_dota_hero_earth_spirit","npc_dota_hero_abyssal_underlord","npc_dota_hero_terrorblade","npc_dota_hero_phoenix","npc_dota_hero_oracle","npc_dota_hero_winter_wyvern","npc_dota_hero_arc_warden","npc_dota_hero_monkey_king","npc_dota_hero_dark_willow","npc_dota_hero_pangolier","npc_dota_hero_grimstroke","npc_dota_hero_void_spirit","npc_dota_hero_snapfire","npc_dota_hero_mars","npc_dota_hero_hoodwink","npc_dota_hero_dawnbreaker"}
-- Contains 121 heroes, up to date to 7.30

heroesCustom = {"npc_dota_hero_antimage","npc_dota_hero_axe","npc_dota_hero_bane","npc_dota_hero_bloodseeker","npc_dota_hero_crystal_maiden","npc_dota_hero_drow_ranger","npc_dota_hero_earthshaker","npc_dota_hero_juggernaut","npc_dota_hero_mirana","npc_dota_hero_morphling","npc_dota_hero_nevermore","npc_dota_hero_phantom_lancer","npc_dota_hero_puck","npc_dota_hero_pudge","npc_dota_hero_razor","npc_dota_hero_sand_king","npc_dota_hero_storm_spirit","npc_dota_hero_sven","npc_dota_hero_tiny","npc_dota_hero_vengefulspirit","npc_dota_hero_windrunner","npc_dota_hero_zuus","npc_dota_hero_kunkka","npc_dota_hero_lina","npc_dota_hero_lion","npc_dota_hero_shadow_shaman","npc_dota_hero_slardar","npc_dota_hero_tidehunter","npc_dota_hero_witch_doctor","npc_dota_hero_lich","npc_dota_hero_riki","npc_dota_hero_enigma","npc_dota_hero_tinker","npc_dota_hero_sniper","npc_dota_hero_necrolyte","npc_dota_hero_warlock","npc_dota_hero_beastmaster","npc_dota_hero_queenofpain","npc_dota_hero_venomancer","npc_dota_hero_faceless_void","npc_dota_hero_skeleton_king","npc_dota_hero_death_prophet","npc_dota_hero_phantom_assassin","npc_dota_hero_pugna","npc_dota_hero_templar_assassin","npc_dota_hero_luna","npc_dota_hero_dragon_knight","npc_dota_hero_dazzle","npc_dota_hero_rattletrap","npc_dota_hero_leshrac","npc_dota_hero_furion","npc_dota_hero_life_stealer","npc_dota_hero_dark_seer","npc_dota_hero_clinkz","npc_dota_hero_omniknight","npc_dota_hero_huskar","npc_dota_hero_night_stalker","npc_dota_hero_broodmother","npc_dota_hero_bounty_hunter","npc_dota_hero_weaver","npc_dota_hero_jakiro","npc_dota_hero_batrider","npc_dota_hero_doom_bringer","npc_dota_hero_ursa","npc_dota_hero_spirit_breaker","npc_dota_hero_gyrocopter","npc_dota_hero_alchemist","npc_dota_hero_invoker","npc_dota_hero_obsidian_destroyer","npc_dota_hero_brewmaster","npc_dota_hero_shadow_demon","npc_dota_hero_lone_druid","npc_dota_hero_chaos_knight","npc_dota_hero_meepo","npc_dota_hero_treant","npc_dota_hero_ogre_magi","npc_dota_hero_undying","npc_dota_hero_rubick","npc_dota_hero_disruptor","npc_dota_hero_nyx_assassin","npc_dota_hero_naga_siren","npc_dota_hero_keeper_of_the_light","npc_dota_hero_slark","npc_dota_hero_medusa","npc_dota_hero_troll_warlord","npc_dota_hero_centaur","npc_dota_hero_magnataur","npc_dota_hero_shredder","npc_dota_hero_bristleback","npc_dota_hero_tusk","npc_dota_hero_skywrath_mage","npc_dota_hero_abaddon","npc_dota_hero_elder_titan","npc_dota_hero_legion_commander","npc_dota_hero_techies","npc_dota_hero_ember_spirit","npc_dota_hero_earth_spirit","npc_dota_hero_abyssal_underlord","npc_dota_hero_terrorblade","npc_dota_hero_phoenix","npc_dota_hero_oracle","npc_dota_hero_winter_wyvern","npc_dota_hero_arc_warden","npc_dota_hero_monkey_king","npc_dota_hero_dark_willow","npc_dota_hero_pangolier","npc_dota_hero_grimstroke","npc_dota_hero_void_spirit","npc_dota_hero_snapfire","npc_dota_hero_mars","npc_dota_hero_hoodwink","npc_dota_hero_dawnbreaker"}
-- Contains 112 heroes, 9 heroes have been removed
-- Removed heroes: "npc_dota_hero_wisp","npc_dota_hero_lycan","npc_dota_hero_viper","npc_dota_hero_ancient_apparition","npc_dota_hero_chen","npc_dota_hero_enchantress","npc_dota_hero_silencer","npc_dota_hero_visage","npc_dota_hero_spectre"

heroesTest = {"npc_dota_hero_windrunner","npc_dota_hero_kunkka"}

function Precache( context )
--	[[
--		PrecacheResource( "model", "*.vmdl", context )
--		PrecacheResource( "soundfile", "*.vsndevts", context )
--		PrecacheResource( "particle", "*.vpcf", context )
--		PrecacheResource( "particle_folder", "particles/folder", context )
--	]]
end

function RespawnTime( eventInfo )
	local killedUnit = EntIndexToHScript( eventInfo.entindex_killed )
	if killedUnit:IsRealHero() then

		-- Deal with Meepo
		if killedUnit:IsClone() then
			killedUnit = killedUnit:GetCloneSource()
		end

		if killedUnit:IsReincarnating() == false then
			killedUnit.HasDied = 1
			if killedUnit:GetTeam() == 2 then
				livesRadiant = livesRadiant - 1
				if livesRadiant < 0 then
					killedUnit:SetRespawnsDisabled( true )
					killedUnit:SetBuyBackDisabledByReapersScythe( true )
					GameRules:SendCustomMessage( "<font color='#00FF00'>Radiant</font> is out of lives!", 0, 0 )
				else
					killedUnit:SetTimeUntilRespawn( killedUnit:GetRespawnTime() / 3 )
					if livesRadiant == 0 then
						GameRules:SendCustomMessage( "<font color='#00FF00'>Radiant</font> just used their last extra life!", 0, 0 )
					elseif livesRadiant == 1 then
						GameRules:SendCustomMessage( "<font color='#00FF00'>Radiant</font> has only 1 extra life left!", 0, 0 )
					else
						GameRules:SendCustomMessage( "<font color='#00FF00'>Radiant</font> has " .. livesRadiant .. " lives left.", 0, 0 )
					end
				end
			elseif killedUnit:GetTeam() == 3 then
				livesDire = livesDire - 1
				if livesDire < 0 then
					killedUnit:SetRespawnsDisabled( true )
					killedUnit:SetBuyBackDisabledByReapersScythe( true )
					GameRules:SendCustomMessage( "<font color='#FF0000'>Dire</font> is out of lives!", 0, 0 )
				else
					killedUnit:SetTimeUntilRespawn( killedUnit:GetRespawnTime() / 3 )
					if livesDire == 0 then
						GameRules:SendCustomMessage( "<font color='#FF0000'>Dire</font> just used their last extra life!", 0, 0 )
					elseif livesDire == 1 then
						GameRules:SendCustomMessage( "<font color='#FF0000'>Dire</font> has only 1 extra life left!", 0, 0 )
					else
						GameRules:SendCustomMessage( "<font color='#FF0000'>Dire</font> has " .. livesDire .. " lives left.", 0, 0 )
					end
				end
			end
		end
	end
end		

-- Do we want to remove the mana cost of items?
itemsList = {blink,blades_of_attack,broadsword,chainmail,claymore,helm_of_iron_will,javelin,mithril_hammer,platemail,quarterstaff,quelling_blade,faerie_fire,infused_raindrop,wind_lace,ring_of_protection,stout_shield,moon_shard,gauntlets,slippers,mantle,branches,belt_of_strength,boots_of_elves,robe,circlet,crown,ogre_axe,blade_of_alacrity,staff_of_wizardry,ultimate_orb,gloves,lifesteal,ring_of_regen,ring_of_tarrasque,sobi_mask,boots,gem,cloak,talisman_of_evasion,cheese,magic_stick,recipe_magic_wand,magic_wand,ghost,clarity,enchanted_mango,flask,dust,bottle,ward_observer,ward_sentry,ward_dispenser,tango,tango_single,courier,flying_courier,tpscroll,recipe_travel_boots,travel_boots,travel_boots_2,phase_boots,demon_edge,eagle,reaver,relic,hyperstone,ring_of_health,void_stone,mystic_staff,energy_booster,point_booster,vitality_booster,power_treads,recipe_hand_of_midas,hand_of_midas,oblivion_staff,pers,poor_mans_shield,recipe_bracer,bracer,recipe_wraith_band,wraith_band,recipe_null_talisman,null_talisman,recipe_mekansm,mekansm,recipe_vladmir,vladmir,recipe_buckler,buckler,recipe_ring_of_basilius,ring_of_basilius,recipe_holy_locket,holy_locket,recipe_pipe,pipe,recipe_urn_of_shadows,urn_of_shadows,recipe_headdress,headdress,sheepstick,recipe_orchid,orchid,recipe_bloodthorn,bloodthorn,echo_sabre,recipe_cyclone,cyclone,recipe_aether_lens,aether_lens,recipe_force_staff,force_staff,recipe_hurricane_pike,hurricane_pike,recipe_dagon,dagon,dagon_2,dagon_3,dagon_4,dagon_5,recipe_necronomicon,necronomicon,necronomicon_2,necronomicon_3,ultimate_scepter,recipe_ultimate_scepter_2,ultimate_scepter_2,recipe_refresher,refresher,recipe_assault,assault,recipe_heart,heart,recipe_black_king_bar,black_king_bar,aegis,recipe_shivas_guard,shivas_guard,bloodstone,recipe_sphere,sphere,lotus_orb,meteor_hammer,nullifier,recipe_aeon_disk,aeon_disk,recipe_kaya,kaya,trident,combo_breaker,refresher_shard,recipe_spirit_vessel,spirit_vessel,recipe_vanguard,vanguard,recipe_crimson_guard,crimson_guard,blade_mail,soul_booster,hood_of_defiance,rapier,monkey_king_bar,recipe_radiance,radiance,butterfly,recipe_greater_crit,greater_crit,recipe_basher,basher,recipe_bfury,bfury,recipe_manta,manta,recipe_lesser_crit,lesser_crit,dragon_lance,recipe_armlet,armlet,invis_sword,recipe_silver_edge,silver_edge,sange_and_yasha,kaya_and_sange,yasha_and_kaya,satanic,recipe_mjollnir,mjollnir,skadi,recipe_sange,sange,recipe_helm_of_the_dominator,helm_of_the_dominator,maelstrom,desolator,recipe_yasha,yasha,mask_of_madness,recipe_diffusal_blade,diffusal_blade,ethereal_blade,recipe_soul_ring,soul_ring,arcane_boots,octarine_core,orb_of_venom,blight_stone,recipe_ancient_janggo,ancient_janggo,medallion_of_courage,recipe_solar_crest,solar_crest,smoke_of_deceit,tome_of_knowledge,recipe_veil_of_discord,veil_of_discord,recipe_guardian_greaves,guardian_greaves,recipe_rod_of_atos,rod_of_atos,recipe_iron_talon,iron_talon,recipe_abyssal_blade,abyssal_blade,heavens_halberd,ring_of_aquila,tranquil_boots,shadow_amulet,glimmer_cape,mutation_tombstone,super_blink,pocket_tower,pocket_roshan,keen_optic,grove_bow,quickening_charm,philosophers_stone,force_boots,desolator_2,phoenix_ash,seer_stone,greater_mango,elixer,vampire_fangs,craggy_coat,greater_faerie_fire,timeless_relic,mirror_shield,recipe_ironwood_tree,ironwood_tree,mango_tree,royal_jelly,pupils_gift,tome_of_aghanim,repair_kit,mind_breaker,third_eye,spell_prism,princes_knife,witless_shako,imp_claw,flicker,spy_gadget,spider_legs,helm_of_the_undying,vambrace,horizon,fusion_rune,ocean_heart,broom_handle,trusty_shovel,nether_shawl,dragon_scale,essence_ring,clumsy_net,enchanted_quiver,ninja_gear,illusionsts_cape,havoc_hammer,panic_button,apex,ballista,woodland_striders,recipe_trident,demonicon,recipe_fallen_sky,fallen_sky,pirate_hat,dimensional_doorway,ex_machina,faded_broach,paladin_sword,minotaur_horn,orb_of_destruction,the_leveller,arcane_ring,titan_sliver,diffusal_blade_2}
-- Missing river painters, up to date to 7.24b
-- Missing Blitz Knuckles, Voodoo Mask, Aghanim's Shard, Fluffy Hat, Falcon Blade, Orb of Corrosion, Witch Blade, Gleipnir (gungir), Mage Slayer, Eternal Shroud, Helm of the Overlord, Overwhelming Blink, Swift Blink, Arcane Blink, Wind Waker, Fairy's Trinket, Chipped Vest, Possessed Mask, Quicksilver Amulet, Bullwhip, Elven Tunic, Cloak of Flames, Ceremonial Robe, Psychic Headband, Penta-Edged Sword, Stormcrafter, Trickster Cloak, Giant's Ring, Book of Shadows, Pig Pole, Tumbler's Toy, Brigand's Blade, Fae Grenade, Blast Rig, Ascetic's Cap, Witchbane, Arcanist's Armor, up to 7.30

local function hasValue( table, abilityName )
    for index, value in ipairs( table ) do
        if value == abilityName then
            return true
        end
    end

    return false
end

function ResetAbilities( eventInfo )
	local caster = EntIndexToHScript( eventInfo.caster_entindex )
--	GameRules:SendCustomMessage( "Ability used: " .. eventInfo.abilityname, 0, 0 )

	if eventInfo.abilityname == "item_tpscroll" then
		local teleport = caster:GetItemInSlot( 15 )
		if teleport ~= nil then
--			caster:GiveMana( 75 )
			teleport:EndCooldown()
		end
	elseif eventInfo.abilityname ~= "earth_spirit_stone_caller" then
		local ability = caster:FindAbilityByName( eventInfo.abilityname )
		if ability ~= nil  then
			caster:GiveMana( 10000 )
			ability:EndCooldown()
			ability:RefreshCharges()

			-- Balance Kunkka
			if eventInfo.abilityname == "kunkka_torrent_storm" then
				ability:StartCooldown( 1.0 )
			end

			-- Balance Leshrac
			if eventInfo.abilityname == "leshrac_diabolic_edict" then
				ability:StartCooldown( 1.0 )
			end

			-- Balance Razor
			if eventInfo.abilityname == "razor_eye_of_the_storm" then
				ability:StartCooldown( 4.9 )
			end

			-- Deal with Lone Druid
			if eventInfo.abilityname == "lone_druid_savage_roar" then
				local bear = spiritBears[caster:GetPlayerID() + 1]
				if bear ~= "empty" then
					local bearAbility = bear:FindAbilityByName( "lone_druid_savage_roar_bear" )
					if bearAbility ~= nil then
						Timers:CreateTimer( {
							endTime = 0, callback = function()
								bearAbility:EndCooldown()
								bearAbility:RefreshCharges()
							end
						} )
					end
				end
			end

			-- Windranger & Lich cooldown penalty
			if eventInfo.abilityname == "windrunner_shackleshot" or eventInfo.abilityname == "lich_sinister_gaze" then
				local penalty = nil
				if not caster:HasModifier( "modifier_cooldown_penalty" ) then
					penalty = caster:AddNewModifier( caster, ability, "modifier_cooldown_penalty", nil )
					penalty:IncrementStackCount()
					penalty:SetDuration( 10.0, true )
				else
					penalty = caster:FindModifierByName( "modifier_cooldown_penalty" )
					penalty:IncrementStackCount()
					penalty:SetDuration( 10.0, true )
				end
				local penaltyStacks = penalty:GetStackCount()
				if penaltyStacks >= 10 then
					ability:StartCooldown( penaltyStacks / 25 )
				end
			end

			-- Rubick & Shadow Demon cooldown penalty
			if eventInfo.abilityname == "rubick_telekinesis" or eventInfo.abilityname == "shadow_demon_disruption" then
				local penalty = nil
				if not caster:HasModifier( "modifier_cooldown_penalty" ) then
					penalty = caster:AddNewModifier( caster, ability, "modifier_cooldown_penalty", nil )
					penalty:IncrementStackCount()
					penalty:SetDuration( 10.0, true )
				else
					penalty = caster:FindModifierByName( "modifier_cooldown_penalty" )
					penalty:IncrementStackCount()
					penalty:SetDuration( 10.0, true )
				end
				local penaltyStacks = penalty:GetStackCount()
				if penaltyStacks >= 10 then
					ability:StartCooldown( penaltyStacks / 20 )
				end
			end

			-- Naga Siren & Winter Wyvern cooldown penalty
			if eventInfo.abilityname == "naga_siren_ensnare" or eventInfo.abilityname == "winter_wyvern_winters_curse" then
				local penalty = nil
				if not caster:HasModifier( "modifier_cooldown_penalty" ) then
					penalty = caster:AddNewModifier( caster, ability, "modifier_cooldown_penalty", nil )
					penalty:IncrementStackCount()
					penalty:SetDuration( 10.0, true )
				else
					penalty = caster:FindModifierByName( "modifier_cooldown_penalty" )
					penalty:IncrementStackCount()
					penalty:SetDuration( 10.0, true )
				end
				local penaltyStacks = penalty:GetStackCount()
				if penaltyStacks >= 10 then
					ability:StartCooldown( penaltyStacks / 15 )
				end
			end

			-- Faceless Void cooldown penalty
			if eventInfo.abilityname == "faceless_void_chronosphere" then
				local penalty = nil
				if not caster:HasModifier( "modifier_cooldown_penalty" ) then
					penalty = caster:AddNewModifier( caster, ability, "modifier_cooldown_penalty", nil )
					penalty:IncrementStackCount()
					penalty:SetDuration( 10.0, true )
				else
					penalty = caster:FindModifierByName( "modifier_cooldown_penalty" )
					penalty:IncrementStackCount()
					penalty:SetDuration( 10.0, true )
				end
				local penaltyStacks = penalty:GetStackCount()
				if penaltyStacks >= 10 then
					ability:StartCooldown( penaltyStacks / 10 )
				end
			end

			-- Meepo cooldown penalty
			if eventInfo.abilityname == "meepo_earthbind" then
				local penalty = nil
				if not caster:HasModifier( "modifier_cooldown_penalty" ) then
					penalty = caster:AddNewModifier( caster, ability, "modifier_cooldown_penalty", nil )
					penalty:IncrementStackCount()
					penalty:SetDuration( 10.0, true )
				else
					penalty = caster:FindModifierByName( "modifier_cooldown_penalty" )
					penalty:IncrementStackCount()
					penalty:SetDuration( 10.0, true )
				end
				local penaltyStacks = penalty:GetStackCount()
				if penaltyStacks >= 5 then
					ability:StartCooldown( penaltyStacks / 5 )
				end
			end

		end

		-- Deal with Wraith King
		if (eventInfo.abilityname == "skeleton_king_hellfire_blast") then
			local reincarnation = caster:FindAbilityByName( "skeleton_king_reincarnation" )
			if reincarnation ~= nil then
				reincarnation:EndCooldown()
			end
		end
	end
end

function ResetNeutralAbilities( eventInfo )
	local caster = EntIndexToHScript( eventInfo.caster_entindex )
--	GameRules:SendCustomMessage( "Ability used: " .. eventInfo.abilityname, 0, 0 )

	-- Only include creeps that are controlled by a player
	if caster:GetPlayerOwnerID() ~= -1 then
		if eventInfo.abilityname == "item_tpscroll" then
			local teleport = caster:GetItemInSlot( 15 )
			if teleport ~= nil then
--				caster:GiveMana( 75 )
				teleport:EndCooldown()
			end
		else
			local ability = caster:FindAbilityByName( eventInfo.abilityname )
			if ability ~= nil then
				caster:GiveMana( 10000 )
				ability:EndCooldown()
				ability:RefreshCharges()

				-- Deal with Spirit Bear
				if eventInfo.abilityname == "lone_druid_savage_roar_bear" then
					local hero = PlayerResource:GetSelectedHeroEntity( caster:GetPlayerOwnerID() )
					if hero ~= nil then
						local heroAbility = hero:FindAbilityByName( "lone_druid_savage_roar" )
						if heroAbility ~= nil then
							Timers:CreateTimer( {
								endTime = 0, callback = function()
									heroAbility:EndCooldown()
									heroAbility:RefreshCharges()
								end
							} )
						end
					end
				end
			end
		end
	end
end

function OnNpcSpawn( eventInfo )
	local spawnedUnit = EntIndexToHScript( eventInfo.entindex )

	if string.find( spawnedUnit:GetUnitName(), "npc_dota_lone_druid_bear" ) ~= nil then
		spiritBears[spawnedUnit:GetPlayerOwnerID() + 1] = spawnedUnit
	elseif spawnedUnit:IsRealHero() and not spawnedUnit:IsTempestDouble() then
		if spawnedUnit.HasDied == 1 then

			local currentHero = spawnedUnit:GetName()
			local player = spawnedUnit:GetPlayerID()

			local randomHero = heroesCustom[math.random( 1, #heroesCustom )]
			while randomHero == currentHero do
				randomHero = heroesCustom[math.random( 1, #heroesCustom )]
			end

			-- Precache the new hero to prevent a lag spike
			PrecacheUnitByNameAsync( randomHero, function()
				
				-- Drop Spirit Bear's items if the player died with Lone Druid
				if currentHero == "npc_dota_hero_lone_druid" then
					local spiritBear = spiritBears[player + 1]
					if spiritBear ~= "empty" then
						local bearItems = {}

						-- Inventory and backpack
						for i = 1, 9, 1 do
							local bearItem = spiritBear:GetItemInSlot( i - 1 )
							if bearItem ~= nil then
								bearItems[#bearItems + 1] = bearItem
							end
						end

						-- Town Portal Scrolls and neutral item
						for i = 16, 17, 1 do
							local bearItem = spiritBear:GetItemInSlot( i - 1 )
							if bearItem ~= nil then
								bearItems[#bearItems + 1] = bearItem
							end
						end

						-- Drop Spirit Bear's items
						for index, bearItem in ipairs( bearItems ) do
							spiritBear:DropItemAtPositionImmediate( bearItem, spawnedUnit:GetAbsOrigin() + Vector( (index % 4) * 40, math.floor(index / 4) * -60, 0 ) )
						end

						-- Forget Spirit Bear
						spiritBears[player + 1] = "empty"
					end
				end

				-- Drop items outside the map
				local items = {}

				for i = 1, 17, 1 do
					local item = spawnedUnit:GetItemInSlot( i - 1 )
					if item ~= nil then
						items[i] = item
					else
						items[i] = "empty"
					end
				end

				for index, item in ipairs( items ) do
					if item ~= "empty" then
						spawnedUnit:DropItemAtPositionImmediate( item, Vector( 999999, 999999, 999999 ) )
					end
				end

				-- Record item-based buffs
				local hasAghanimsBlessing = spawnedUnit:HasModifier( "modifier_item_ultimate_scepter_consumed" ) or spawnedUnit:HasModifier( "modifier_item_ultimate_scepter_consumed_alchemist" )
				local hasAghanimsShard = spawnedUnit:HasModifier( "modifier_item_aghanims_shard" )
				local hasMoonShard = spawnedUnit:HasModifier( "modifier_item_moon_shard_consumed" )

				-- Replace the hero
				local reliableGold = PlayerResource:GetReliableGold( player )
				local unreliableGold = PlayerResource:GetUnreliableGold( player )
				local xp = spawnedUnit:GetCurrentXP()
				local newHero = PlayerResource:ReplaceHeroWith( player, randomHero, 0, 0 )
				newHero:SetGold( reliableGold, true )
				newHero:SetGold( unreliableGold, false )
				newHero:AddExperience( xp, 0, false, false )
				
				-- Apply item-based buffs to the new hero
				if hasAghanimsBlessing then
					newHero:AddNewModifier( newHero, nil, "modifier_item_ultimate_scepter_consumed", nil )
				end
				if hasAghanimsShard then
					newHero:AddNewModifier( newHero, nil, "modifier_item_aghanims_shard", nil )
				end
				if hasMoonShard then
					newHero:AddItem( CreateItem( "item_moon_shard", spawnedUnit:GetPlayerOwner(), nil ) )
					newHero:CastAbilityOnTarget( newHero, newHero:GetItemInSlot( 0 ), player )
				end

				-- Add items back after applying Moon Shard
				for i = 15, 1, -1 do
					if items[i] ~= "empty" then
						if items[i]:IsNeutralDrop() then
							PlayerResource:AddNeutralItemToStash( player, PlayerResource:GetTeam( player ), items[i] )
						else
							newHero:AddItem( items[i] )
							newHero:SwapItems( 0, i - 1 )
						end
					end
				end

				-- Add Town Portal Scrolls
				if items[16] ~= "empty" then
					newHero:AddItem( items[16] )
				end

				-- Add neutral item
				if items[17] ~= "empty" then
					newHero:AddItem( items[17] )
				end

				-- Make Town Portal Scrolls have no cooldown upon respawning
				local teleport = newHero:GetItemInSlot( 15 )
				teleport:EndCooldown()

				-- Remove 1 Town Portal Scroll, because every new hero starts with 1 of them in current patch
				if teleport:GetCurrentCharges() == 1 then
					newHero:RemoveItem( teleport )
				else
					teleport:SetCurrentCharges( teleport:GetCurrentCharges() - 1 )
				end
			end )
    	end
	end
end

function OnGameStateChange( eventInfo )
	if GameRules:State_Get() == DOTA_GAMERULES_STATE_HERO_SELECTION then
		for player = 0, DOTA_MAX_PLAYERS - 1, 1 do
			if PlayerResource:IsValidPlayer( player ) then
				PlayerResource:GetPlayer( player ):MakeRandomHeroSelection()
			end
		end
	end
	if GameRules:State_Get() == DOTA_GAMERULES_STATE_PRE_GAME then
		local radiantMessage = "<font color='#00FF00'>Radiant</font> has " .. livesRadiant .. " lives left."
		local direMessage = "<font color='#FF0000'>Dire</font> has " .. livesDire .. " lives left."
		GameRules:SendCustomMessage( radiantMessage, 0, 0 )
		GameRules:SendCustomMessage( direMessage, 0, 0 )
	end
--	if GameRules:State_Get() == DOTA_GAMERULES_STATE_GAME_IN_PROGRESS then
--		Timers:CreateTimer( function()
--			local all_heroes = HeroList:GetAllHeroes()
--			for _, hero in pairs( all_heroes ) do
--				if hero:IsRealHero() and hero:IsControllableByAnyPlayer() then
--					hero:ModifyGold( 1, false, 0 )
--				end
--			end
--			return 0.6
--		end )
--	end
end

function Activate()
	GameRules.CustomAddon = GentlemanWTF()
	GameRules.CustomAddon:InitGameMode()

	ListenToGameEvent("entity_killed", RespawnTime, nil)
	ListenToGameEvent("dota_player_used_ability", ResetAbilities, nil)
	ListenToGameEvent("dota_non_player_used_ability", ResetNeutralAbilities, nil)
	ListenToGameEvent("npc_spawned", OnNpcSpawn, nil)
	ListenToGameEvent("game_rules_state_change", OnGameStateChange, nil)
end

function GentlemanWTF:InitGameMode()
	print( "Initializing Gentleman WTF." )
	GameRules:SetGoldPerTick( 2 )
--	GameRules:SetGoldTickTime( 0.6 )

	GameRules:GetGameModeEntity():SetFreeCourierModeEnabled( true )
	GameRules:GetGameModeEntity():SetTowerBackdoorProtectionEnabled( true )
	GameRules:GetGameModeEntity():SetUseDefaultDOTARuneSpawnLogic( true )
--	GameRules:GetGameModeEntity():SetBountyRuneSpawnInterval( 3 )
--	GameRules:GetGameModeEntity():SetPowerRuneSpawnInterval( 2 )
--	GameRules:GetGameModeEntity():SetThink( "OnThink", self, "GlobalThink", 0 )

	LinkLuaModifier( "modifier_cooldown_penalty", LUA_MODIFIER_MOTION_NONE )

	-- Change random seed
	local timeText = string.gsub( string.gsub( GetSystemTime(), ':', '' ), '0', '' )
	math.randomseed( tonumber( timeText ) )
end

function GentlemanWTF:OnThink()
	if GameRules:State_Get() == DOTA_GAMERULES_STATE_GAME_IN_PROGRESS then
		GameRules:SendCustomMessage( "Thank you for playing Gentleman WTF.", 0, 0 )
	end
	-- Interval to next
	return 1800
end

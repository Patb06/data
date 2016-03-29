-------------------------------------------------------------------------------------------------------------------
-- Initialization function that defines sets and variables to be used.
-------------------------------------------------------------------------------------------------------------------
 
-- IMPORTANT: Make sure to also get the Mote-Include.lua file (and its supplementary files) to go with this.
 
-- Initialization function for this job file.

include('organizer-lib')
function get_sets()

include('organizer-lib')
mote_include_version = 2
-- Load and initialize the include file.
include('Mote-Include.lua')
end

function job_setup()
    indi_timer = ''
    indi_duration = 180
end
 
 
-- Called when this job file is unloaded (eg: job change)
function file_unload()
if binds_on_unload then
binds_on_unload()
end
end
 
 
-- Define sets and vars used by this job file.
function init_gear_sets()
--------------------------------------
-- Start defining the sets
--------------------------------------
 
-- Precast Sets
 
-- Precast sets to enhance JAs
sets.precast.JA['Cardinal Chant'] = {head="Geomancy Galero"}
sets.precast.JA['Life Cycle'] = {body="Geomancy Tunic"}
sets.precast.JA['Full Circle'] = {hands="Bagua Mitaines"}
sets.precast.JA['Radial Arcana'] = {feet="Bagua Sandals"}
sets.precast.JA['Bolster'] = {body="Bagua Tunic"}
sets.precast.JA['Mending Halation'] = {legs="Bagua Pants"}
 
-- Fast cast sets for spells
sets.precast.FC = {
head="Nahtirah Hat",ear2="Loquacious Earring",
body="Anhur Robe",hands="Repartie Gloves",ring1="Prolix Ring",
back="Lifestream Cape",waist="Witful Belt",legs="Geomancy Pants",feet="Karasutengu Kogake"}
 
sets.precast.FC.Cure = {
main="Tamaxchi",sub="Genbu's Shield",
head="Nahtirah Hat",ear2="Loquacious Earring",
body="Heka's Kalasiris",hands="Repartie Gloves",ring1="Prolix Ring",
back="Pahtli Cape",waist="Witful Belt",legs="Geomancy Pants",feet="Karasutengu Kogake"}
 
sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {hands="Bagua Mitaines"})
 
-- Weaponskill sets: Specific weaponskill sets. Uses the base set if an appropriate WSMod version isn't found.
sets.precast.WS['Realmrazer'] = {
head="Espial Cap",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Brutal Earring",
body="Espial Gambison",hands="Yaoyotl Gloves",ring1="Aquasoul Ring",ring2="Mars's Ring",
back="Buquwik Cape",waist="Fotia Belt",legs="Espial Hose",feet="Espial Socks"}
 
sets.precast.WS['Starlight'] = {ear2="Moonshade Earring"}
 
sets.precast.WS['Moonlight'] = {ear2="Moonshade Earring"}
 
sets.precast.WS['Flash Nova'] = {
head="Hagondes Hat",neck="Fotia Gorget",ear1="Friomisi Earring",ear2="Hecate's Earring",
body="Hagondes Coat",hands="Yaoyotl Gloves",ring1="Acumen Ring",ring2="Demon's Ring",
back="Toro Cape",waist="Fotia Belt",legs="Hagondes Pants +1"}
 
 
-- Midcast Sets
sets.midcast.FastRecast = {
head="Nahtirah Hat",ear2="Loquacious Earring",
body="Hagondes Coat",hands="Bokwus Gloves",ring1="Prolix Ring",
back="Lifestream Cape",waist="Goading Belt",legs="Hagondes Pants",feet="Karasutengu Kogake"}
 
sets.midcast.Geomancy = {range="Dunna",
body="Bagua Tunic",hands="Geomancy Mitaines",ring1="Prolix Ring",ear1="lempo Earring",
back="Lifestream Cape",waist="Witful Belt",legs="Geomancy Pants",feet="Karasutengu Kogake"}
 
sets.midcast.Cure = {
main="Tamaxchi",sub="Genbu's Shield",
body="Heka's Kalasiris",hands="Bokwus gloves",
back="Pahtli Cape",legs="Geomancy Pants",feet="Serpentes Sabots"}
 
sets.midcast['Dark Magic'] = {
head="Befouled Crown",neck="Weike Torque",ear1="Psystorm Earring",ear2="Lifestorm Earring",
body="Geomancy Tunic",hands="Yaoyotl Gloves",ring1="Strendu Ring",ring2="Sangoma Ring",
back="Refraction Cape",waist="Witful Belt",legs="Geomancy Pants",feet="Orvail Souliers +1",
main="Marin Staff",sub="Mephitis Grip"}
 
sets.midcast.Drain = {
head="Bagua Galero",neck="Weike Torque",ear1="Psystorm Earring",ear2="Lifestorm Earring",
body="Geomancy Tunic",hands="Yaoyotl Gloves",ring1="Strendu Ring",ring2="Sangoma Ring",
back="Refraction Cape",waist="Witful Belt",legs="Geomancy Pants",feet="Orvail Souliers +1",
main="Marin Staff",sub="Mephitis Grip"}
 
sets.midcast.Aspir = sets.midcast.Drain
sets.midcast['Aspir II'] = sets.midcast.Drain
 
sets.midcast.Stun = {
	main="Marin Staff",
    sub="Mephitis Grip",
    ammo="Ghastly Tathlum",
    head={ name="Hagondes Hat", augments={'Phys. dmg. taken -2%','"Mag.Atk.Bns."+23',}},
    body={ name="Amalric Doublet", augments={'MP+60','Mag. Acc.+15','"Mag.Atk.Bns."+15',}},
    hands={ name="Helios Gloves", augments={'Mag. Acc.+18 "Mag.Atk.Bns."+18','MP+24',}},
    legs="Gyve Trousers",
    feet="Tutyr Sabots",
    neck="Eddy Necklace",
    waist="Porous Rope",
    left_ear="Hecate's Earring",
    right_ear="Friomisi Earring",
    left_ring="Locus Ring",
    right_ring="Acumen Ring",
    back="Toro Cape"}
 
sets.midcast['Elemental Magic'] = {    main="Marin Staff",
    sub="Mephitis Grip",
    ammo="Ghastly Tathlum",
    head={ name="Hagondes Hat", augments={'Phys. dmg. taken -2%','"Mag.Atk.Bns."+23',}},
    body={ name="Amalric Doublet", augments={'MP+60','Mag. Acc.+15','"Mag.Atk.Bns."+15',}},
    hands={ name="Helios Gloves", augments={'Mag. Acc.+18 "Mag.Atk.Bns."+18','MP+24',}},
    legs="Gyve Trousers",
    feet="Tutyr Sabots",
    neck="Eddy Necklace",
    waist="Porous Rope",
    left_ear="Hecate's Earring",
    right_ear="Friomisi Earring",
    left_ring="Locus Ring",
    right_ring="Acumen Ring",
    back="Toro Cape"}
 
sets.midcast['Indi-*'] = {legs="Bagua Pants"}
 
sets.midcast.Protectra = {ring1="Sheltered Ring"}
sets.midcast.Shellra = {ring1="Sheltered Ring"}
 
-- Enfeebling Magic Sets
sets.midcast.MndEnfeebles = {
head="Befouled Crown",neck="Imbodla Necklace",ear1="Psystorm Earring",ear2="Lifestorm Earring",
body="Artsieq jubbah",hands="Hagondes Cuffs",ring1="Perception Ring",ring2="Sangoma Ring",
back="Lifestorm Cape",waist="Porous Rope",legs="Vanya Slops",feet="Geomancy Sandals",
main="Marin Staff",sub="Mephitis Grip", ammo="Dosis Tathlum"}
 
sets.midcast.IntEnfeebles = {
head="Befouled Crown",neck="Imbodla Necklace",ear1="Psystorm Earring",ear2="Lifestorm Earring",
body="Artsieq jubbah",hands="Hagondes Cuffs",ring1="Perception Ring",ring2="Sangoma Ring",
back="Lifestorm Cape",waist="Porous Rope",legs="Vanya Slops",feet="Geomancy Sandals",
main="Marin Staff",sub="Mephitis Grip"}
 
sets.midcast.ElementalEnfeeble = sets.midcast.IntEnfeebles
 
 
-- Sets to return to when not performing an action.
 
-- Resting sets
sets.resting = {neck="Twilight Torque",
body="Heka's Kalasiris",ring1="Sheltered Ring",ring2="Paguroidea Ring"}
 
 
-- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
sets.idle.Town = {main="Bolelabunga",sub="Genbu's Shield",range="Dunna",
head="Befouled Crown",neck="Twilight Torque",ear1="Ethereal Earring",ear2="Loquacious Earring",
body="Witching Robe",hands="Bagua Mitaines",ring1="Sheltered Ring",ring2="Paguroidea Ring",
back="Repulse Mantle",waist="Tarutaru Sash",legs="Assiduity Pants",feet="Geomancy Sandals"}
 
sets.idle.Field = {    
	main="Bolelabunga",
    sub="Genbu's Shield",
    range="Dunna",
    head="Befouled Crown",
    body={ name="Witching Robe", augments={'MP+5','"Refresh"+1',}},
    hands="Serpentes Cuffs",
    legs="Assiduity Pants",
    feet="Serpentes Sabots",
    neck="Twilight Torque",
    waist="Porous Rope",
    left_ear="Gifted Earring",
    right_ear="Loquac. Earring",
    left_ring="Defending Ring",
    right_ring={ name="Dark Ring", augments={'Magic dmg. taken -3%','Phys. dmg. taken -5%',}},
    back="Kumbira Cape"}
 
sets.idle.Field.PDT = {    
	main="Earth Staff",
    sub="Achaq Grip",
    range="Dunna",
    head={ name="Hagondes Hat", augments={'Phys. dmg. taken -2%','"Mag.Atk.Bns."+23',}},
    body={ name="Witching Robe", augments={'MP+5','"Refresh"+1',}},
    hands={ name="Hagondes Cuffs", augments={'Phys. dmg. taken -3%',}},
    legs={ name="Hagondes Pants +1", augments={'Phys. dmg. taken -2%','Magic dmg. taken -4%',}},
    feet="Geomancy Sandals",
    neck="Twilight Torque",
    waist="Porous Rope",
    left_ear="Gifted Earring",
    right_ear="Loquac. Earring",
    left_ring="Defending Ring",
    right_ring={ name="Dark Ring", augments={'Magic dmg. taken -3%','Phys. dmg. taken -5%',}},
    back="Cheviot Cape"}
 
sets.idle.Weak = {sub="Genbu's Shield",range="Dunna",
head="Befouled Crown",neck="Twilight Torque",ear1="Ethereal Earring",ear2="Loquacious Earring",
body="Heka's Kalasiris",hands="Bagua Mitaines",ring1="Sheltered Ring",ring2="Paguroidea Ring",
back="Shadow Mantle",waist="Witful Belt",legs="Assiduity Pants",feet="Geomancy Sandals"}
 
-- Defense sets
sets.defense.PDT = {
	main="Earth Staff",
    sub="Achaq Grip",
    range="Dunna",
    head={ name="Hagondes Hat", augments={'Phys. dmg. taken -2%','"Mag.Atk.Bns."+23',}},
    body={ name="Witching Robe", augments={'MP+5','"Refresh"+1',}},
    hands={ name="Hagondes Cuffs", augments={'Phys. dmg. taken -3%',}},
    legs={ name="Hagondes Pants +1", augments={'Phys. dmg. taken -2%','Magic dmg. taken -4%',}},
    feet="Geomancy Sandals",
    neck="Twilight Torque",
    waist="Porous Rope",
    left_ear="Gifted Earring",
    right_ear="Loquac. Earring",
    left_ring="Defending Ring",
    right_ring={ name="Dark Ring", augments={'Magic dmg. taken -3%','Phys. dmg. taken -5%',}},
    back="Cheviot Cape"}
 
sets.defense.MDT = {sub="Genbu's Shield",range="Dunna",
head="Nahtirah Hat",neck="Twilight Torque",ear1="Ethereal Earring",ear2="Loquacious Earring",
body="Artsieq jubbah",hands="Bagua Mitaines",ring1="Defending Ring",ring2="Dark Ring",
back="Shadow Mantle",waist="Goading Belt",legs="Assiduity Pants",feet="Geomancy Sandals"}
 
sets.Kiting = {feet="Geomancy Sandals"}
 
-- Engaged sets
 
-- Variations for TP weapon and (optional) offense/defense modes. Code will fall back on previous
-- sets if more refined versions aren't defined.
-- If you create a set with both offense and defense modes, the offense mode should be first.
-- EG: sets.engaged.Dagger.Accuracy.Evasion
 
-- Normal melee group
sets.engaged = {range="Dunna",
head="Espial Cap",neck="Asperity Necklace",ear1="Steelflash Earring",ear2="Bladeborn Earring",
body="Espial Gambison",hands="Geomancy Mitaines",ring1="Rajas Ring",ring2="K'ayres Ring",
back="Buquwik Cape",waist="Windbuffet belt",legs="Espial Hose",feet="Battlecast Gaiters"}


                sets.Obi = {}
               
                sets.Obi.Fire = {waist="Karin Obi", back="Twilight Cape"}
               
                sets.Obi.Earth = {waist="Dorin Obi", back="Twilight Cape"}
               
                sets.Obi.Water = {waist="Suirin Obi", back="Twilight Cape"}
               
                sets.Obi.Wind = {waist="Furin Obi", back="Twilight Cape"}
               
                sets.Obi.Ice = {waist="Hyorin Obi", back="Twilight Cape"}
               
                sets.Obi.Thunder = {waist="Rairin Obi", back="Twilight Cape"}
               
                sets.Obi.Light = {waist="Korin Obi", back="Twilight Cape"}
               
                sets.Obi.Dark = {waist="Anrin Obi", back="Twilight Cape"}
				
				
				
end
 
-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks that are called to process player actions at specific points in time.
-------------------------------------------------------------------------------------------------------------------
 
-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
-- Set eventArgs.useMidcastGear to true if we want midcast gear equipped on precast.
function job_precast(spell, action, spellMap, eventArgs)
 
  if spell.english == "Stone" or spell.english == "Thunder" or spell.english == "Water" or spell.english == "Fire" or spell.english == "Blizzard" or spell.english == "Aero" then
                equip(sets.midcast['Elemental Magic'])
                if spell.element == world.weather_element or spell.weather_element or spell_element == world.day_element then
                        equip(sets.Obi[spell.element])
                end

                end
				if buffactive.thunderstorm or buffactive.ThunderstormII then
						equip(sets.Obi.Thunder)
				end	
				if buffactive.Firestorm then
						equip(sets.Obi.Fire)
				end	
				if buffactive.Hailstorm then
						equip(sets.Obi.Ice)
				end
				if buffactive.Windstorm then
						equip(sets.Obi.Wind)
				end
				if buffactive.Rainstorm then
						equip(sets.Obi.Water)
				end
				if buffactive.Sandstorm then
						equip(sets.Obi.Stone)
				end
				if buffactive.Aurorastorm then
						equip(sets.Obi.Light)
				end
				if buffactive.Voidstorm then
						equip(sets.Obi.Dark)
				end
        end
       
 
 
-- Run after the general precast() is done.
function job_post_precast(spell, action, spellMap, eventArgs)
 
end
 
 
-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_midcast(spell, action, spellMap, eventArgs)
if spell.action_type == 'Magic' then
-- Default base equipment layer of fast recast.
equip(sets.midcast.FastRecast)


if spell.english == "Stone III" or spell.english == "Thunder III" or spell.english == "Water III" or spell.english == "Fire III" or spell.english == "Blizzard III" or spell.english == "Aero III" or spell.english == "Stone IV" or spell.english == "Thunder IV" or spell.english == "Water IV" or spell.english == "Fire IV" or spell.english == "Blizzard IV" or spell.english == "Aero IV" or spell.english == "Stone V" or spell.english == "Thunder V" or spell.english == "Water V" or spell.english == "Fire V" or spell.english == "Blizzard V" or spell.english == "Aero V"then
                equip(sets.midcast['Elemental Magic'])
                if spell.element == world.weather_element or spell.weather_element or spell_element == world.day_element then
                        equip(sets.Obi[spell.element])
                end
				
        end


end
equip(sets.midcast.FastRecast)
end
-- Run after the general midcast() is done.
function job_post_midcast(spell, action, spellMap, eventArgs)
 
end
 
-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_aftercast(spell, action, spellMap, eventArgs)
 
end
 
 
-------------------------------------------------------------------------------------------------------------------
-- Customization hooks for idle and melee sets, after they've been automatically constructed.
-------------------------------------------------------------------------------------------------------------------
 
function customize_idle_set(idleSet)
return idleSet
end
 
function customize_melee_set(meleeSet)
return meleeSet
end
 
-------------------------------------------------------------------------------------------------------------------
-- General hooks for other events.
-------------------------------------------------------------------------------------------------------------------
 
-- Called when the player's status changes.
function job_status_change(newStatus,oldStatus)
 
end
 
-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
function job_buff_change(buff, gain)
--handle_equipping_gear(player.status)
end
 
 
-------------------------------------------------------------------------------------------------------------------
-- User code that supplements self-commands.
-------------------------------------------------------------------------------------------------------------------
 
-- Called for custom player commands.
function job_self_command(cmdParams, eventArgs)
 
end
 
-- Called by the 'update' self-command.
function job_update(cmdParams, eventArgs)
 
end
 
-- Function to display the current relevant user state when doing an update.
-- Return true if display was handled, and you don't want the default info shown.
function display_current_job_state()
 
end

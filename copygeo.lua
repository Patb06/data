-------------------------------------------------------------------------------------------------------------------
-- Initialization function that defines sets and variables to be used.
-------------------------------------------------------------------------------------------------------------------
 
-- IMPORTANT: Make sure to also get the Mote-Include.lua file (and its supplementary files) to go with this.
 
-- Initialization function for this job file.
function get_sets()

mote_include_version = 2
-- Load and initialize the include file.
include('Mote-Include.lua')
end

function job_setup()
    indi_timer = ''
    indi_duration = 180
end
 
-- Setup vars that are user-dependent. Can override this function in a sidecar file.
function user_setup()
-- Default macro set/book
set_macro_page(1, 13)
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
head="Espial Cap",neck="Light Gorget",ear1="Moonshade Earring",ear2="Brutal Earring",
body="Espial Gambison",hands="Yaoyotl Gloves",ring1="Aquasoul Ring",ring2="Mars's Ring",
back="Buquwik Cape",waist="Anguinus Belt",legs="Espial Hose",feet="Espial Socks"}
 
sets.precast.WS['Starlight'] = {ear2="Moonshade Earring"}
 
sets.precast.WS['Moonlight'] = {ear2="Moonshade Earring"}
 
sets.precast.WS['Flash Nova'] = {
head="Hagondes Hat",neck="Eddy Necklace",ear1="Friomisi Earring",ear2="Hecate's Earring",
body="Hagondes Coat",hands="Yaoyotl Gloves",ring1="Acumen Ring",ring2="Demon's Ring",
back="Toro Cape",waist="Light Belt",legs="Hagondes Pants"}
 
 
-- Midcast Sets
sets.midcast.FastRecast = {
head="Nahtirah Hat",ear2="Loquacious Earring",
body="Hagondes Coat",hands="Bokwus Gloves",ring1="Prolix Ring",
back="Lifestream Cape",waist="Goading Belt",legs="Hagondes Pants",feet="Karasutengu Kogake"}
 
sets.midcast.Geomancy = {range="Dunna",
body="Bagua Tunic",hands="Geomancy Mitaines",ring1="Prolix Ring",
back="Lifestream Cape",waist="Witful Belt",legs="Geomancy Pants",feet="Karasutengu Kogake"}
 
sets.midcast.Cure = {
main="Tamaxchi",sub="Genbu's Shield",
body="Heka's Kalasiris",hands="Bokwus gloves",
back="Pahtli Cape",legs="Geomancy Pants",feet="Serpentes Sabots"}
 
sets.midcast['Dark Magic'] = {
head="Nahtirah Hat",neck="Weike Torque",ear1="Psystorm Earring",ear2="Lifestorm Earring",
body="Geomancy Tunic",hands="Yaoyotl Gloves",ring1="Strendu Ring",ring2="Sangoma Ring",
back="Refraction Cape",waist="Witful Belt",legs="Geomancy Pants",feet="Orvail Souliers +1",
main="Atinian Staff",sub="Mephitis Grip"}
 
sets.midcast.Drain = {
head="Bagua Galero",neck="Weike Torque",ear1="Psystorm Earring",ear2="Lifestorm Earring",
body="Geomancy Tunic",hands="Yaoyotl Gloves",ring1="Strendu Ring",ring2="Sangoma Ring",
back="Refraction Cape",waist="Witful Belt",legs="Geomancy Pants",feet="Orvail Souliers +1",
main="Atinian Staff",sub="Mephitis Grip"}
 
sets.midcast.Aspir = sets.midcast.Drain
sets.midcast['Aspir II'] = sets.midcast.Drain
 
sets.midcast.Stun = {main="Atinian Staff",sub="Mephitis Grip",
head="Nahtirah Hat",neck="Eddy Necklace",ear1="Psystorm Earring",ear2="Lifestorm Earring",
body="Anhur Robe",hands="Repartie Gloves",ring1="Prolix Ring",ring2="Sangoma Ring",
back="Lifestream Cape",waist="Witful Belt",legs="Geomancy Pants",feet="Academic's Loafers"}
 
sets.midcast['Elemental Magic'] = {ammo="Dosis Tathlum",
head="Hagondes Hat",neck="Eddy Necklace",ear1="Hecate's Earring",ear2="Friomisi Earring",
body="Bagua Tunic",hands="Yaoyotl Gloves",ring1="Shiva Ring",ring2="Shiva Ring",
back="Toro Cape",waist="Oneiros Sash",legs="Hagondes Pants",feet="Weatherspoon Souliers +1",
main="Atinian Staff",sub="Mephitis Grip"}
 
sets.midcast['Indi-*'] = {legs="Bagua Pants"}
 
sets.midcast.Protectra = {ring1="Sheltered Ring"}
sets.midcast.Shellra = {ring1="Sheltered Ring"}
 
-- Enfeebling Magic Sets
sets.midcast.MndEnfeebles = {
head="Nahtirah Hat",neck="Weike Torque",ear1="Psystorm Earring",ear2="Lifestorm Earring",
body="Artsieq jubbah",hands="Hagondes Cuffs",ring1="Perception Ring",ring2="Sangoma Ring",
back="Refraction Cape",waist="Witful Belt",legs="Hagondes Pants",feet="Bagua Sandals",
main="Atinian Staff",sub="Mephitis Grip", ammo="Dosis Tathlum"}
 
sets.midcast.IntEnfeebles = {
head="Nahtirah Hat",neck="Weike Torque",ear1="Psystorm Earring",ear2="Lifestorm Earring",
body="Artsieq jubbah",hands="Hagondes Cuffs",ring1="Perception Ring",ring2="Sangoma Ring",
back="Refraction Cape",waist="Witful Belt",legs="Hagondes Pants",feet="Bagua Sandals",
main="Atinian Staff",sub="Mephitis Grip"}
 
sets.midcast.ElementalEnfeeble = sets.midcast.IntEnfeebles
 
 
-- Sets to return to when not performing an action.
 
-- Resting sets
sets.resting = {neck="Twilight Torque",
body="Heka's Kalasiris",ring1="Sheltered Ring",ring2="Paguroidea Ring"}
 
 
-- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
sets.idle.Town = {main="Bolelabunga",sub="Genbu's Shield",range="Dunna",
head="Nefer Khat",neck="Twilight Torque",ear1="Ethereal Earring",ear2="Loquacious Earring",
body="Artsieq jubbah",hands="Bagua Mitaines",ring1="Sheltered Ring",ring2="Paguroidea Ring",
back="Repulse Mantle",waist="Tarutaru Sash",legs="Nares Trews",feet="Geomancy Sandals"}
 
sets.idle.Field = {range="Dunna", main="Bolelabunga",sub="Genbu's Shield",
head="Nefer Khat",neck="Twilight Torque",ear1="Ethereal Earring",ear2="Loquacious Earring",
body="Artsieq jubbah",hands="Bagua Mitaines",ring1="Sheltered Ring",ring2="Paguroidea Ring",
back="Repulse Mantle",waist="Witful Belt",legs="Nares Trews",feet="Geomancy Sandals"}
 
sets.idle.Field.PDT = {range="Dunna", main="Earth Staff", sub="Mephitis grip",
head="Hagondes Hat",neck="Twilight Torque",ear1="Ethereal Earring",ear2="Loquacious Earring",
body="Heka's Kalasiris",hands="Bagua Mitaines",ring1="Dark Ring",ring2="Dark Ring",
back="Cheviot cape",waist="Witful Belt",legs="Nares Trews",feet="Geomancy Sandals"}
 
sets.idle.Weak = {sub="Genbu's Shield",range="Dunna",
head="Nefer Khat",neck="Twilight Torque",ear1="Ethereal Earring",ear2="Loquacious Earring",
body="Heka's Kalasiris",hands="Bagua Mitaines",ring1="Sheltered Ring",ring2="Paguroidea Ring",
back="Shadow Mantle",waist="Witful Belt",legs="Nares Trews",feet="Geomancy Sandals"}
 
-- Defense sets
sets.defense.PDT = {main="Earth Staff",sub="Bugard Leather Strap +1",range="Dunna",
head="Hagondes Hat",neck="Twilight Torque",ear1="Ethereal Earring",ear2="Loquacious Earring",
body="Artsieq jubbah",hands="Bagua Mitaines",ring1="Dark Ring",ring2="Dark Ring",
back="Cheviot cape",waist="Goading Belt",legs="Nares Trews",feet="Geomancy Sandals"}
 
sets.defense.MDT = {sub="Genbu's Shield",range="Dunna",
head="Nahtirah Hat",neck="Twilight Torque",ear1="Ethereal Earring",ear2="Loquacious Earring",
body="Artsieq jubbah",hands="Bagua Mitaines",ring1="Merman's Ring",ring2="Merman's Ring",
back="Shadow Mantle",waist="Goading Belt",legs="Nares Trews",feet="Geomancy Sandals"}
 
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
end
 
-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks that are called to process player actions at specific points in time.
-------------------------------------------------------------------------------------------------------------------
 
-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
-- Set eventArgs.useMidcastGear to true if we want midcast gear equipped on precast.
function job_precast(spell, action, spellMap, eventArgs)
 
end
 
-- Run after the general precast() is done.
function job_post_precast(spell, action, spellMap, eventArgs)
 
end
 
 
-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_midcast(spell, action, spellMap, eventArgs)
if spell.action_type == 'Magic' then
-- Default base equipment layer of fast recast.
equip(sets.midcast.FastRecast)
end
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
 
-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------
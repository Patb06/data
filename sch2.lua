include('organizer-lib')
-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job. Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------
--[[
Custom commands:
Shorthand versions for each strategem type that uses the version appropriate for
the current Arts.
Light Arts Dark Arts
gs c scholar light Light Arts/Addendum
gs c scholar dark Dark Arts/Addendum
gs c scholar cost Penury Parsimony
gs c scholar speed Celerity Alacrity
gs c scholar aoe Accession Manifestation
gs c scholar power Rapture Ebullience
gs c scholar duration Perpetuance
gs c scholar accuracy Altruism Focalization
gs c scholar enmity Tranquility Equanimity
gs c scholar skillchain Immanence
gs c scholar addendum Addendum: White Addendum: Black
--]]
-- Initialization function for this job file.
function get_sets()
mote_include_version = 2
-- Load and initialize the include file.
include('Mote-Include.lua')
end
-- Setup vars that are user-independent. state.Buff vars initialized here will automatically be tracked.
function job_setup()
info.addendumNukes = S{"Stone IV", "Water IV", "Aero IV", "Fire IV", "Blizzard IV", "Thunder IV",
"Stone V", "Water V", "Aero V", "Fire V", "Blizzard V", "Thunder V"}
state.Buff['Sublimation: Activated'] = buffactive['Sublimation: Activated'] or false
update_active_strategems()
end
-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job. Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------
-- Setup vars that are user-dependent. Can override this function in a sidecar file.
function user_setup()
state.OffenseMode:options('None', 'Normal')
state.CastingMode:options('Normal', 'Burst', 'Resistant')
state.IdleMode:options('Normal', 'PDT', 'Stun')
info.low_nukes = S{"Stone", "Water", "Aero", "Fire", "Blizzard", "Thunder"}
info.mid_nukes = S{"Stone II", "Water II", "Aero II", "Fire II", "Blizzard II", "Thunder II",
"Stone III", "Water III", "Aero III", "Fire III", "Blizzard III", "Thunder III",
"Stone IV", "Water IV", "Aero IV", "Fire IV", "Blizzard IV", "Thunder IV",}
info.high_nukes = S{"Stone V", "Water V", "Aero V", "Fire V", "Blizzard V", "Thunder V"}
gear.macc_hagondes = {name="Hagondes Cuffs", augments={'Phys. dmg. taken -3%','Mag. Acc.+29'}}
 
    send_command('bind ^` input /ma Stun <t>')
    send_command('bind !` input /ma Sandstorm <me>')
    send_command('bind ^, input /ma Sneak <me>')
    send_command('bind ^. input /ma Invisible <me>')
    send_command('bind ^; input /ja sublimation <me>')
    send_command('bind ^F1 input /ja Enmity Douse <t>')
    send_command('bind ^a input /ma aquaveil <me>')
    send_command('bind ^s input /ma Stone II <t>') 
    send_command('bind !a input /ma Stoneskin <me>')
    send_command('bind !i input /ma klimaform <me>')
    send_command('bind ^h input /ma hailstorm <me>')
select_default_macro_book()
end
function user_unload()
send_command('unbind ^`')
end
-- Define sets and vars used by this job file.
function init_gear_sets()
--------------------------------------
-- Start defining the sets
--------------------------------------
-- Precast Sets
-- Precast sets to enhance JAs
sets.precast.JA['Tabula Rasa'] = {legs="Pedagogy Pants"}
-- Fast cast sets for spells
sets.precast.FC = {  ammo="Incantor Stone",
    head="merlinic hood",
    body="Amalric Doublet",
    hands="Gendewitha Gages",
    legs="Psycloth Lappas", 
    feet="Regal Pumps +1",
    waist="Witful Belt",
    right_ear="Loquac. Earring",
    left_ear="Gifted Earring",
    left_ring="Prolix Ring",
    right_ring="veneficium ring",
    back="Swith Cape",}
sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {ammo="impatiens", head="umuthi hat",right_ring="veneficium ring", waist="Siegel Sash"})
sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {neck="Stoicheion Medal", left_ear="barkarole earring",})
sets.precast.Stoneskin= set_combine(sets.precast.FC,{ammo="impatiens", head="umuthi hat",right_ring="veneficium ring", waist="Siegel Sash"})
 
sets.precast.FC.Cure = set_combine(sets.precast.FC, {   main="Tamaxchi",
    sub="Sors Shield",
    ammo="Impatiens",
    head="Gende. Caubeen",
    body="Heka's Kalasiris",
    hands="Bokwus Gloves",
    legs="Orvail Pants +1",
    feet="Tutyr sabots",
    neck="Twilight Torque",
    waist="Hachirin-no-Obi",
    left_ear="Loquac. Earring",
    right_ear="Gifted Earring",
    left_ring="Defending Ring",
   right_ring="veneficium ring",
    back="Pahtli Cape",})
sets.precast.FC.Curaga = sets.precast.FC.Cure
sets.precast.FC.Impact = set_combine(sets.precast.FC['Elemental Magic'], {head=empty,body="Twilight Cloak"})
-- Midcast Sets
sets.midcast.FastRecast = {ammo="Incantor Stone",
 head="merlinic hood",
    body="Amalric Doublet",
    hands="repartie gloves",
    legs="Orvail Pants +1", 
    feet="Tutyr Sabots",
    waist="Hachirin-no-Obi",
    right_ear="Loquac. Earring",
    left_ear="Gifted Earring",
    left_ring="Defending Ring",
    right_ring="veneficium ring",
    back="Swith Cape",}
 
sets.midcast.Cure = {   main="Tamaxchi",
    sub="Sors Shield",
    ammo="Impatiens",
    head="Gende. Caubeen",
    body="Heka's Kalasiris",
    hands="Bokwus Gloves",
    legs="Orvail Pants +1",
    feet="Tutyr Sabots",
    neck="Incanter's Torque",
    waist="Hachirin-no-Obi",
    left_ear="Aredan Earring",
    right_ear="Lifestorm Earring",
    left_ring="Ephedra Ring",
    right_ring="Sirona's Ring",
    back="Pahtli Cape",}
 
sets.midcast.CureWithLightWeather = { main="Tamaxchi",
    sub="Sors Shield",
    ammo="Impatiens",
    head="Gende. Caubeen",
    body="Heka's Kalasiris",
    hands="Bokwus Gloves",
    legs="Orvail Pants +1",
    feet="Tutyr Sabots",
    neck="Incanter's Torque",
    waist="Hachirin-no-Obi",
    left_ear="Aredan Earring",
    right_ear="Lifestorm Earring",
    left_ring="Ephedra Ring",
    right_ring="Sirona's Ring",
    back="Pahtli Cape",}
 
sets.midcast.Curaga = sets.midcast.Cure
sets.midcast.Regen = {main="Bolelabunga",sub="genbu's shield",head="Arbatel Bonnet", back="bookworm's cape",}
sets.midcast.Cursna = {
neck="Malison Medallion",
hands="Hieros Mittens",ring1="Ephedra Ring",
feet="Gendewitha Galoshes"}
 
sets.midcast['Enhancing Magic'] = {ammo="Savant's Treatise",
head="Befouled Crown",neck="Incanter's Torque",left_ear="andoaa earring",
body="Manasa Chasuble",hands="Ayao's Gages",
waist="Olympus Sash",legs="Portent Pants"}
 
sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {head="umuthi hat",waist="Siegel Sash", left_ear="earthcry earring",})
sets.midcast.Storm = set_combine(sets.midcast['Enhancing Magic'], {feet="Pedagogy Loafers"})
sets.midcast.Protect = set_combine(sets.precast.FC, {   main="seveneyes", ammo="Clarus Stone",
    head="nares cap",
    body="Vanya Robe", 
    hands="Serpentes Cuffs",
    legs="Psycloth Lappas", 
    feet="umbani boots",
    neck="Incanter's Torque",
    waist="austerity belt",
    left_ear="Gifted Earring",
    right_ear="Gwati Earring",
left_ring="Sheltered Ring",
    right_ring="Paguroidea Ring",
    back="Shadow Mantle",})
sets.midcast.Protectra = sets.midcast.Protect
sets.midcast.Shell = {main="seveneyes",ammo="Clarus Stone",
    head="nares cap",
    body="Vanya Robe", 
    hands="Serpentes Cuffs",
    legs="Psycloth Lappas", 
    feet="Regal Pumps +1",
    neck="Incanter's Torque",
    waist="austerity belt",
    left_ear="Gifted Earring",
    right_ear="Gwati Earring",
left_ring="Sheltered Ring",
    right_ring="Paguroidea Ring",
    back="Shadow Mantle",}
sets.midcast.Shellra = sets.midcast.Shell
-- Custom spell classes
sets.midcast.MndEnfeebles = { main="akademos",  
  sub="niobid strap",
head="Befouled Crown",
neck="Incanter's Torque",
ear1="Psystorm earring",
ear2="Lifestorm earring",
body="Amalric Doublet",
hands="Gendewitha gages",
ring1="Sangoma ring",
ring2="Balrahn's ring",
back="Swith cape",
waist="Porous Rope",
legs="Vanya slops",
feet="Orvail souliers +1",}
 
 
sets.midcast.IntEnfeebles = {  main="akademos",  
 sub="niobid strap",
head="Befouled Crown",
neck="Incanter's Torque",
ear1="Psystorm earring",
ear2="Lifestorm earring",
body="Amalric Doublet",
hands="Gendewitha gages",
ring1="Sangoma ring",
ring2="Balrahn's ring",
back="Swith cape",
waist="Porous Rope",
legs="Vanya slops",
feet="Orvail souliers +1",}
 
 
sets.midcast.ElementalEnfeeble = sets.midcast.IntEnfeebles
sets.midcast['Dark Magic'] = { main="akademos",   
sub="niobid strap",
head="Befouled Crown",
neck="Incanter's Torque",
ear1="Psystorm earring",
ear2="Lifestorm earring",
body="Amalric Doublet",
hands="Gendewitha gages",
ring1="Sangoma ring",
ring2="Archon ring",
back="Swith cape",
waist="Porous Rope",
legs="Vanya slops",
feet="Orvail souliers +1",}
 
 
sets.midcast.Kaustra = { main="akademos",  
   sub="niobid strap",
range="aureole",    
head="merlinic hood",
hands="Helios Gloves",
legs="Gyve Trousers",
feet="umbani boots",
neck="Eddy Necklace",
waist="refoccilation stone",
eft_ear="Hecate's Earring",
right_ear="Friomisi Earring",
left_ring="Shiva Ring",
right_ring="Acumen Ring",
back="Bookworm's Cape",}
 
 
sets.midcast.Drain = { main="akademos",  
 sub="niobid strap",
    ammo="Memoria Sachet",
 head="merlinic hood",
  body="vanya robe",
    hands="helios gloves",
 legs="merlinic shalwar",
    feet="helios boots",
    neck="Incanter's Torque",
    waist="Fucho-no-Obi",
   left_ear="barkarole Earring",
    right_ear="Friomisi Earring",
    left_ring="archon Ring",
    right_ring="Sangoma Ring",
    back="Bookworm's Cape",}
 
sets.midcast.Aspir = sets.midcast.Drain
sets.midcast.Stun = {  main="akademos",
    sub="niobid strap",
    ammo="Impatiens",
  head="merlinic hood",
  body="vanya robe",
     hands="amalric gages",
    legs="merlinic shalwar",
     feet="helios boots",
    neck="Incanter's Torque",
    waist="Ovate Rope",
    left_ear="bakarole Earring",
    right_ear="Psystorm Earring",
    left_ring="Mediator's Ring",
    right_ring="Sangoma Ring",
    back="Bookworm's Cape",}
 
sets.midcast.Stun.Resistant = set_combine(sets.midcast.Stun, {main="baqil staff"})
-- Elemental Magic sets are default for handling low-tier nukes.
sets.midcast['Elemental Magic'] = {   main="akademos", 
sub="niobid strap",
   ammo="Ghastly Tathlum",
  head="merlinic hood",
    body="Amalric Doublet",
       hands="Helios Gloves",
    legs="Gyve Trousers",
    feet="Tutyr Sabots",
  neck="eddy necklace",
   waist="Porous Rope",
    left_ear="Hecate's Earring",
    right_ear="Friomisi Earring",
    left_ring="Shiva Ring",
    right_ring="Acumen Ring",
    back="Bookworm's Cape", 
}

 sets.midcast['Elemental Magic'].Burst = {   main="akademos", 
sub="niobid strap",
   ammo="Ghastly Tathlum",
  head="merlinic hood",
    body="Amalric Doublet",
       hands="Helios Gloves",
    legs="Gyve Trousers",
    feet="Tutyr Sabots",
  neck="mizukage-no-kubikazari",
   waist="Porous Rope",
    left_ear="Hecate's Earring",
    right_ear="Friomisi Earring",
    left_ring="Lotus Ring",
    right_ring="Mujin Band",
    back="Seshaw Cape", 
}
sets.midcast['Elemental Magic'].Resistant =  {main="akademos", 
sub="niobid strap",
 ammo="Ghastly Tathlum",
   head="merlinic hood",
    body="Amalric Doublet",
   hands="Helios Gloves",
      legs="merlinic shalwar",
     feet="Tutyr Sabots",
  neck="mizukage-no-kubikazari",
   waist="Porous Rope",
    left_ear="Hecate's Earring",
    right_ear="Friomisi Earring",
    left_ring="Shiva Ring",
    right_ring="Acumen Ring",
    back="Bookworm's Cape",
}
 
-- Custom refinements for certain nuke tiers
sets.midcast['Elemental Magic'].HighTierNuke = set_combine(sets.midcast['Elemental Magic'], { main="akademos",
sub="niobid strap",
 ammo="Ghastly Tathlum",
   head="merlinic hood",
    body="Amalric Doublet",
   hands="Helios Gloves",
      legs="merlinic shalwar",
     feet="Tutyr Sabots",
  neck="mizukage-no-kubikazari",
   waist="Porous Rope",
    left_ear="Hecate's Earring",
    right_ear="Friomisi Earring",
    left_ring="Shiva Ring",
    right_ring="Acumen Ring",
    back="Bookworm's Cape",
})
sets.midcast['Elemental Magic'].HighTierNuke.Burst = set_combine(sets.midcast['Elemental Magic'], { main="akademos",
sub="niobid strap",
 ammo="Ghastly Tathlum",
   head="merlinic hood",
    body="Amalric Doublet",
   hands="Helios Gloves",
      legs="merlinic shalwar",
     feet="Tutyr Sabots",
  neck="mizukage-no-kubikazari",
   waist="Porous Rope",
    left_ear="Hecate's Earring",
    right_ear="Friomisi Earring",
    left_ring="Lotus Ring",
    right_ring="Mujin Band",
    back="Seshaw Cape",
})
sets.midcast['Elemental Magic'].HighTierNuke.Resistant = set_combine(sets.midcast['Elemental Magic'].Resistant, {
sub="niobid strap",
 ammo="Ghastly Tathlum",
   head="merlinic hood",
    body="Amalric Doublet",
   hands="Helios Gloves",
      legs="merlinic shalwar",
     feet="Tutyr Sabots",
  neck="mizukage-no-kubikazari",
   waist="Porous Rope",
    left_ear="Hecate's Earring",
    right_ear="Friomisi Earring",
    left_ring="Shiva Ring",
    right_ring="Acumen Ring",
    back="Bookworm's Cape",
})
sets.midcast.Impact = {
main="akademos", 
sub="Mephitis Grip",
ammo="Dosis Tathlum",
head=empty,
neck="Eddy Necklace",
ear1="Psystorm Earring",
ear2="Lifestorm Earring",
body="Twilight Cloak",   
hands="amalric gages",   
legs="merlinic shalwar",
ring1="diamond Ring",
ring2="Sangoma Ring",
back="Toro Cape",
waist="Demonry Sash",
legs="Hagondes Pants",  
feet="helios boots",}
 
-- Sets to return to when not performing an action.
-- Resting sets
sets.resting = {    main="Chatoyant Staff",
sub="niobid strap",
    ammo="clarus stone",
    head="Befouled Crown",
    body="Amalric Double",
    hands="Serpentes Cuffs",
    legs="Assiduity Pants",
    feet="Chelona Boots",
    neck="Twilight Torque",
    waist="Austerity Belt +1",
    left_ear="Antivenom Earring",
    right_ear="Cassie Earring",
    left_ring="Defending Ring",
    right_ring="Paguroidea Ring",
    back="Repulse Mantle",}
 
-- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
sets.idle.Town = {   main="akademos",  
sub="niobid strap",
 ammo="homiliary",
    head="Befouled Crown",
      body="Amalric Doublet", 
    hands="Serpentes Cuffs",
    legs="Assiduity Pants",
    feet="Herald's Gaiters",
    neck="Twilight Torque",
    waist="Fucho-no-Obi",
   right_ear="Gwati Earring",
   left_ear="Gifted Earring",
    left_ring="Dark Ring",
    right_ring="Defending Ring",
    back="Mecistopins Mantle",}
sets.idle.Field = { main="akademos",  
sub="niobid strap",
    ammo="homiliary",
    head="Befouled Crown",
    body="Amalric Doublet", 
    hands="Serpentes Cuffs",
    legs="Assiduity Pants",
    feet="Herald's Gaiters",
    neck="Twilight Torque",
    waist="Fucho-no-Obi",
   right_ear="Gwati Earring",
   left_ear="Gifted Earring",
    left_ring="Dark Ring",
    right_ring="Defending Ring",
    back="Mecistopins Mantle",}
 
sets.idle.Field.PDT = { 
main="Earth Staff",
    sub="Niobid Strap",
 ammo="homiliary",
    head="Befouled Crown",
    body="Amalric Doublet",
    hands="Serpentes Cuffs",
    legs="Assiduity Pants",
    feet="Tutyr Sabots",
    neck="Twilight Torque",
    waist="Fucho-no-Obi",
    left_ear="Colossus's Earring",
    right_ear="Ethereal Earring",
    left_ring="Defending Ring",
    right_ring="Dark Ring",
    back="Cheviot Cape",
	}
 
sets.idle.Field.Stun = {     main="akademos",  
    sub="niobid strap",
    ammo="Incantor Stone",
    head="merlinic hood",
    body="Vanya Robe", 
    hands="Repartie Gloves",
    legs="Psycloth Lappas", 
    feet="Regal Pumps +1",
    neck="Imbodla Necklace",
    waist="Witful Belt",
    left_ear="Barkaro. Earring",
    right_ear="Gwati Earring",
    left_ring="Angha Ring",
    right_ring="Prolix Ring",
    back="Swith Cape"}
 
sets.idle.Weak = {}
-- Defense sets
sets.defense.PDT = {}
sets.defense.MDT = {}
sets.Kiting = {feet="desert boots"}
sets.latent_refresh = {waist="Fucho-no-obi"}
-- Engaged sets
-- Variations for TP weapon and (optional) offense/defense modes. Code will fall back on previous
-- sets if more refined versions aren't defined.
-- If you create a set with both offense and defense modes, the offense mode should be first.
-- EG: sets.engaged.Dagger.Accuracy.Evasion
-- Normal melee group
sets.engaged = {
 
waist="olseni belt",}
-- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
sets.buff['Ebullience'] = {head="Arbatel Bonnet"}
sets.buff['Rapture'] = {head="Arbatel Bonnet"}
sets.buff['Perpetuance'] = {hands="Savant's Bracers +1"}
sets.buff['Immanence'] = {hands="Savant's Bracers +1"}
sets.buff['Penury'] = {legs="arbatel Pants"}
sets.buff['Parsimony'] = {legs="arbatel pants"}
sets.buff['Celerity'] = {feet="argute Loafers"}
sets.buff['Alacrity'] = {feet="argute Loafers"}
sets.buff['Klimaform'] = {feet="arbatel loafers +1"}
sets.buff.FullSublimation = {}
sets.buff.PDTSublimation = {}
sets.buff['Sandstorm'] = {feet="Herald's Gaiters"}
end
-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------
-- Run after the general midcast() is done.
function job_post_midcast(spell, action, spellMap, eventArgs)
if spell.action_type == 'Magic' then
apply_grimoire_bonuses(spell, action, spellMap, eventArgs)
end
if spell.element == world.day_element or spell.element == world.weather_element then
        equip ({waist="Hachirin-no-Obi"})
    end
end
-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------
-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
function job_buff_change(buff, gain)
if buff == "Sublimation: Activated" then
handle_equipping_gear(player.status)
end
end
-- Handle notifications of general user state change.
 
-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------
-- Custom spell mapping.
function job_get_spell_map(spell, default_spell_map)
if spell.action_type == 'Magic' then
if default_spell_map == 'Cure' or default_spell_map == 'Curaga' then
if world.weather_element == 'Light' then
return 'CureWithLightWeather'
end
elseif spell.skill == 'Enfeebling Magic' then
if spell.type == 'WhiteMagic' then
return 'MndEnfeebles'
else
return 'IntEnfeebles'
end
elseif spell.skill == 'Elemental Magic' then
if info.low_nukes:contains(spell.english) then
return 'LowTierNuke'
elseif info.mid_nukes:contains(spell.english) then
return 'MidTierNuke'
elseif info.high_nukes:contains(spell.english) then
return 'HighTierNuke'
end
end
end
end
function customize_idle_set(idleSet)
if state.Buff['Sublimation: Activated'] then
if state.IdleMode.value == 'Normal' then
idleSet = set_combine(idleSet, sets.buff.FullSublimation)
elseif state.IdleMode.value == 'PDT' then
idleSet = set_combine(idleSet, sets.buff.PDTSublimation)
end
end
if player.mpp < 51 then
idleSet = set_combine(idleSet, sets.latent_refresh)
end
return idleSet
end
-- Called by the 'update' self-command.
function job_update(cmdParams, eventArgs)
if cmdParams[1] == 'user' and not (buffactive['light arts'] or buffactive['dark arts'] or
buffactive['addendum: white'] or buffactive['addendum: black']) then
if state.IdleMode.value == 'Stun' then
send_command('@input /ja "Dark Arts" <me>')
else
send_command('@input /ja "Light Arts" <me>')
end
end
update_active_strategems()
update_sublimation()
end
-- Function to display the current relevant user state when doing an update.
-- Return true if display was handled, and you don't want the default info shown.
function display_current_job_state(eventArgs)
display_current_caster_state()
eventArgs.handled = true
end
-------------------------------------------------------------------------------------------------------------------
-- User code that supplements self-commands.
-------------------------------------------------------------------------------------------------------------------
-- Called for direct player commands.
function job_self_command(cmdParams, eventArgs)
if cmdParams[1]:lower() == 'scholar' then
handle_strategems(cmdParams)
eventArgs.handled = true
end
end
-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------
-- Reset the state vars tracking strategems.
function update_active_strategems()
state.Buff['Ebullience'] = buffactive['Ebullience'] or false
state.Buff['Rapture'] = buffactive['Rapture'] or false
state.Buff['Perpetuance'] = buffactive['Perpetuance'] or false
state.Buff['Immanence'] = buffactive['Immanence'] or false
state.Buff['Penury'] = buffactive['Penury'] or false
state.Buff['Parsimony'] = buffactive['Parsimony'] or false
state.Buff['Celerity'] = buffactive['Celerity'] or false
state.Buff['Alacrity'] = buffactive['Alacrity'] or false
state.Buff['Klimaform'] = buffactive['Klimaform'] or false
end
function update_sublimation()
state.Buff['Sublimation: Activated'] = buffactive['Sublimation: Activated'] or false
end
-- Equip sets appropriate to the active buffs, relative to the spell being cast.
function apply_grimoire_bonuses(spell, action, spellMap)
if state.Buff.Perpetuance and spell.type =='WhiteMagic' and spell.skill == 'Enhancing Magic' then
equip(sets.buff['Perpetuance'])
end
if state.Buff.Rapture and (spellMap == 'Cure' or spellMap == 'Curaga') then
equip(sets.buff['Rapture'])
end
if spell.skill == 'Elemental Magic' and spellMap ~= 'ElementalEnfeeble' then
if state.Buff.Ebullience and spell.english ~= 'Impact' then
equip(sets.buff['Ebullience'])
end
if state.Buff.Immanence then
equip(sets.buff['Immanence'])
end
if state.Buff.Klimaform and spell.element == world.weather_element then
equip(sets.buff['Klimaform'])
end
end
if state.Buff.Penury then equip(sets.buff['Penury']) end
if state.Buff.Parsimony then equip(sets.buff['Parsimony']) end
if state.Buff.Celerity then equip(sets.buff['Celerity']) end
if state.Buff.Alacrity then equip(sets.buff['Alacrity']) end
 
end
 
-- General handling of strategems in an Arts-agnostic way.
-- Format: gs c scholar <strategem>
function handle_strategems(cmdParams)
-- cmdParams[1] == 'scholar'
-- cmdParams[2] == strategem to use
if not cmdParams[2] then
add_to_chat(123,'Error: No strategem command given.')
return
end
local strategem = cmdParams[2]:lower()
if strategem == 'light' then
if buffactive['light arts'] then
send_command('input /ja "Addendum: White" <me>')
elseif buffactive['addendum: white'] then
add_to_chat(122,'Error: Addendum: White is already active.')
else
send_command('input /ja "Light Arts" <me>')
end
elseif strategem == 'dark' then
if buffactive['dark arts'] then
send_command('input /ja "Addendum: Black" <me>')
elseif buffactive['addendum: black'] then
add_to_chat(122,'Error: Addendum: Black is already active.')
else
send_command('input /ja "Dark Arts" <me>')
end
elseif buffactive['light arts'] or buffactive['addendum: white'] then
if strategem == 'cost' then
send_command('input /ja Penury <me>')
elseif strategem == 'speed' then
send_command('input /ja Celerity <me>')
elseif strategem == 'aoe' then
send_command('input /ja Accession <me>')
elseif strategem == 'power' then
send_command('input /ja Rapture <me>')
elseif strategem == 'duration' then
send_command('input /ja Perpetuance <me>')
elseif strategem == 'accuracy' then
send_command('input /ja Altruism <me>')
elseif strategem == 'enmity' then
send_command('input /ja Tranquility <me>')
elseif strategem == 'skillchain' then
add_to_chat(122,'Error: Light Arts does not have a skillchain strategem.')
elseif strategem == 'addendum' then
send_command('input /ja "Addendum: White" <me>')
else
add_to_chat(123,'Error: Unknown strategem ['..strategem..']')
end
elseif buffactive['dark arts'] or buffactive['addendum: black'] then
if strategem == 'cost' then
send_command('input /ja Parsimony <me>')
elseif strategem == 'speed' then
send_command('input /ja Alacrity <me>')
elseif strategem == 'aoe' then
send_command('input /ja Manifestation <me>')
elseif strategem == 'power' then
send_command('input /ja Ebullience <me>')
elseif strategem == 'duration' then
add_to_chat(122,'Error: Dark Arts does not have a duration strategem.')
elseif strategem == 'accuracy' then
send_command('input /ja Focalization <me>')
elseif strategem == 'enmity' then
send_command('input /ja Equanimity <me>')
elseif strategem == 'skillchain' then
send_command('input /ja Immanence <me>')
elseif strategem == 'addendum' then
send_command('input /ja "Addendum: Black" <me>')
else
add_to_chat(123,'Error: Unknown strategem ['..strategem..']')
end
else
add_to_chat(123,'No arts has been activated yet.')
end
end
-- Gets the current number of available strategems based on the recast remaining
-- and the level of the sch.
function get_current_strategem_count()
-- returns recast in seconds.
local allRecasts = windower.ffxi.get_ability_recasts()
local stratsRecast = allRecasts[231]
local maxStrategems = (player.main_job_level + 10) / 20
local fullRechargeTime = 4*60
local currentCharges = math.floor(maxStrategems - maxStrategems * stratsRecast / fullRechargeTime)
return currentCharges
end
-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
set_macro_page(1, 8)
end
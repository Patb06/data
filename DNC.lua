-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job. Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------
--[[
Custom commands:
gs c step
Uses the currently configured step on the target, with either <t> or <stnpc> depending on setting.
gs c step t
Uses the currently configured step on the target, but forces use of <t>.
Configuration commands:
gs c cycle mainstep
Cycles through the available steps to use as the primary step when using one of the above commands.
gs c cycle altstep
Cycles through the available steps to use for alternating with the configured main step.
gs c toggle usealtstep
Toggles whether or not to use an alternate step.
gs c toggle selectsteptarget
Toggles whether or not to use <stnpc> (as opposed to <t>) when using a step.
--]]
-- Initialization function for this job file.

include('organizer-lib')
function get_sets()
mote_include_version = 2
-- Load and initialize the include file.
include('Mote-Include.lua')
end
-- Setup vars that are user-independent. state.Buff vars initialized here will automatically be tracked.
function job_setup()
state.Buff['Climactic Flourish'] = buffactive['climactic flourish'] or false
state.MainStep = M{['description']='Main Step', 'Box Step', 'Quickstep', 'Feather Step', 'Stutter Step'}
state.AltStep = M{['description']='Alt Step', 'Quickstep', 'Feather Step', 'Stutter Step', 'Box Step'}
state.UseAltStep = M(false, 'Use Alt Step')
state.SelectStepTarget = M(false, 'Select Step Target')
state.IgnoreTargetting = M(false, 'Ignore Targetting')
state.CurrentStep = M{['description']='Current Step', 'Main', 'Alt'}
state.SkillchainPending = M(false, 'Skillchain Pending')
determine_haste_group()
end
-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job. Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------
-- Setup vars that are user-dependent. Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('Normal', 'Acc')
    state.HybridMode:options('Normal', 'PDT')
    state.WeaponskillMode:options('Normal', 'Acc')
    state.PhysicalDefenseMode:options('PDT')


    gear.default.weaponskill_neck = "Fotia Torque"
    gear.default.weaponskill_waist = "Fotia Belt"
PKHercHead = { name="Herculean Helm", augments={'Accuracy+25','Weapon skill damage +3%','STR+8',}}
PKHercHands = { name="Herculean Gloves", augments={'Attack+3','"Triple Atk."+4','AGI+5','Accuracy+14',}}
PKHercLegs = { name="Herculean Trousers", augments={'Rng.Atk.+15','"Triple Atk."+4','STR+9','Attack+8',}}
PKHercHead = { name="Herculean Helm", augments={'Accuracy+27','Weapon skill damage +1%','DEX+8','Attack+8',}}
RSHercHands = { name="Herculean Gloves", augments={'Attack+3','"Triple Atk."+4','AGI+5','Accuracy+14',}}
RSHercLegs = { name="Herculean Trousers", augments={'Accuracy+30','"Waltz" potency +1%','STR+15','Attack+13',}}


select_default_macro_book()
end
-- Called when this job file is unloaded (eg: job change)
function user_unload()

end
-- Define sets and vars used by this job file.
function init_gear_sets()
--------------------------------------
-- Start defining the sets
--------------------------------------
-- Precast Sets
-- Precast sets to enhance JAs
sets.precast.JA['No Foot Rise'] = {body="Horos Casaque"}
sets.precast.JA['Trance'] = {head="Horos Tiara"}

    sets.Organizer = {
        body="Taming Sari",
        legs="Sublime Sushi",
        ring2="Taming Sari",
        ring1="",
		ranged="",
    }


-- Waltz set (chr and vit)
sets.precast.Waltz = {
ammo="Sonia's Plectrum",
head="Horos Tiara",
ear1="Roundel Earring",
body="Maxixi Casaque",
hands="Herculean Gloves",
ring1="Asklepian Ring",
ring2="Valseur's Ring",
back="Toetapper Mantle",
waist="Aristo Belt",
legs="Dashing Subligar",
feet="Maxixi Toe Shoes"}

-- Don't need any special gear for Healing Waltz.
sets.precast.Waltz['Healing Waltz'] = {}
sets.precast.Samba = {head="Dancer's Tiara"}
sets.precast.Jig = {legs="Horos Tights", feet="Maxixi Toe Shoes"}
sets.precast.Step = {waist="Chaac Belt"}
sets.precast.Step['Feather Step'] = {feet="Charis Shoes +2"}
sets.precast.Flourish1 = {}

sets.precast.Flourish1['Violent Flourish'] = {
ear1="Psystorm Earring",
ear2="Lifestorm Earring",
body="Horos Casaque",
hands="Buremte Gloves",
ring2="Sangoma Ring",
waist="Chaac Belt",
} -- magic accuracy

sets.precast.Flourish1['Desperate Flourish'] = {
ammo="Ginsen",
head="Whirlpool Mask",
neck="Ej Necklace",
body="Horos Casaque",
hands="Buremte Gloves",
ring1="Beeline Ring",
back="Toetapper Mantle",
waist="Hurch'lan Sash",
} -- acc gear

sets.precast.Flourish2 = {}
sets.precast.Flourish2['Reverse Flourish'] = {hands="Maculele Bangles"}

sets.precast.Flourish3 = {}
sets.precast.Flourish3['Striking Flourish'] = {body="Maculele Casaque"}
sets.precast.Flourish3['Climactic Flourish'] = {head="Maculele Tiara"}

-- Fast cast sets for spells
sets.precast.FC = {ammo="Impatiens",head="Haruspex Hat",ear2="Loquacious Earring",hands="Thaumas Gloves",ring1="Prolix Ring"}
sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads"})

-- Weaponskill sets
-- Default set for any weaponskill that isn't any more specifically defined
sets.precast.WS = {
ammo="Charis Feather",
head="Skormoth Mask",
neck="Fotia Gorget",
ear1="Bladeborn Earring",
ear2="Steelflash Earring",
body="Rawhide Vest",
hands='Lustratio Mittens',
ring1="Karieyh Ring",ring2="Epona's Ring",
back="Toetapper Mantle",
waist="Fotia Belt",
legs=PKHercLegs,
feet="Taeon Boots"}

sets.precast.WS.Acc = set_combine(sets.precast.WS, {
ammo="Honed Tathlum", 
back="Toetapper Mantle"
})

-- Specific weaponskill sets. Uses the base set if an appropriate WSMod version isn't found.
sets.precast.WS['Exenterator'] = set_combine(sets.precast.WS, {
neck="Fotia Gorget",
hands="Leyline Gloves",
ring1="Karieyh Ring",
ring2="Apate Ring",
waist="Fotia Belt",
})

sets.precast.WS['Exenterator'].Acc = set_combine(sets.precast.WS['Exenterator'], {
ammo="Honed Tathlum", 
back="Toetapper Mantle"
})

sets.precast.WS['Pyrrhic Kleos'] = {
ammo="Ginsen",
head="Skormoth Mask",
neck="Fotia Gorget",
ear1="Steelflash Earring",
ear2="Bladeborn Earring",
body="Lustratio Harness",
hands="Lustratio Mittens",
ring1="Karieyh Ring",
ring2="Epona's Ring",
back="Toetapper Mantle",
waist="Fotia Belt",
legs=PKHercLegs,
feet="Taeon Tights"
}

sets.precast.WS['Evisceration'] = set_combine(sets.precast.WS, {
ammo="Ginsen",
head="Uk'uxkaj Cap",
neck="Rancor Collar", 
hands="Lustratio Mittens",
})

sets.precast.WS['Evisceration'].Acc = set_combine(sets.precast.WS['Evisceration'], {
ammo="Honed Tathlum",
hands="Lustratio Mittens", 
back="Toetapper Mantle"
})

sets.precast.WS["Rudra's Storm"] = set_combine(sets.precast.WS, {
ammo="Charis Feather",
hands="Lustratio Mittens",
})

sets.precast.WS["Rudra's Storm"].Acc = set_combine(sets.precast.WS["Rudra's Storm"], {
ammo="Honed Tathlum", 
back="Kayapa Cape",
hands="Lustratio Mittens",
})

sets.precast.Skillchain = {
hands="Maculele Bangles"
}
-- Midcast Sets
sets.midcast.FastRecast = {
head="Skormoth Mask",
ear2="Loquacious Earring",
body="Iuitl Vest",
hands="Leyline Gloves",
feet="Iuitl Gaiters +1"}

-- Specific spells
sets.midcast.Utsusemi = {
head="Skormoth Mask",
neck="Ej Necklace",
ear2="Loquacious Earring",
body="Iuitl Vest",
hands="Iuitl Wristbands",
ring1="Karieyh Ring",
back="Toetapper Mantle",
legs="Samnuha Tights",
feet="Iuitl Gaiters +1"
}

-- Sets to return to when not performing an action.
-- Resting sets
sets.resting = {
head="Ocelomeh Headpiece +1",
neck="Wiglen Gorget",
ring1="Karieyh Ring",
ring2="Paguroidea Ring"
}
sets.ExtraRegen = {
head="Ocelomeh Headpiece +1"
}

-- Idle sets
sets.idle = {
ammo="Iron Gobbet",
head="Skormoth Mask",
neck="Wiglen Gorget",
ear1="Dudgeon Earring",
ear2="Heartseeker Earring",
body="Rawhide Vest",
hands="Iuitl Wristbands",
ring1="Karieyh Ring",
ring2="Paguroidea Ring",
back="Mecistopins Mantle",
waist="Flume Belt",
legs="Samnuha Tights",
feet="Skadi's Jambeaux +1"
}

sets.idle.Town = {
ammo="Ginsen",
head="Skormoth Mask",
neck="Charis Necklace",
ear1="Dudgeon Earring",
ear2="Heartseeker Earring",
body="Rawhide Vest",
hands="Iuitl Wristbands",
ring1="Karieyh Ring",
ring2="Paguroidea Ring",
back="Toetapper Mantle",
waist="Patentia Sash",
legs="Samnuha Tights",
feet="Skadi's Jambeaux +1"
}

sets.idle.Weak = {
ammo="Iron Gobbet",
head="Skormoth Mask",
neck="Wiglen Gorget",
ear1="Dudgeon Earring",
ear2="Heartseeker Earring",
body="Rawhide Vest",
hands="Buremte Gloves",
ring1="Karieyh Ring",
ring2="Paguroidea Ring",
back="Shadow Mantle",
waist="Flume Belt",
legs="Samnuha Tights",
feet="Skadi's Jambeaux +1"
}

-- Defense sets
sets.defense.PDT = {
ammo="Iron Gobbet",
head="Skormoth Mask",
neck="Twilight Torque",
body="Rawhide Vest",
hands="Iuitl Wristbands",
ring1="Defending Ring",
ring2=gear.DarkRing.physical,
back="Shadow Mantle",
waist="Flume Belt",
legs="Nahtirah Trousers",
feet="Iuitl Gaiters +1"
}

sets.defense.MDT = {
ammo="Demonry Stone",
head="Skormoth Mask",
neck="Twilight Torque",
body="Rawhide Vest",
hands="Wayfarer Cuffs",
ring1="Defending Ring",
ring2="Shadow Ring",
back="Engulfer Cape",
waist="Flume Belt",
legs="Wayfarer Slops",
feet="Wayfarer Clogs"
}

sets.Kiting = {
feet="Skadi's Jambeaux +1"
}
-- Engaged sets
-- Variations for TP weapon and (optional) offense/defense modes. Code will fall back on previous
-- sets if more refined versions aren't defined.
-- If you create a set with both offense and defense modes, the offense mode should be first.
-- EG: sets.engaged.Dagger.Accuracy.Evasion
-- Normal melee group

sets.inwkr = {
		neck="Ygnas's Resolve +1"
}

sets.engaged = {
ammo="Ginsen",
head="Taeon Chapeau",
neck="Charis Necklace",
ear1="Dudgeon Earring",
ear2="Heartseeker Earring",
body="Maculele Casaque",
hands="Leyline Gloves",
ring1="Karieyh Ring",
ring2="Epona's Ring",
back="Toetapper Mantle",
waist="Patentia Sash",
legs="Samnuha Tights",
feet="Taeon Boots"
}

sets.engaged.Acc = {
ammo="Honed Tathlum",
head="Taeon Chapeau",
neck="Charis Necklace",
ear1="Brutal Earring",
ear2="Zennaroi Earring",
body="Maculele Casaque",
hands="Leyline Gloves",
ring1="Karieyh Ring",
ring2="Epona's Ring",
back="Toetapper Mantle",
waist="Hurch'lan Sash",
legs="Samnuha Tights",
feet="Taeon Boots"
}

sets.engaged.PDT = {
ammo="Ginsen",
head="Taeon Chapeau",
neck="Charis Necklace",
ear1="Dudgeon Earring",
ear2="Heartseeker Earring",
body="Maculele Casaque",
hands="Maxixi Bangles",
ring1="Defending Ring",
ring2="Epona's Ring",
back="Toetapper Mantle",
waist="Patentia Sash",
legs="Samnuha Tights",
feet="Taeon Boots"
}

sets.engaged.Acc.PDT = {
ammo="Ginsen",
head="Taeon Chapeau",
neck="Charis Necklace",
ear1="Dudgeon Earring",
ear2="Heartseeker Earring",
body="Maculele Casaque",
hands="Leyline Gloves",
ring1="Defending Ring",
ring2="Epona's Ring",
back="Toetapper Mantle",
waist="Windbuffet belt",
legs=PKHercLegs,
feet="Taeon Boots"
}

-- Custom melee group: High Haste (2x March or Haste)
sets.engaged.HighHaste = {
ammo="Ginsen",
head="Skormoth Mask",
neck="Charis Necklace",
ear1="Dudgeon Earring",
ear2="Heartseeker Earring",
body="Rawhide Vest",
hands="Leyline Gloves",
ring1="Karieyh Ring",
ring2="Epona's Ring",
back="Toetapper Mantle",
waist="Patentia Sash",
legs="Samnuha Tights",
feet="Taeon Boots"
}

sets.engaged.Acc.HighHaste = {
ammo="Ginsen",
head="Taeon Chapeau",
neck="Lissome Necklace",
ear1="Brutal Earring",
ear2="Zennaroi Earring",
body="Rawhide Vest",
hands="Leyline Gloves",
ring1="Karieyh Ring",
ring2="Epona's Ring",
back="Toetapper Mantle",
waist="Windbuffet belt",
legs=PKHercLegs,
feet="Taeon Boots"
}

sets.engaged.PDT.HighHaste = {
ammo="Ginsen",
head="Skormoth Mask",
neck="Charis Necklace",
ear1="Dudgeon Earring",
ear2="Heartseeker Earring",
body="Rawhide Vest",
hands="Leyline Gloves",
ring1="Defending Ring",
ring2="Epona's Ring",
back="Toetapper Mantle",
waist="Patentia Sash",
legs="Samnuha Tights",
feet="Taeon Boots"
}

sets.engaged.Acc.PDT.HighHaste = {
ammo="Ginsen",
head="Skormoth Mask",
neck="Lissome Necklace",
ear1="Brutal Earring",
ear2="Zennaroi Earring",
body="Rawhide Vest",
hands="Leyline Gloves",
ring1="Apate Ring",
ring2="Epona's Ring",
back="Toetapper Mantle",
waist="Hurch'lan Sash",
legs=PKHercLegs,
feet="Taeon Boots"
}

-- Custom melee group: Max Haste (2x March + Haste)
sets.engaged.MaxHaste = {
ammo="Ginsen",
head="Skormoth Mask",
neck="Asperity Necklace",
ear1="Bladeborn Earring",
ear2="Steelflash Earring",
body="Rawhide Vest",
hands="Leyline Gloves",
ring1="Karieyh Ring",
ring2="Epona's Ring",
back="Toetapper Mantle",
waist="Windbuffet belt",
legs="Samnuha Tights",
feet="Taeon Boots"
}

-- Getting Marches+Haste from Trust NPCs, doesn't cap delay.

sets.engaged.Acc.MaxHaste = {
ammo="Ginsen",
head=PKHercHead,
neck="Lissome Necklace",
ear1="Brutal Earring",
ear2="Zennaroi Earring",
body="Rawhide Vest",
hands="Leyline Gloves",
ring1="Karieyh Ring",
ring2="Epona's Ring",
back="Toetapper Mantle",
waist="Hurch'lan Sash",
legs=PKHercLegs,
feet="Taeon Boots"
}

sets.engaged.PDT.MaxHaste = {
ammo="Ginsen",
head="Skormoth Mask",
neck="Charis Necklace",
ear1="Bladeborn Earring",
ear2="Steelflash Earring",
body="Rawhide Vest",
hands="Leyline Gloves",
ring1="Defending Ring",
ring2="Epona's Ring",
back="Toetapper Mantle",
waist="Windbuffet belt",
legs="Samnuha Tights",
feet="Taeon Boots"
}

sets.engaged.Acc.PDT.MaxHaste = {
ammo="Ginsen",
head=PKHercHead,
neck="Lissome Necklace",
ear1="Brutal Earring",
ear2="Zennaroi Earring",
body="Rawhide Vest",
hands="Leyline Gloves",
ring1="Apate Ring",
ring2="Epona's Ring",
back="Toetapper Mantle",
waist="Hurch'lan Sash",
legs=PKHercLegs,
feet="Taeon Boots"
}

-- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
sets.buff['Saber Dance'] = {
legs="Horos Tights"
}

sets.buff['Climactic Flourish'] = {
head="Maculele Tiara"
}
end
-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------
-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
-- Set eventArgs.useMidcastGear to true if we want midcast gear equipped on precast.
function job_precast(spell, action, spellMap, eventArgs)
--auto_presto(spell)
end
function job_post_precast(spell, action, spellMap, eventArgs)
if spell.type == "WeaponSkill" then
if state.Buff['Climactic Flourish'] then
equip(sets.buff['Climactic Flourish'])
end
if state.SkillchainPending.value == true then
equip(sets.precast.Skillchain)
end
end
end
-- Return true if we handled the aftercast work. Otherwise it will fall back
-- to the general aftercast() code in Mote-Include.
function job_aftercast(spell, action, spellMap, eventArgs)
if not spell.interrupted then
if spell.english == "Wild Flourish" then
state.SkillchainPending:set()
send_command('wait 5;gs c unset SkillchainPending')
elseif spell.type:lower() == "weaponskill" then
state.SkillchainPending:toggle()
send_command('wait 6;gs c unset SkillchainPending')
end
end
end
if buffactive["reive mark"] then
        equip(sets.inwkr)
end
-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------
-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
function job_buff_change(buff,gain)
-- If we gain or lose any haste buffs, adjust which gear set we target.
if S{'haste','march','embrava','haste samba'}:contains(buff:lower()) then
determine_haste_group()
handle_equipping_gear(player.status)
elseif buff == 'Saber Dance' or buff == 'Climactic Flourish' then
handle_equipping_gear(player.status)
end
end
function job_status_change(new_status, old_status)
if new_status == 'Engaged' then
determine_haste_group()
end
end
-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------
-- Called by the default 'update' self-command.
function job_update(cmdParams, eventArgs)
determine_haste_group()
end
function customize_idle_set(idleSet)
if player.hpp < 80 and not areas.Cities:contains(world.area) then
idleSet = set_combine(idleSet, sets.ExtraRegen)
end
return idleSet
end

function customize_melee_set(meleeSet)
if state.DefenseMode.value ~= 'None' then
if buffactive['saber dance'] then
meleeSet = set_combine(meleeSet, sets.buff['Saber Dance'])
end
if state.Buff['Climactic Flourish'] then
meleeSet = set_combine(meleeSet, sets.buff['Climactic Flourish'])
end
end
return meleeSet
end
-- Handle auto-targetting based on local setup.
function job_auto_change_target(spell, action, spellMap, eventArgs)
if spell.type == 'Step' then
if state.IgnoreTargetting.value == true then
state.IgnoreTargetting:reset()
eventArgs.handled = true
end
eventArgs.SelectNPCTargets = state.SelectStepTarget.value
end
end
-- Function to display the current relevant user state when doing an update.
-- Set eventArgs.handled to true if display was handled, and you don't want the default info shown.
function display_current_job_state(eventArgs)
local msg = 'Melee'
if state.CombatForm.has_value then
msg = msg .. ' (' .. state.CombatForm.value .. ')'
end
msg = msg .. ': '
msg = msg .. state.OffenseMode.value
if state.HybridMode.value ~= 'Normal' then
msg = msg .. '/' .. state.HybridMode.value
end
msg = msg .. ', WS: ' .. state.WeaponskillMode.value
if state.DefenseMode.value ~= 'None' then
msg = msg .. ', ' .. 'Defense: ' .. state.DefenseMode.value .. ' (' .. state[state.DefenseMode.value .. 'DefenseMode'].value .. ')'
end
if state.Kiting.value then
msg = msg .. ', Kiting'
end
msg = msg .. ', ['..state.MainStep.current
if state.UseAltStep.value == true then
msg = msg .. '/'..state.AltStep.current
end
msg = msg .. ']'
if state.SelectStepTarget.value == true then
steps = steps..' (Targetted)'
end
add_to_chat(122, msg)
eventArgs.handled = true
end
-------------------------------------------------------------------------------------------------------------------
-- User self-commands.
-------------------------------------------------------------------------------------------------------------------
-- Called for custom player commands.
function job_self_command(cmdParams, eventArgs)
if cmdParams[1] == 'step' then
if cmdParams[2] == 't' then
state.IgnoreTargetting:set()
end
local doStep = ''
if state.UseAltStep.value == true then
doStep = state[state.CurrentStep.current..'Step'].current
state.CurrentStep:cycle()
else
doStep = state.MainStep.current
end
send_command('@input /ja "'..doStep..'" <t>')
end
end
-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------
function determine_haste_group()
-- We have three groups of DW in gear: Charis body, Charis neck + DW earrings, and Patentia Sash.
-- For high haste, we want to be able to drop one of the 10% groups (body, preferably).
-- High haste buffs:
-- 2x Marches + Haste
-- 2x Marches + Haste Samba
-- 1x March + Haste + Haste Samba
-- Embrava + any other haste buff
-- For max haste, we probably need to consider dropping all DW gear.
-- Max haste buffs:
-- Embrava + Haste/March + Haste Samba
-- 2x March + Haste + Haste Samba
classes.CustomMeleeGroups:clear()
if buffactive.embrava and (buffactive.haste or buffactive.march) and buffactive['haste samba'] then
classes.CustomMeleeGroups:append('MaxHaste')
elseif buffactive.march == 2 and buffactive.haste and buffactive['haste samba'] then
classes.CustomMeleeGroups:append('MaxHaste')
elseif buffactive.embrava and (buffactive.haste or buffactive.march or buffactive['haste samba']) then
classes.CustomMeleeGroups:append('HighHaste')
elseif buffactive.march == 1 and buffactive.haste and buffactive['haste samba'] then
classes.CustomMeleeGroups:append('HighHaste')
elseif buffactive.march == 2 and (buffactive.haste or buffactive['haste samba']) then
classes.CustomMeleeGroups:append('HighHaste')
end
end
-- Automatically use Presto for steps when it's available and we have less than 3 finishing moves
function auto_presto(spell)
if spell.type == 'Step' then
local allRecasts = windower.ffxi.get_ability_recasts()
local prestoCooldown = allRecasts[236]
local under3FMs = not buffactive['Finishing Move 3'] and not buffactive['Finishing Move 4'] and not buffactive['Finishing Move 5']
if player.main_job_level >= 77 and prestoCooldown < 1 and under3FMs then
cast_delay(1.1)
send_command('@input /ja "Presto" <me>')
end
end
if state.HasteMode.value == 'Hi' then
        if ( ((buffactive[33] or buffactive[580]) and buffactive.march) or (buffactive.embrava and buffactive[33]) or (buffactive.embrava and buffactive.march == 1) ) then
            add_to_chat(8, '-------------Max-Haste Mode Enabled--------------')
        elseif ( (buffactive[33] or buffactive.march == 2) and buffactive['haste samba'] ) or buffactive.embrava then
            add_to_chat(8, '-------------Haste 35%-------------')
        elseif buffactive[580] or buffactive[33] or buffactive.march == 2 then
            add_to_chat(8, '-------------Haste 30%-------------')
        elseif buffactive.march == 1 then
            add_to_chat(8, '-------------Haste 15%-------------')
        end
    else
        if ( buffactive[580] and ( buffactive.march or buffactive[33] or buffactive.embrava) ) or 
           ( buffactive.embrava and buffactive.march == 2 ) or (buffactive[33] and buffactive.march == 2) or 
           ( buffactive.embrava and ( buffactive.march == 1 or buffactive[33] ) ) then
            add_to_chat(8, '-------------Max Haste Mode Enabled--------------')         
        elseif (buffactive[33] and buffactive['haste samba'] and buffactive.march == 1) or buffactive.embrava or (buffactive.march == 2 and buffactive['haste samba']) then
            add_to_chat(8, '-------------Haste 35%-------------')         
        elseif buffactive.march == 2 or (buffactive[33] and buffactive.march == 1) or buffactive[580] then
            add_to_chat(8, '-------------Haste 30%-------------')      
        elseif buffactive[33] or buffactive.march == 1 then
            add_to_chat(8, '-------------Haste 15%-------------')
        end
    end
end


-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
-- Default macro set/book
if player.sub_job == 'WAR' then
set_macro_page(1, 6)
elseif player.sub_job == 'NIN' then
set_macro_page(1, 6)
elseif player.sub_job == 'SAM' then
set_macro_page(1, 6)
else
set_macro_page(1, 6)
end
end
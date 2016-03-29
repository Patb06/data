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

include('organizer-lib')
-- Setup vars that are user-independent.
function job_setup()
  -- List of pet weaponskills to check for
  petWeaponskills = S{"Slapstick", "Knockout", "Magic Mortar",
    "Chimera Ripper", "String Clipper",  "Cannibal Blade", "Bone Crusher", "String Shredder",
    "Arcuballista", "Daze", "Armor Piercer", "Armor Shatterer"}

  -- Map automaton heads to combat roles
  petModes = {
    ['Harlequin Head'] = 'Melee',
    ['Sharpshot Head'] = 'Ranged',
    ['Valoredge Head'] = 'Tank',
    ['Stormwaker Head'] = 'Magic',
    ['Soulsoother Head'] = 'Tank',
    ['Spiritreaver Head'] = 'Nuke'
    }

  -- Subset of modes that use magic
  magicPetModes = S{'Nuke','Heal','Magic'}

  -- Var to track the current pet mode.
  state.PetMode = M{['description']='Pet Mode', 'None', 'Melee', 'Ranged', 'Tank', 'Magic', 'Heal', 'Nuke'}

  include('Mote-TreasureHunter')
end


-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
  -- Options: Override default values
  state.OffenseMode:options('Normal', 'Acc', 'Fodder')
  state.WeaponskillMode:options('Normal', 'Acc', 'Fodder')
  state.PhysicalDefenseMode:options('PDT', 'Evasion')
  state.MagicalDefenseMode:options('MDT')

  send_command('bind ^= gs c cycle treasuremode')

  update_pet_mode()
  select_default_macro_book()
end


-- Define sets used by this job file.
function init_gear_sets()

  sets.TreasureHunter = {waist="Chaac Belt"}
  -- Precast Sets

  -- Fast cast sets for spells
  sets.precast.FC = {
    head="Rawhide Mask",neck="Orunmila's Torque",ear1="Loquacious Earring",
    body="Anhur Robe",ring1="Veneficium Ring",ring2="Prolix Ring",
    back="Swith Cape",waist="Hurch'lan Sash",feet="Regal Pumps +1"
  }

  sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads"})


  -- Precast sets to enhance JAs
  sets.precast.JA['Tactical Switch'] = {feet="Karagoz Scarpe +1"}

  sets.precast.JA['Repair'] = {
    main="Nibiru Sainti",ammo="Automaton Oil +3",
    ear1="Guignol Earring",ear2="Pratik Earring",
    legs="Desultor Tassets",feet="Foire Bab. +1"
  }

  sets.precast.JA['Maintenance'] = {ammo="Automaton Oil"}

  sets.precast.JA.Maneuver = {neck="Bfn. Collar +1",ear2="Burana Earring",body="Karagoz Farsetto",hands="Puppetry Dastanas",back="Dispersal Mantle"}

  -- Waltz set (chr and vit)
  sets.precast.Waltz = {
    ear1="Roundel Earring",
    body="Pitre Tobe +1",hands="Regimen Mittens",ring1="Spiral Ring",
    back="Refraction Cape",legs="Naga Hakama",feet="Dance Shoes"}

  -- Don't need any special gear for Healing Waltz.
  sets.precast.Waltz['Healing Waltz'] = {}


  -- Weaponskill sets
  -- Default set for any weaponskill that isn't any more specifically defined
  sets.precast.WS = {
    neck="Fotia Gorget",ear1="Bladeborn Earring",ear2="Steelflash Earring",
    ring1="Rajas Ring",ring2="Epona's Ring",
    back="Dispersal Mantle",waist="Fotia Belt",legs="Samnuha Tights",}

  -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
  sets.precast.WS['Stringing Pummel'] = set_combine(sets.precast.WS, {
    ear1="Brutal Earring",ear2="Moonshade Earring",
    ring1="Spiral Ring"})

  sets.precast.WS['Victory Smite'] = set_combine(sets.precast.WS, {
    ear1="Brutal Earring",ear2="Moonshade Earring",
    ring1="Pyrosoul Ring"})

  -- Midcast Sets

  -- Midcast sets for pet actions
  sets.midcast.Pet.Cure = {
    head="Naga Somen",
    body="Naga Samue",hands="Regimen Mittens",ring1="Kunaji Ring",ring2="Thurandaut Ring",
    back="Refraction Cape",waist="Ukko Sash",legs="Naga Hakama",feet="Foire Bab. +1"}

  sets.midcast.Pet['Elemental Magic'] = {
    head="Rawhide Mask",ear1="Charivari Earring",ear2="Burana Earring",
    hands="Naga Tekko",ring2="Thurandaut Ring",
    back="Argochampsa Mantle",waist="Ukko Sash",legs="Karaggoz Pantaloni +1",feet="Pitre Babouches +1"}

  sets.midcast.Pet.WeaponSkill = {
    head="Karagoz Capello +1",neck="Empath Necklace",ear1="Charivari Earring",ear2="Burana Earring",
    body="Pitre Tobe +1",hands="Karagoz Guanti +1",ring1="Overbearing Ring",ring2="Thurandaut Ring",
    back="Dispersal Mantle",waist="Ukko Sash",legs="Karaggoz Pantaloni +1",feet="Naga Kyahan"}


  -- Sets to return to when not performing an action.

  -- Resting sets
  sets.resting = {
    head="Pitre Taj +1",neck="Wiglen Gorget",ear1="Infused Earring",ear2="Burana Earring",
    ring1="Sheltered Ring",ring2="Paguroidea Ring",
    back="Contriver's Cape"}

  -- Idle sets
  sets.idle = {
    main="",ammo="Automat. Oil +3",
    head="Pitre Taj +1",neck="Wiglen Gorget",ear1="Infused Earring",ear2="Burana Earring",
    hands="Rao Kote",ring1="Sheltered Ring",ring2="Paguroidea Ring",
    back="Mecistopins Mantle",waist="Lycopodium Sash",legs="Rao Haidate +1",feet="Hermes' Sandals"}

	sets.idle.pdt = set_combine(sets.idle, {
	main="Earth Staff",
    head="Ptica Headgear",neck="Subtlety Spectacles",ear1="Heartseeker Earring",
    body="Pitre Tobe +1",ring1="Defending Ring",ring2="Dark Ring",
    waist="Hurch'lan Sash",legs=="Karagoz Scarpe +1"
  })
	
  -- Set for idle while pet is out (eg: pet regen gear)
  sets.idle.Pet = set_combine(sets.idle, {main="Ohtas",neck="Empath Necklace",ring2="Thurandaut Ring",back="Contriver's Cape",waist="Isa Belt"})

  -- Idle sets to wear while pet is engaged
  sets.idle.Pet.Engaged = {
    ammo="Automat. Oil +3",
    head="Herculean Helm",neck="Empath Necklace",ear1="Handler's Earring +1",ear2="Handler's Earring",
    body="Rao Togi",hands="Rao Kote",ring1="Overbearing Ring",ring2="Thurandaut Ring",
    back="Mecistopins Mantle",waist="Ukko Sash",legs="Rao Haidate",feet="Taeon Boots"}

  sets.idle.Pet.Engaged.Ranged = sets.idle.Pet.Engaged
  sets.idle.Pet.Engaged.Nuke = set_combine(sets.idle.Pet.Engaged, {legs="Karaggoz Pantaloni +1",feet="Pitre Babouches +1"})
  sets.idle.Pet.Engaged.Magic = sets.idle.Pet.Engaged

 	sets.idle.Pet.Engaged.Tank = {
    ammo="Automat. Oil +3",
    head="Herculean Helm",
    body="Rao Togi",
    hands="Rao Kote",
    legs="Rao Haidate",
    feet={ name="Taeon Boots", augments={'Pet: Attack+9 Pet: Rng.Atk.+9','Pet: "Dbl. Atk."+4','Pet: Damage taken -4%',}},
    neck="Twilight Torque",
    waist="Isa Belt",
    left_ear="Handler's Earring",
    right_ear="Handler's Earring +1",
    left_ring="Overbearing Ring",
    right_ring="Thurandaut Ring",
    back="Karagoz Mantle +1",}

  -- Engaged sets

  -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
  -- sets if more refined versions aren't defined.
  -- If you create a set with both offense and defense modes, the offense mode should be first.
  -- EG: sets.engaged.Dagger.Accuracy.Evasion
sets.inwkr = {
		neck="Ygnas's Resolve +1"}
  -- Normal melee group
  sets.engaged = {
    ammo="Automat. Oil +3",
    head={ name="Taeon Chapeau", augments={'Accuracy+17 Attack+17','"Dual Wield"+5','Crit. hit damage +3%',}},
    body={ name="Taeon Tabard", augments={'Attack+19','Pet: "Regen"+2','Pet: Damage taken -3%',}},
    hands="Count's Cuffs",
    legs={ name="Samnuha Tights", augments={'STR+8','DEX+9','"Dbl.Atk."+3','"Triple Atk."+2',}},
    feet={ name="Taeon Boots", augments={'Accuracy+19 Attack+19','"Triple Atk."+2',}},
    neck="Asperity Necklace",
    waist="Windbuffet Belt",
    left_ear="Bladeborn Earring",
    right_ear="Steelflash Earring",
    left_ring="Epona's Ring",
    right_ring="Etana Ring",
    back="Dispersal Mantle",
	}

  sets.engaged.Acc = set_combine(sets.engaged, {
    head="Ptica Headgear",neck="Subtlety Spectacles",ear1="Heartseeker Earring",
    body="Pitre Tobe +1",ring2="Oneiros Annulet",
    waist="Hurch'lan Sash",legs=="Karagoz Scarpe +1"
  })

end


-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks that are called to process player actions at specific points in time.
-------------------------------------------------------------------------------------------------------------------

-- Called when player is about to perform an action
function job_precast(spell, action, spellMap, eventArgs)
  custom_aftermath_timers_precast(spell)
end

function job_aftercast(spell, action, spellMap, eventArgs)
  custom_aftermath_timers_aftercast(spell)
end

-- Called when pet is about to perform an action
function job_pet_midcast(spell, action, spellMap, eventArgs)
  if petWeaponskills:contains(spell.english) then
    classes.CustomClass = "Weaponskill"
  end
end


-------------------------------------------------------------------------------------------------------------------
-- General hooks for other game events.
-------------------------------------------------------------------------------------------------------------------

-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
function job_buff_change(buff, gain)
  if buff == 'Wind Maneuver' then
    handle_equipping_gear(player.status)
  end
end

-- Called when a player gains or loses a pet.
-- pet == pet gained or lost
-- gain == true if the pet was gained, false if it was lost.
function job_pet_change(pet, gain)
  update_pet_mode()
end

-- Called when the pet's status changes.
function job_pet_status_change(newStatus, oldStatus)
  if newStatus == 'Engaged' then
    display_pet_status()
  end
end
if buffactive["reive mark"] then
        equip(sets.inwkr)
end

-------------------------------------------------------------------------------------------------------------------
-- User code that supplements self-commands.
-------------------------------------------------------------------------------------------------------------------

-- Called for custom player commands.
function job_self_command(cmdParams, eventArgs)
  if cmdParams[1] == 'maneuver' then
    if pet.isvalid then
      local man = defaultManeuvers[state.PetMode]
      if man and tonumber(cmdParams[2]) then
        man = man[tonumber(cmdParams[2])]
      end

      if man then
        send_command('input /pet "'..man..'" <me>')
      end
    else
      add_to_chat(123,'No valid pet.')
    end
  end
end


-- Called by the 'update' self-command, for common needs.
-- Set eventArgs.handled to true if we don't want automatic equipping of gear.
function job_update(cmdParams, eventArgs)
  update_pet_mode()
end


-- Set eventArgs.handled to true if we don't want the automatic display to be run.
function display_current_job_state(eventArgs)
  local defenseString = ''
  if state.Defense.Active then
    local defMode = state.Defense.PhysicalMode
    if state.Defense.Type == 'Magical' then
      defMode = state.Defense.MagicalMode
    end

    defenseString = 'Defense: '..state.Defense.Type..' '..defMode..', '
  end

  add_to_chat(122,'Melee: '..state.OffenseMode..'/'..state.DefenseMode..', WS: '..state.WeaponskillMode..', '..defenseString..
    'Kiting: '..on_off_names[state.Kiting])

  display_pet_status()

  eventArgs.handled = true
end


-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

-- Get the pet mode value based on the equipped head of the automaton.
-- Returns nil if pet is not valid.
function get_pet_mode()
  if pet.isvalid then
    return petModes[pet.head] or 'None'
  else
    return 'None'
  end
end

-- Update state.PetMode, as well as functions that use it for set determination.
function update_pet_mode()
  state.PetMode:set(get_pet_mode())
  update_custom_groups()
end

-- Update custom groups based on the current pet.
function update_custom_groups()
  classes.CustomIdleGroups:clear()
  if pet.isvalid then
    classes.CustomIdleGroups:append(state.PetMode.value)
  end
end

-- Display current pet status.
function display_pet_status()
  if pet.isvalid then
    local petInfoString = pet.name..' ['..pet.head..']: '..tostring(pet.status)..'  TP='..tostring(pet.tp)..'  HP%='..tostring(pet.hpp)

    if magicPetModes:contains(state.PetMode) then
      petInfoString = petInfoString..'  MP%='..tostring(pet.mpp)
    end

    add_to_chat(122,petInfoString)
  end
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
  -- Default macro set/book
  if player.sub_job == 'DNC' then
    set_macro_page(1, 13)
  elseif player.sub_job == 'NIN' then
    set_macro_page(1, 13)
  elseif player.sub_job == 'THF' then
    set_macro_page(1, 13)
  else
    set_macro_page(1, 13)
  end
end
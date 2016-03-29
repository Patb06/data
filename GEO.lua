-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------
 include('organizer-lib')
-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2
 
    -- Load and initialize the include file.
    include('Mote-Include.lua')
end
 
-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()
    indi_timer = ''
    indi_duration = 217
end
 
-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------
 
-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('None', 'Normal','Accuracy','Dual')
    state.CastingMode:options('Normal','Accuracy','Burst','AccuracyBurst')
    state.IdleMode:options('Normal', 'PDT', 'MDT')
     
    gear.default.obi_waist = "Porous Rope"
    gear.default.obi_back = "Toro Cape"
    gear.default.obi_ring = "Acumen	Ring"
    
end
 
 
-- Define sets and vars used by this job file.
function init_gear_sets()
 
    --------------------------------------
    -- Precast sets
    --------------------------------------
 
    -- Precast sets to enhance JAs
    sets.precast.JA.Bolster = {body="Bagua Tunic"}
    sets.precast.JA['Life cycle'] = {body="Geomancy Tunic",
    head="Azimuth Hood +1"
    }
    sets.precast.JA['Curative Recantation'] = {hands="Bagua Mitaines"}
    sets.precast.JA['Mending Halation'] = {legs="Bagua Pants"}
    sets.precast.JA['Radial Arcana'] = {feet="Bagua Sandals"}
    sets.precast.JA['Primal Zeal'] = {head="Bagua galero"}   
    sets.precast.JA['Cardinal Chant'] = {head="geomancy galero"}
 
 
    -- Fast cast sets for spells
 
    sets.precast.FC = {
    main="Marin Staff",
    sub="vivid strap",
    head="Nahtirah Hat",
    body="Vanir Cotehardie",
    hands="Helios Gloves",
    legs="Geo. Pants",
    feet="Regal Pumps +1",
    neck="Jeweled Collar",
    waist="Witful Belt",
    left_ear="Enchntr. Earring +1",
    right_ear="Loquac. Earring",
    left_ring="Prolix Ring",
    right_ring="lebeche Ring",
    back="Lifestream Cape",
}
 
    sets.precast.FC.Cure = set_combine(sets.precast.FC, {
    main="Vejovis Wand +1",
    sub="Genbu's Shield",
    body="Heka's Kalasiris",
	ear1="Nourishing Earring",
	ear2="Nourishing Earring +1",
    waist="Acerbic Sash +1",
	legs="Doyen Pants",
    back="Pahtli Cape",
})
 
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {
    head="Umuthi Hat",
    hands="Carapacho Cuffs",
	lets="Doyen Pants",
    waist="Siegel Sash",
})  
 
     
    sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {
    main="Ngqoqwanb",
    hands="Bagua Mitaines",
    neck="Stoicheion Medal",
})
 
    sets.precast.FC.Impact = set_combine(sets.precast.FC['Elemental Magic'], {head=empty,body="Twilight Cloak"})
     
     


 
    --------------------------------------
    -- Midcast sets
    --------------------------------------
 
    -- Base fast recast for spells
    sets.midcast.FastRecast =set_combine(sets.midcast.fastcast) 
 
sets.midcast.Regen = set_combine(sets.midcast.fastcast, {
    main="bolelabunga",
    body="Telchine Chas."})
     
    sets.midcast['Enhancing Magic']={
    main="Kirin's Pole",
    sub="Fulcio Grip",
    head="Umuthi Hat",
    hands="bagua mitaines",
    body={ name="Telchine Chas.", augments={'Mag. Acc.+12 "Mag.Atk.Bns."+12','"Conserve MP"+4','Enh. Mag. eff. dur. +4',}},
    legs="bagua Pants",
    feet="helios Boots",
    neck="Incanter's Torque",
    waist="Cascade Belt",
    left_ear="Andoaa Earring",
    right_ear="Magnetic Earring",
    back="Merciful Cape",
}
     
    sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {
    back="grapevine cape"})
 
    sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {
    waist="Emphatikos rope"})
 
    sets.midcast.Geomancy ={
    main="Venabulum",
    sub="Wizzan Grip",
    range="Dunna",
    head="Azimuth Hood +1",
	neck="Incanter's torque",
    body="Bagua Tunic",
    hands="Geo. Mitaines",
    legs="Azimuth Tights +1",
    feet="azimuth gaiters +1",
    waist="Austerity Belt",
    left_ear="magnetic Earring",
    right_ear="Gifted Earring",
    right_ring="Renaye Ring",
    back="Lifestream Cape",
}
     
    sets.midcast.Geomancy.Indi =set_combine(sets.midcast.Geomancy, {legs="bagua pants"})
 
 
    sets.midcast.Cure = {
    main="Tamaxchi",
    sub="Genbu's Shield",
    head="Geomancy galero +1",
    body="Heka's Kalasiris",
    hands="telchine Gloves",
    legs="Mes'yohi slacks",
    feet="Regal Pumps +1",
    neck="Incanter's Torque",
    waist="Hachirin-No-Obi",
    left_ear="Nourishing Earring",
    right_ear="Nourishing Earring +1",
    left_ring="Sirona's Ring",
    right_ring="",
    back=gear.ElementalCape,
}
         
        sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {
    neck="Stone Gorget",
    waist="siegel sash",
    right_ear="Earthcry Earring",
})  
             
    sets.midcast.Curaga = sets.midcast.Cure
 
    sets.midcast.Protectra = {ring1="Sheltered Ring"}
 
    sets.midcast.Shellra = {ring1="Sheltered Ring"}
 
        -- Custom Spell Classes
    sets.midcast['Enfeebling Magic'] = {
 	main="Grioavolr",
    sub="Mephitis Grip",
    ammo="Ghastly Tathlum",
    head="Befouled Crown",
    body={ name="Amalric Doublet", augments={'MP+60','Mag. Acc.+15','"Mag.Atk.Bns."+15',}},
    hands={ name="Helios Gloves", augments={'Mag. Acc.+18 "Mag.Atk.Bns."+18','MP+24',}},
    legs="Azimuth Tights +1",
    feet="Merlinic Crackows",
    neck="Incanter's torque",
    waist="Porous Rope",
    left_ear="Lifestorm Earring",
    right_ear="Psystorm Earring",
    left_ring="Perception Ring",
    right_ring="Sangoma Ring",
    back="Lifestream Cape"
}
 
    sets.midcast.IntEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {
     
})  
 
    sets.midcast.ElementalEnfeeble = sets.midcast['Enfeebling Magic']
 
    sets.midcast['Dark Magic'] = {
    main="Grioavolr",
    sub="Niobid Strap",
    ammo="Memoria sachet",
    head="Pixie hairpin +1",
    body="Geo. Tunic",
    hands="azimuth gloves",
    legs="Azimuth Tights +1",
    feet="Merlinic Crackows",
    neck="Incanter's torque",
    waist="Porous Rope",
	left_ear="Lifestorm Earring",
    right_ear="Psystorm Earring",
    left_ring="Archon Ring",
    right_ring="sangoma Ring",
    back="Merciful Cape",
}
         
        sets.midcast.Drain = set_combine(sets.midcast['Dark Magic'], {
    waist="Austerity Belt +1",
    left_ear="Abyssal Earring",
    right_ear="Hirudinea Earring",
    right_ring="Excelsis Ring",
})
     
    sets.midcast.Aspir = sets.midcast.Drain
     
 
 
    sets.midcast.Stun = sets.precast.FC
             
 
            sets.midcast.Bolster = {body="Bagua Tunic"}
        sets.midcast['Life Cycle'] = {body="Geo. Tunic",
    head="Azimuth Hood +1"}
        sets.midcast['Mending Halation'] = {legs="Bagua Pants"}
        sets.midcast['Radial Arcana'] = {feet="Bagua Sandals"}
        sets.midcast.Bolster.Pet = {body="Bagua Tunic"}
        sets.midcast['Life Cycle'].Pet = {body="Geo. Tunic",
    head="Azimuth Hood +1"}
        sets.midcast['Mending Halation'].Pet = {legs="Bagua Pants"}        sets.midcast.Bolster.Pet.Indi = {body="Bagua Tunic"}
        sets.midcast['Life Cycle'].Pet.Indi = {body="Geo. Tunic",
    head="Azimuth Hood +1"}
        sets.midcast['Mending Halation'].Pet.Indi = {legs="Bagua Pants"}
 
          -- Elemental Magic sets
     
    sets.midcast['Elemental Magic']= {
    main="Grioavolr",
    sub="Niobid Strap",
    ammo="ghastly tathlum",
    head="Merlinic Hood",
    body={ name="Amalric Doublet", augments={'MP+60','Mag. Acc.+15','"Mag.Atk.Bns."+15',}},
    hands="Amalric Gages",
    legs="Gyve Trousers",
    feet="Merlinic Crackows",
    neck="Eddy Necklace",
    waist=gear.ElementalObi,
    left_ear="Friomisi Earring",
    right_ear="Hecate's Earring",
    left_ring="shiva Ring",
    right_ring="Acumen Ring",
    back="Toro Cape",
}

    sets.midcast['Elemental Magic']['Accuracy']=set_combine(sets.midcast['Elemental Magic'], {
	main="Grioavolr",
    sub="Niobid Strap",
    ammo="Ghastly Tathlum",
    head="Befouled Crown",
    body={ name="Amalric Doublet", augments={'MP+60','Mag. Acc.+15','"Mag.Atk.Bns."+15',}},
    hands="Amalric Gages",
    legs="Azimuth Tights +1",
    feet="Tutyr Sabots",
    neck="Incanter's Torque",
    waist=gear.ElementalObi,
    left_ear="Lifestorm Earring",
    right_ear="Psystorm Earring",
    left_ring="Perception Ring",
    right_ring="Sangoma Ring",
    back="Ogapepo Cape"
})
       sets.midcast.Impact = {
    main="Marin Staff",
    sub="Elder's Grip +1",
    ammo="Memoria sachet",
    head=empty,
    body="Twilight Cloak",
    hands="azimuth gloves",
    legs="Azimuth Tights +1",
    feet="Helios Boots",
    neck="Eddy Necklace",
    waist=gear.ElementalObi,
    left_ear="Gwati Earring",
    right_ear="Crematio Earring",
    left_ring="Shiva Ring",
    right_ring="Shiva Ring",
    back="Toro Cape",
}   
     
	 sets.midcast['Elemental Magic'].Burst = {
	main="Grioavolr",
    sub="Niobid Strap",
    ammo="ghastly tathlum",
    head="Merlinic Hood",
    body={ name="Amalric Doublet", augments={'MP+60','Mag. Acc.+15','"Mag.Atk.Bns."+15',}},
    hands="Amalric Gages",
    legs="Gyve Trousers",
    feet="Merlinic Crackows",
    neck="Mizukage-no-kubikazari",
    waist=gear.ElementalObi,
    left_ear="Friomisi Earring",
    right_ear="Hecate's Earring",
    left_ring="Mujin Band", 
	ring2="Locus Ring",
    back="Seshaw cape",
	 }
	 
	 sets.midcast['Elemental Magic'].AccuracyBurst=set_combine(sets.midcast['Elemental Magic']['Accuracy'], {
	main="Grioavolr",
    sub="Niobid Strap",
    ammo="Ghastly Tathlum",
    head="Merlinic Hood",
    body={ name="Amalric Doublet", augments={'MP+60','Mag. Acc.+15','"Mag.Atk.Bns."+15',}},
    hands="Amalric Gages",
    legs="Azimuth Tights +1",
    feet="Merlinic Crackows",
    neck="Mizukage-no-kubikazari",
    waist=gear.ElementalObi,
    left_ear="Lifestorm Earring",
    right_ear="Psystorm Earring",
    back="Seshaw Cape",
	left_ring="Mujin Band", 
	ring2="Locus Ring"
	 })
    --------------------------------------
    -- Idle/resting/defense/etc sets
    --------------------------------------
 
    -- Resting sets
    sets.resting = {
    range="Dunna",
	head="Befouled Crown",
    body="Witching Robe",
    hands="Bagua Mitaines",
    legs="Assiduity pants +1",
    feet="Geomancy Sandals",
    neck="Twilight Torque",
    waist="Porous Rope",
    left_ear="Merman's Earring",
    right_ear="Merman's Earring",
    left_ring="Defending Ring",
    right_ring="Dark Ring",
    back="Mecistopins Mantle",
}
 
 
    -- Idle sets
 
    sets.idle = sets.resting
 
    sets.idle.PDT = {
    main="Earth Staff",
        head="Hagondes Hat",
        neck="Twilight Torque",
        ear1="Handler's Earring",
        ear2="Handler's Earring +1",
        body="Hagondes Coat +1",
        hands="hagondes cuffs",
        ring1="Defending Ring",
        ring2="dark Ring",
        back="Cheviot cape",
        waist="Isa Belt",
        legs="hagondes Pants +1",
        feet="Azimuth Gaiters +1"}
         
        sets.idle.MDT = set_combine(sets.idle.PDT, {
    main="marine staff +1",
    sub="vallus grip",})    
 
    -- .Pet sets are for when Luopan is present.
    sets.idle.Pet = set_combine(sets.resting, {
    head="Azimuth Hood +1",
    body={ name="Telchine Chas.", augments={'Pet: Accuracy+18 Pet: Rng. Acc.+18','Pet: "Regen"+2',}},
    legs="helios spats",
    hands="Geomancy Mitaines",
    feet="Bagua Sandals",
    waist="Isa Belt",
    back="Mecistopins Mantle",
    ear1="Handler's Earring +1",
	ear2="Handler's Earring",
})
 
    sets.idle.PDT.Pet = set_combine(sets.idle.PDT, {main="Earth Staff",
    sub="Genbu's Shield",
    head="Azimuth Hood +1",
    body={ name="Telchine Chas.", augments={'Pet: Accuracy+18 Pet: Rng. Acc.+18','Pet: "Regen"+2',}},
      hands={ name="Helios Gloves", augments={'Pet: Accuracy+19 Pet: Rng. Acc.+19','Pet: "Regen"+3',}},
    legs="helios spats",
    feet="Bagua Sandals",
    waist="Isa Belt",
    back="Lifestream Cape",
    ear1="Handler's Earring +1",
	ear2="Handler's Earring"
})
 
    sets.idle.MDT.Pet = set_combine(sets.idle.MDT, {main="Earth Staff",
    sub="Genbu's Shield",
    head="Azimuth Hood +1",
    body={ name="Telchine Chas.", augments={'Pet: Accuracy+18 Pet: Rng. Acc.+18','Pet: "Regen"+2',}},
      hands={ name="Helios Gloves", augments={'Pet: Accuracy+19 Pet: Rng. Acc.+19','Pet: "Regen"+3',}},
    legs="helios spats",
    feet="Bagua Sandals",
    waist="Isa Belt",
    back="Lifestream Cape",
    ear1="Handler's Earring +1",
})
 
    -- .Indi sets are for when an Indi-spell is active.
    sets.idle.Indi = sets.resting
     
    sets.idle.PDT.Indi = sets.idle.PDT
     
    sets.idle.MDT.Indi = sets.idle.MDT
      
    sets.idle.PDT.Pet.Indi = sets.idle.PDT.Pet
     
    sets.idle.MDT.Pet.Indi = sets.idle.MDT.Pet
 
    sets.idle.Town = {
    main="Bolelabunga",
    sub="Genbu's Shield",
    range="Dunna",
    head="Azimuth Hood +1",
    body="Azimuth Coat",
    hands="Azimuth Gloves",
    legs="Azimuth Tights +1",
    feet="Geomancy Sandals",
    neck="Twilight Torque",
    waist="Fucho-no-Obi",
    left_ear="Merman's Earring",
    right_ear="Merman's Earring",
    left_ring="Sheltered Ring",
    right_ring="Renaye Ring",
    back="Mecistopins Mantle",
}
 
    sets.idle.Weak = sets.resting
 
    -- Defense sets
 
    sets.defense.PDT = sets.idle.PDT
 
    sets.defense.MDT = sets.idle.MDT
 
    sets.Kiting = {feet="Geo. Sandals"}
 
    sets.latent_refresh = {waist="Fucho-no-obi"}
     
end
 
-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------
function job_aftercast(spell, action, spellMap, eventArgs)
    if not spell.interrupted then
        if spell.english:startswith('Indi') then
            if not classes.CustomIdleGroups:contains('Indi') then
                classes.CustomIdleGroups:append('Indi')
            end
            send_command('@timers d "'..indi_timer..'"')
            indi_timer = spell.english
            send_command('@timers c "'..indi_timer..'" '..indi_duration..' down spells/00136.png')
        elseif spell.english == 'Sleep' or spell.english == 'Sleepga' then
            send_command('@timers c "'..spell.english..' ['..spell.target.name..']" 60 down spells/00220.png')
        elseif spell.english == 'Sleep II' or spell.english == 'Sleepga II' then
            send_command('@timers c "'..spell.english..' ['..spell.target.name..']" 90 down spells/00220.png')
        end
    elseif not player.indi then
        classes.CustomIdleGroups:clear()
    end
end
-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------
 
-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
function job_buff_change(buff, gain)
    if player.indi and not classes.CustomIdleGroups:contains('Indi')then
        classes.CustomIdleGroups:append('Indi')
        handle_equipping_gear(player.status)
    elseif classes.CustomIdleGroups:contains('Indi') and not player.indi then
        classes.CustomIdleGroups:clear()
        handle_equipping_gear(player.status)
    end
end
 
function job_state_change(stateField, newValue, oldValue)
    if stateField == 'Offense Mode' then
        if newValue == 'Dual' then
            disable('main','sub','range')
        else
            enable('main','sub','range')
        end
    end
end
 
-- Run after the general midcast() is done.
function job_post_midcast(spell, action, spellMap, eventArgs)
    if spell.skill == 'Elemental Magic' then
        if spell.element == world.day_element or spell.element == world.weather_element then
            equip(sets.midcast['Elemental Magic'], {waist="Hachirin-No-Obi"})
        end
    end     	
end
	
function job_post_midcast(spell, action, spellMap, eventArgs)
    if stateField == 'Casting Mode' then
		if newValue == 'Burst' then
			if spell.skill == 'Elemental Magic' then
				equip(sets.midcast['Elemental Magic'].Burst)
			end
		end	
    end
end

function job_post_midcast(spell, action, spellMap, eventArgs)
    if stateField == 'Casting Mode' then
		if newValue == 'AccuracyBurst' then
			if spell.skill == 'Elemental Magic' then
				equip(sets.midcast['Elemental Magic'].AccuracyBurst)
			end
		end	
    end
end
-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------
 
function job_get_spell_map(spell, default_spell_map)
    if spell.action_type == 'Magic' then
        if spell.skill == 'Enfeebling Magic' then
            if spell.type == 'WhiteMagic' then
                return 'MndEnfeebles'
            else
                return 'IntEnfeebles'
            end
        elseif spell.skill == 'Geomancy' then
            if spell.english:startswith('Indi') then
                return 'Indi'
            end
            elseif spell.skill == 'Elemental Magic' then
        end
    end
end
 
function customize_idle_set(idleSet)
    if player.mpp < 51 then
        idleSet = set_combine(idleSet, sets.latent_refresh)
    end
    return idleSet
end
 
-- Called by the 'update' self-command.
function job_update(cmdParams, eventArgs)
    classes.CustomIdleGroups:clear()
    if player.indi then
        classes.CustomIdleGroups:append('Indi')
    end
end
 
-- Function to display the current relevant user state when doing an update.
function display_current_job_state(eventArgs)
    display_current_caster_state()
    eventArgs.handled = true
end
 
-- MAKE A MACRO : /tell <me> check
function open_coffer()
    CofferType = "Velkk Coffer"
    if player.inventory[CofferType] then
    NCoffer = player.inventory[CofferType].count
    bag = windower.ffxi.get_bag_info(0).count
    max = windower.ffxi.get_bag_info(0).max
    spots = max-bag
    if spots > 0 then
    add_to_chat(204, '*-*-*-*-*-*-*-*-* [ '..NCoffer..'x '..CofferType..' to open - Inventory('..bag..'/'..max..') ] *-*-*-*-*-*-*-*-*')
    local nextcommand = ""
    for i=1, spots do
        nextcommand = nextcommand .. 'input /item "'..CofferType..'" <me>; wait 2;'
    end
    nextcommand = nextcommand .. 'input /tell '..player.name..' check'
    send_command(nextcommand)
    else
        add_to_chat(204, '*-*-*-*-*-*-*-*-* [ Inventory('..bag..'/'..max..') ] *-*-*-*-*-*-*-*-*')
    end
    else
        add_to_chat(204, '*-*-*-*-*-*-*-*-* [ No '..CofferType..' in inventory ] *-*-*-*-*-*-*-*-*')
    end
end
 
 
windower.register_event('chat message', function(original, sender, mode, gm)
    local match
 
                if sender == player.name then
                    if original == "check" then
                        open_coffer()
                    end
                end
 
    return sender, mode, gm
end)
 
-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------
 
-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    set_macro_page(1, 1)
end
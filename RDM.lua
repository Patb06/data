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
    state.Buff.Saboteur = buffactive.saboteur or false
end
 
-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------
 
-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('None', 'Normal')
    state.HybridMode:options('Normal', 'PhysicalDef', 'MagicalDef')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal', 'PDT', 'MDT')
 
    gear.default.obi_waist = "Sekhmet Corset"
 
    select_default_macro_book()
end
 
-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------
 
    -- Precast Sets
    -- Precast sets to enhance JAs
    sets.precast.JA['Chainspell'] = {body="Vitivation Tabard +1"}
 
    -- Waltz set (chr and vit)
    sets.precast.Waltz = {
        head="Hagondes hat",
        body="Gendewitha Bliaut",hands="Helios Gloves",
        back="Refraction Cape",legs="Orvail Pants +1",feet="Uk'uxkaj boots"}
 
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}
 
    -- Fast cast sets for spells
 
    -- 80% Fast Cast (including trait) for all spells, plus 5% quick cast
    -- No other FC sets necessary.
    sets.precast.FC = {main="Emissary",sub="Genbu's Shield",ammo="Impatiens",
        head="Warlock's Chapeau",neck="Orunmila's torque",ear1="Estoqueur's earring",ear2="Loquacious earring",
        body="Duelist's Tabard",hands="Gendewitha gages +1",ring1="Perception Ring",ring2="Sangoma Ring",
        back="Ogapepo cape",waist="Witful belt",legs="Orvail Pants +1",feet="Tutyr Sabots"}
 
    sets.precast.FC.Impact = set_combine(sets.precast.FC, {head=empty,body="Twilight Cloak"})
 
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {ammo="Paeapua",
        head="Taeon chapeau",neck="Fotia gorget",ear1="Bladeborn earring",ear2="Steelflash Earring",
        body="Taeon tabard",hands="Leyline Gloves",ring1="Rajas Ring",ring2="K'ayres Ring",
        back="Bleating Mantle",waist="Fotia belt",legs="Taeon tights",feet="Atrophy Boots +1"}
 
    sets.precast.WS['Sanguine Blade'] = set_combine(sets.precast.WS, {ammo="Memoria sachet",
        head="Helios band",neck="Eddy Necklace",ear1="Friomisi Earring",ear2="Sortiarius Earring",
        body="Hagondes coat",hands="Helios gloves",ring1="Fenrir Ring +1",ring2="Acumen Ring",
        back="Toro Cape",waist="Othila sash",legs="Hagondes pants",feet="Merlinic Crackows"})
 
    sets.precast.WS['Requiescat'] = set_combine(sets.precast.WS, {ammo="Oreiad's tathlum",
        head="Atrophy chapeau +1",neck="Tlamiztli collar",ear1="Lifestorm Earring",ear2="Bladeborn Earring",
        body="Vitivation tabard +1",hands="Atrophy gloves +1",ring1="Rajas Ring",ring2="Perception Ring",
        back="Buquwik Cape",waist="Prosilo belt +1",legs="Psycloth lappas",feet="Artsieq boots"})     
 
    sets.precast.WS['Aeolian Edge'] = set_combine(sets.precast.WS, {ammo="Memoria sachet",
        head="Helios band",neck="Eddy Necklace",ear1="Friomisi Earring",ear2="Hecate's Earring",
        body="Hagondes coat",hands="Helios gloves",ring1="Fenrir Ring +1",ring2="Acumen Ring",
        back="Toro Cape",waist="Othila sash",legs="Hagondes pants",feet="Merlinic Crackows"})
 
    sets.precast.WS['Savage Blade'] = set_combine(sets.precast.WS, {ammo="Yetshila",
        head="Atrophy Chapeau +1",neck="Fotia gorget",ear1="Brutal Earring",ear2="Moonshade Earring",
        body="Taeon Tabard",hands="Lethargy Gantherotes",ring1="Rajas ring",ring2="Karieyh Ring",
        back="Buquwik cape",waist="Fotia belt",legs="Psycloth lappas",feet="Lethargy houseaux +1"})
 
    sets.precast.WS['Chant du Cygne'] = set_combine(sets.precast.WS, {ammo="Ginsen",
        head="Taeon chapeau",neck="Fotia Gorget",ear1="Steelflash Earring",ear2="Bladeborn Earring",
        body="Taeon Tabard",hands="Leyline gloves",ring1="Rajas ring",ring2="Jupiter's Ring",
        back="Kayapa cape",waist="Fotia Belt",legs="Taeon tights",feet="Taeon boots"})
 
    sets.precast.WS['Evisceration'] = set_combine(sets.precast.WS, {ammo="Yetshila",
        head="Taeon chapeau",neck="Fotia Gorget",ear1="Brutal Earring",ear2="Moonshade Earring",
        body="Taeon Tabard",hands="Taeon gloves",ring1="Rajas ring",ring2="Jupiter's Ring",
        back="Kayapa cape",waist="Fotia Belt",legs="Taeon tights",feet="Taeon boots"})
         
    sets.precast.WS['Death Blossom'] = set_combine(sets.precast.WS, {ammo="Yetshila",
        head="Atrophy Chapeau +1",neck="Fotia gorget",ear1="Brutal Earring",ear2="Moonshade Earring",
        body="Taeon tabard",hands="Lethargy Gantherotes +1",ring1="Rajas ring",ring2="Karieyh Ring",
        back="Buquwik cape",waist="Fotia belt",legs="Psycloth lappas",feet="Lethargy houseaux +1"})
 
    -- Midcast Sets
 
    sets.midcast.Cure = {main="Tamaxchi",sub="Sors shield",ammo="Esper Stone +1",
        head="Gendewitha Caubeen",neck="Incanter's Torque",ear1="Lifestorm Earring",ear2="Psystorm Earring",
        body="Vitivation tabard +1",hands="Lethargy gantherots +1",ring1="Ephedra Ring",ring2="Haoma's Ring",
        back="Vates cape +1",waist="Porous Rope",legs="Doyen Pants",feet="Vanya clogs"}
 
    sets.midcast.Curaga = sets.midcast.Cure
    sets.midcast.CureSelf = {ring1="Kunaji Ring",ring2="Asklepian Ring",hands="Buremte Gloves",waist="Gishdubar Sash"}
 
    sets.midcast['Enhancing Magic'] = {main="Egeking",sub="Pukulatmuj",
        head="Umuthi Hat",neck="Incanter's Torque",ear1="Andoaa earring",ear2="Augmenting earring",
        body="Vitivation tabard +1",hands="Atrophy gloves +1",ring1="Perception ring",
        back="Ghostfyre cape",waist="Olympus Sash",legs="Atrophy tights +1",feet="Lethargy Houseaux +1"}
 
    sets.midcast['Enhancing Magic'].EnSpells = set_combine(sets.midcast['Enhancing Magic'],{ear2="Hollow Earring",hands="Vitivation Gloves",back="Ghostfyre Cape"})
 
    sets.midcast['Enhancing Magic'].GainSpells = set_combine(sets.midcast['Enhancing Magic'],{hands="Vitivation Gloves"})
 
    sets.midcast.EnhancingDuration = {head="Telchine Cap",body="Telchine Chasuble",feet="Estoqueur's Houseaux +1",back="Estoqueur's Cape",}
 
    sets.buff.ComposureOther = {head="Lethargy Chappel",body="Lethargy Sayon +1",legs="Lethargy Fuseau +1",feet="Lethargy Houseaux +1"}
 
    sets.midcast.Protect = {ring2="Sheltered Ring"}
    sets.midcast.Shell = sets.midcast.Protect
 
    sets.midcast.Phalanx = set_combine(sets.midcast['Enhancing Magic'],{main="Egeking"})
 
    sets.midcast.Cursna = {neck="Malison medallion",back="Oretania's cape +1",ring1="Haoma's ring",ring2="ephedra ring",feet="Vanya clogs"}
 
    sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'],{neck="Stone gorget",ear2="Earthcry earring",hands="Stone mufflers",waist="Siegel Sash",legs="Haven hose"})
 
    sets.midcast['Enfeebling Magic'] = {main="Grioavolr",sub="Mephitis grip",range="Aureole",
        head="Vitivation Chapeau +1",neck="Incanter's torque",ear1="Lifestorm Earring",ear2="Psystorm Earring",
        body="Amalric Doublet",hands="Amalric gages",ring1="Perception Ring",ring2="Sangoma Ring",
        back="Ogapepo Cape",waist="Porous Rope",legs="Psycloth lappas",feet="Artsieq boots"}
 
    sets.midcast.Distract = {main="Grioavolr",sub="Mephitis grip",range="Aureole",
        head="Vitivation Chapeau +1",neck="Incanter's torque",ear1="Lifestorm Earring",ear2="Psystorm Earring",
        body="Amalric Doublet",hands="Amalric gages",ring1="Perception Ring",ring2="Sangoma Ring",
        back="Ogapepo Cape",waist="Porous Rope",legs="Psycloth lappas",feet="Artsieq boots"}
 
    sets.midcast.Frazzle = {main="Grioavolr",sub="Mephitis grip",range="Aureole",
        head="Vitivation Chapeau +1",neck="Incanter's torque",ear1="Lifestorm Earring",ear2="Psystorm Earring",
        body="Amalric Doublet",hands="Amalric gages",ring1="Perception Ring",ring2="Sangoma Ring",
        back="Ogapepo Cape",waist="Porous Rope",legs="Psycloth lappas",feet="Artsieq boots"}
 
    sets.midcast['Dia III'] = set_combine(sets.midcast['Enfeebling Magic'], {head="Vitivation Chapeau"})
 
    sets.midcast['Slow II'] = set_combine(sets.midcast['Enfeebling Magic'], {head="Vitivation Chapeau"})
 
    sets.midcast['Elemental Magic'] = {main="Grioavolr",sub="Niobid Strap",ammo="Memoria sachet",
        head="Merlinic Hood",neck="Mizukage-no-kubikazari",ear1="Friomisi Earring",ear2="Hecate's Earring",
        body="Amalric Doublet",hands="Amalric gages",ring1="Fenrir Ring +",ring2="Acumen Ring",
        back="Toro Cape",waist="Hachirin-no-Obi",legs="Hagondes pants",feet="Merlinic Crackows"}
 
    sets.midcast.Impact = set_combine(sets.midcast['Elemental Magic'], {head=empty,body="Twilight Cloak"})
 
    sets.midcast.Drain = {main="Grioavolr",sub="Niobid Strap",ranged="Aureole",
        head="Merlinic Hood",neck="Incanter's torque",ear1="Lifestorm earring",ear2="Psystorm Earring",
        body="Amalric Doublet",hands="Amalric gages",ring1="Perception Ring",ring2="Sangoma Ring",
        back="Ogapepo Cape",waist="Porous Rope",legs="Lethargy fuseau +1",feet="Merlinic Crackows"}
 
    sets.midcast.Aspir = {main="Grioavolr",sub="Niobid Strap",ranged="Aureole",
        head="Merlinic Hood",neck="Incanter's torque",ear1="Lifestorm earring",ear2="Psystorm Earring",
        body="Amalric Doublet",hands="Amalric gages",ring1="Perception Ring",ring2="Sangoma Ring",
        back="Ogapepo Cape",waist="Porous Rope",legs="Lethargy fuseau +1",feet="Merlinic Crackows"}
 
    sets.midcast['Stun'] = {main="Grioavolr",sub="Niobid Strap",ammo="Impatiens",
        head="Merlinic Hood",neck="Incanter's Torque",ear1="Estoqueur's earring",ear2="Gwati earring",
        body="Amalric Doublet",hands="Gendewitha gages",ring1="Perception Ring",ring2="Sangoma Ring",
        back="Ogapepo cape",waist="Pya'ekue belt",legs="Psycloth lappas",feet="Merlinic Crackows"}
 
    sets.midcast.Drain = set_combine(sets.midcast['Dark Magic'], {ring1="Excelsis Ring", waist="Fucho-no-Obi"})
 
    sets.midcast.Aspir = sets.midcast.Drain
 
    -- Sets to return to when not performing an action.
 
    -- Resting sets
    sets.resting = {main="Bolelabunga",sub="Genbu shield",ammo="Impatiens",
        head="Vitivation Chapeau +1",neck="Wiglen Gorget",
        body="Atrophy Tabard",hands="Serpentes Cuffs",ring1="Paguroidea Ring",ring2="Sheltered Ring",
        back="Kumbira cape",waist="Witful Belt",back="Shadow Mantle",legs="Nares trews",feet="Serpentes Sabots"}
 
    -- Idle sets
    sets.idle = {main="Emissary",sub="Genbu shield",ammo="Impatiens",
        head="Vitivation Chapeau +1",neck="Wiglen Gorget",ear1="Estoqueur's Earring",ear2="Infused Earring",
        body="Lethargy sayon +1",hands="Serpentes Cuffs",ring1="Paguroidea Ring",ring2="Sheltered Ring",
        back="Kumbira cape",waist="Flume Belt",legs="Crimson Cuisses",feet="Serpentes Sabots"}
 
    sets.idle.Town = {main="Emissary",sub="Genbu shield",ammo="Impatiens",
        head="Vitivation Chapeau +1",neck="Wiglen Gorget",ear1="Estoqueur's Earring",ear2="Infused Earring",
        body="Lethargy sayon +1",hands="Serpentes Cuffs",ring1="Paguroidea Ring",ring2="Sheltered Ring",
        back="Kumbira cape",waist="Flume Belt",legs="Crimson Cuisses",feet="Serpentes Sabots"}
 
    sets.idle.Weak = {main="Emissary",sub="Genbu shield",ammo="Impatiens",
        head="Vitivation Chapeau +1",neck="Wiglen Gorget",ear1="Estoqueur's Earring",ear2="Infused Earring",
        body="Lethargy sayon +1",hands="Serpentes Cuffs",ring1="Paguroidea Ring",ring2="Sheltered Ring",
        back="Kumbira cape",waist="Flume Belt",legs="Nares trews",feet="Serpentes Sabots"}
 
    -- Defense sets
    sets.defense.PDT = {main="Emissary",sub="Genbu shield",range="Phulax bow",
        head="Gendewitha caubeen",neck="Wiglen Gorget",ear1="Merman's earring",ear2="Merman's earring",
        body="Emet harness +1",hands="Buremte gloves",ring1="Paguroidea Ring",ring2="Yacuruna Ring",
        back="Umbra cape",waist="Pya'ekue belt",legs="Hagondes pants",feet="Gendewitha galoshes"}
 
    sets.defense.MDT = {main="Emissary",sub="Genbu shield",ammo="Memoria sachet",
        head="Gendewitha caubeen",neck="Twilight torque",ear1="Merman's earring",ear2="Merman's earring",
        body="Hagondes coat",hands="Buremte gloves",ring1="Paguroidea Ring",ring2="Yacuruna Ring",
        back="Umbra cape",waist="Pya'ekue belt",legs="Hagondes pants",feet="Gendewitha galoshes"}
 
    sets.Kiting = {legs="Carmine Cuisses"}
 
    sets.latent_refresh = {waist="Fucho-no-obi"}
 
    -- Engaged sets
 
    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
 
    -- Normal melee group
    sets.engaged = {main="Emissary",sub="Emissary",ammo="Ginsen",
        head="Taeon chapeau",neck="Asperity Necklace",ear1="Steelflash earring",ear2="Bladeborn Earring",
        body="Emet Harness +1",hands="Leyline Gloves",ring1="Rajas Ring",ring2="K'ayres Ring",
        back="Atheling Mantle",waist="windbuffet belt",legs="Taeon tights",feet="Taeon boots"}
 
    -- Sets for special buff conditions on spells.
 
    sets.buff.Saboteur = {hands="Lethargy Gantherots +1"}
end
  
-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------
  
-- Run after the default midcast() is done.
-- eventArgs is the same one used in job_midcast, in case information needs to be persisted.
function job_post_midcast(spell, action, spellMap, eventArgs)
    if spell.skill == 'Enfeebling Magic' and state.Buff.Saboteur then
        equip(sets.buff.Saboteur)
    elseif spell.skill == 'Enhancing Magic' then
        equip(sets.midcast.EnhancingDuration)
        if buffactive.composure and spell.target.type == 'PLAYER' then
            equip(sets.buff.ComposureOther)
        end
    elseif spellMap == 'Cure' and spell.target.type == 'SELF' then
        equip(sets.midcast.CureSelf)
    end
end
 
function job_get_spell_map(spell, default_spell_map)
    if spell.action_type == 'Magic' then
        if spell.skill == 'Enhancing Magic' then
            if spell.english:startswith('En') then
                return 'EnSpells'
            elseif spell.english:startswith('Gain') then
                return 'GainSpells'
            end
        elseif spellMap == 'Cure' and spell.target.type == 'SELF' then
            equip(sets.midcast.CureSelf)
        end
    end
end
  
-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------
  
-- Handle notifications of general user state change.
function job_state_change(stateField, newValue, oldValue)
    if stateField == 'Offense Mode' then
        if newValue == 'None' then
            enable('main','sub','range')
        else
            disable('main','sub','range')
        end
    end
end
  
-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------
  
-- Modify the default idle set after it was constructed.
function customize_idle_set(idleSet)
    if player.mpp < 51 then
        idleSet = set_combine(idleSet, sets.latent_refresh)
    end
      
    return idleSet
end
  
-- Set eventArgs.handled to true if we don't want the automatic display to be run.
function display_current_job_state(eventArgs)
    display_current_caster_state()
    eventArgs.handled = true
end
  
-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------
  
-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'DNC' then
        set_macro_page(2, 4)
    elseif player.sub_job == 'NIN' then
        set_macro_page(3, 4)
    elseif player.sub_job == 'THF' then
        set_macro_page(4, 4)
    else
        set_macro_page(1, 4)
    end
end
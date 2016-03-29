-- Define sets and vars used by this job file.
function init_gear_sets()
	--------------------------------------
	-- Start defining the sets
	--------------------------------------

	-- Precast Sets

	-- Precast sets to enhance JAs

	sets.precast.JA['Tabula Rasa'] = {legs="Pedagogy Pants"}
	sets.precast.JA['Dark Arts'] = {"Academic's Gown +1"}
	sets.precast.JA['Light Arts'] = {"Academic's Pants +1"}
	
	organizer_items = {agown="Academic's Gown +1",
	    zod="Zodiac Ring"}


	-- Fast cast sets for spells

	sets.precast.FC = {main="Keraunos",ammo="Incantor stone",
		head="Nahtirah Hat",
        ear1="Loquac. earring",
        hands="Gendewitha gages",ring1="Prolix ring",
        back="Swith cape",waist="Witful belt",legs="Orvail pants +1",feet="Argute loafers +2"}

	sets.precast.FC.Cure = set_combine(sets.precast.FC, {ammo="Incantor Stone",
										 head="Nahtirah Hat",
                                         ear1="Loquac. earring",
                                         body="Nefer kalasiris",hands="Gendewitha gages",ring1="Prolix ring",
                                         back="Pahtli cape",waist="Witful belt",legs="Orvail pants +1",feet="Argute loafers +2"})

	sets.precast.FC.Curaga = sets.precast.FC.Cure
	
	sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})

	sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {neck="Stoicheion Medal",ear1="Barkarole Earring"})

	sets.precast.FC.Impact = set_combine(sets.precast.FC['Elemental Magic'], {head=empty,body="Twilight Cloak"})
	
	-- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {}

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Myrkr'] = {ammo="Ghastly Tathlum +1",
	    head="Kaabnax Hat",neck="Sanctity Necklace",ear1="Moonshade Earring",ear2="Loquacious Earring",
		body="Amalric Doublet",hands="Otomi Gloves",ring1="Sangoma Ring",ring2="Bifrost Ring",
		back="Pahtli Cape",waist="Fucho-no-obi",legs="Psycloth Lappas",feet="Medium's Sabots"}


	-- Midcast Sets

	sets.midcast.FastRecast = {ammo="Incantor Stone",ring2="Prolix Ring",back="Swith Cape +1"}

	-- Cure Sets
	
	sets.midcast.Cure = {main="Serenity",sub="Curatio Grip",ammo="Hydrocera",
		head="Vanya Hood",neck="Henic Torque",ear1="Lifestorm Earring",ear2="Loquacious Earring",
		body="Vanya Robe",hands="Pedagogy Bracers +1",ring1="Haoma's Ring",ring2="Sirona's Ring",
		back="Tempered Cape +1",waist="Bishop's Sash",legs="Academic's Pants +1",feet="Vanya Clogs"}

	sets.midcast.CureWithLightWeather = set_combine(sets.midcast.Cure, {
		main="Chatoyant Staff",body="Gendewitha Bliaut +1",hands="Telchine Gloves",back="Twilight Cape",waist="Korin Obi"})

	sets.midcast.Curaga = sets.midcast.Cure

	sets.midcast.Regen = {main="Bolelabunga",sub="Genbu's Shield",ammo="Savant's Treatise",
	    head="Arbatel Bonnet +1",neck="Colossus's Torque",ear1="Andoaa Earring",
		body="Peda. Gown +1",hands="Telchine Gloves",
		back="Bookworm's Cape",waist="Cascade Belt",legs="Acad. Pants +1",feet="Telchine Pigaches"}
	
	-- Enhancing Magic Sets
	
	sets.midcast['Enhancing Magic'] = {main="Chatoyant Staff",sub="Arbuda Grip",ammo="Savant's Treatise",
		head="Befouled Crown",neck="Colossus's Torque",ear1="Andoaa Earring",
		body="Peda. Gown +1",waist="Cascade Belt",legs="Acad. Pants +1",feet="Regal Pumps +1"}

	sets.midcast.Cursna = {
		neck="Malison Medallion",ring1="Haoma's Ring",ring2="Ephedra Ring",feet="Gendewitha Galoshes +1"}

	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {head="Umuthi Hat",neck="Nodens Gorget",
	    ear1="Earthcry Earring",waist="Siegel Sash",legs="Haven Hose"})

	sets.midcast.Storm = {main="Chatoyant Staff",sub="Arbuda Grip",ammo="Savant's Treatise",
		head="Arbatel Bonnet +1",neck="Colossus's Torque",ear1="Andoaa Earring",
		body="Peda. Gown +1",waist="Cascade Belt",legs="Acad. Pants +1",feet="Regal Pumps +1"}

	sets.midcast.Protect = {ring1="Sheltered Ring"}
	sets.midcast.Protectra = sets.midcast.Protect
	sets.midcast.Shell = {ring1="Sheltered Ring"}
	sets.midcast.Shellra = sets.midcast.Shell
	sets.midcast.Haste = sets.midcast.FastRecast
	sets.midcast.Erase = sets.midcast.FastRecast


	-- Custom spell classes
	sets.midcast.MndEnfeebles = {main="Akademos",sub="Mephitis Grip",ammo="Hydrocera",
		head="Befouled Crown",neck="Imbodla Necklace",ear1="Barkarole Earring",ear2="Gwati Earring",
		body="Vanya Robe",hands="Lurid Mitts",ring1="Vertigo Ring",ring2="Globidonta Ring",
		back="Refraction Cape",waist="Tengu-no-Obi",legs="Chironic Hose",feet="Medium's Sabots"}

	sets.midcast.IntEnfeebles = sets.midcast.MndEnfeebles

	sets.midcast.ElementalEnfeeble = sets.midcast.IntEnfeebles
	
	sets.midcast.Kaustra = sets.midcast['Elemental Magic']

	sets.midcast['Dark Magic'] = {main="Rubicundity",sub="Genbu's Shield",ammo="Hydrocera",
		head="Merlinic Hood",neck="Eddy Necklace",ear1="Barkarole Earring",ear2="Gwati Earring",
		body="Amalric Doublet",hands="Lurid Mitts",ring1="Weatherspoon Ring",ring2="Evanescence Ring",
		back="Bookworm's Cape",waist="Witful Belt",legs="Pedagogy Pants",feet="Medium's Sabots"}

	sets.midcast.Drain = set_combine(sets.midcast['Dark Magic'], {ammo="Incantor Stone",
		head="Pixie Hairpin +1",ear1="Hirudinea Earring",ear2="Loquacious Earring",hands="Helios Gloves",waist="Fucho-no-obi",feet="Merlinic Crackows"})

	sets.midcast.Aspir = sets.midcast.Drain

	sets.midcast.Stun = {main="Akademos",sub="Arbuda Grip",ammo="Incantor Stone",
		head="Pedagogy Mortarboard +1",neck="Orunmila's Torque",ear1="Enchanter Earring +1",ear2="Loquac. Earring",
		body="Amalric Doublet",hands="Gendewitha Gages +1",ring1="Weatherspoon Ring",ring2="Prolix Ring",
		back="Swith Cape +1",waist="Ninurta's Sash",legs="Psycloth Lappas",feet="Academic's Loafers +1"}

	sets.midcast.Stun.Resistant = set_combine(sets.midcast.Stun, {})


	-- Elemental Magic sets are default for handling low-tier nukes.
	sets.midcast['Elemental Magic'] = {main="Akademos",sub="Zuuxowu Grip",ammo="Ghastly Tathlum +1",
		head="Buremte Hat",neck="Saevus Pendant +1",ear1="Barkarole Earring",ear2="Friomisi Earring",
		body="Witching Robe",hands="Otomi Gloves",ring1="Shiva Ring +1",ring2="Shiva Ring +1",
		back="Bookworm's Cape",waist="Tengu-no-Obi",legs="Merlinic Shalwar",feet="Amalric Nails"}

	sets.midcast['Elemental Magic'].Resistant = sets.midcast['Elemental Magic']

	-- Custom refinements for certain nuke tiers
	sets.midcast['Elemental Magic'].HighTierNuke = set_combine(sets.midcast['Elemental Magic'], {ammo="Ghastly Tathlum +1",
	    main="Akademos",sub="Niobid Strap",head=gear.merl_head_MAB,body="Amalric Doublet",hands="Chironic Gloves",
		back="Toro Cape",waist="Refoccilation Stone",feet="Merlinic Crackows"})

	sets.midcast['Elemental Magic'].HighTierNuke.Resistant = set_combine(sets.midcast['Elemental Magic'].HighTierNuke, {
	    main="Akademos",sub="Niobid Strap",ammo="Savant's Treatise",
	    neck="Eddy Necklace",back="Bookworm's Cape",feet="Helios Boots"})

	sets.midcast.Impact = {main="Akademos",sub="Mephitis Grip",ammo="Hydrocera",
		head=empty,neck="Eddy Necklace",ear1="Barkarole Earring",ear2="Gwati Earring",
		body="Twilight Cloak",hands=gear.macc_hagondes,ring1="Weatherspoon Ring",ring2="Sangoma Ring",
		back="Refraction Cape",waist="Refoccilation Stone",legs="Psycloth Lappas",feet="Medium's Sabots"}
		
	sets.midcast.Helix = sets.midcast['Elemental Magic']
	sets.midcast.Noctohelix = set_combine(sets.midcast.Helix, {head="Pixie Hairpin +1"})


	-- Sets to return to when not performing an action.

	-- Resting sets
	sets.resting = {main="Chatoyant Staff",sub="Mephitis Grip",
		neck="Wiglen Gorget",body="Witching Robe",hands="Serpentes Cuffs",
		ring1="Sheltered Ring",ring2="Paguroidea Ring",legs="Assiduity Pants +1",feet="Serpentes Sabots"}


	-- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)

	sets.idle.Town = {main="Akademos",sub="Niobid Strap",ammo="Hydrocera",
		head="Merlinic Hood",neck="Orunmila's Torque",ear1="Enchanter Earring +1",ear2="Loquacious Earring",
		body="Amalric Doublet",hands="Amalric Gages",ring1="Shiva Ring +1",ring2="Shiva Ring +1",
		back="Mecistopins Mantle",waist="Fucho-no-obi",legs="Merlinic Shalwar",feet="Herald's Gaiters"}

	sets.idle.Field = {main="Akademos",sub="Niobid Strap",ammo="Homiliary",
		head="Befouled Crown",neck="Twilight Torque",ear1="Enchanter Earring +1",ear2="Loquacious Earring",
		body="Amalric Doublet",hands="Serpentes Cuffs",ring1="Shiva Ring +1",ring2="Shiva Ring +1",
		back="Mecistopins Mantle",waist="Witful Belt",legs="Assiduity Pants +1",feet="Serpentes Sabots"}	
		
	sets.idle.PDT = {main="Bolelabunga",sub="Genbu's Shield",ammo="Incantor Stone",
		neck="Twilight Torque",ear1="Ethereal Earring",ring1="Defending Ring",ring2=gear.DarkRing.physical,
		body="Vanya Robe",hands="Gendewitha Gages +1",back="Umbra Cape",feet="Pedagogy Loafers +1"}	

	sets.idle.Weak = sets.idle.Field
	
	-- Defense sets

	sets.defense.PDT = {main="Bolelabunga",sub="Genbu's Shield",ammo="Incantor Stone",
		head="Befouled Crown",neck="Twilight Torque",ear1="Ethereal Earring",
		body="Vanya Robe",hands="Gendewitha Gages +1",ring1="Defending Ring",ring2=gear.DarkRing.physical,
		back="Umbra Cape",legs="Chironic Hose",feet="Vanya Clogs"}

	sets.defense.MDT = {
		head="Merlinic Hood",neck="Twilight Torque",
		body="Pedagogy Gown +1",hands="Chironic Gloves",ring1="Defending Ring",ring2="Shadow Ring",
		back="Umbra Cape",legs="Chironic Hose",feet="Arbatel Loafers +1"}

	sets.Kiting = {feet="Herald's Gaiters"}
	sets.latent_refresh = {waist="Fucho-no-obi"}

	-- Engaged sets

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion

	-- Normal melee group
	--[[sets.engaged = {
		head="Gendewitha Caubeen +1",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
		body="Pedagogy Gown +1",hands="Lurid Mitts",ring1="Rajas Ring",ring2="Mars's Ring",
		back="Buquwik Cape",waist="Ninurta's Sash",legs="Academic's Pants +1",feet="Pedagogy Loafers +1"}]]--



	-- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
	sets.buff['Ebullience'] = {}
	sets.buff['Rapture'] = {head="Arbatel Bonnet +1"}
	sets.buff['Perpetuance'] = {hands="Arbatel Bracers +1"}
	sets.buff['Immanence'] = {hands="Arbatel Bracers +1"}
	sets.buff['Penury'] = {legs="Arbatel Pants +1"}
	sets.buff['Parsimony'] = {legs="Arbatel Pants +1"}
	sets.buff['Celerity'] = {feet="Pedagogy Loafers +1"}
	sets.buff['Alacrity'] = {head=gear.merl_head_MAB,feet="Pedagogy Loafers +1"}
	sets.buff['Stormsurge'] = {feet="Pedagogy Loafers +1"}
	sets.buff['Klimaform'] = {feet="Arbatel Loafers +1"}

	sets.buff.FullSublimation = {head="Academic's Mortarboard +1",ear1="Savant's Earring",body="Pedagogy Gown +1",neck="Wiglen Gorget",ring1="Sheltered Ring",ring2="Paguroidea Ring"}
	sets.buff.PDTSublimation = {head="Academic's Mortarboard +1",ear1="Savant's Earring",body="Pedagogy Gown +1"}
	
	sets.magic_burst = {main="Akademos",sub="Niobid Strap",
	    head=gear.merl_head_MB,neck="Mizukage-no-Kubikazari",hands="Amalric Gages",
		ring1="Mujin Band",ring2="Locus Ring",back="Seshaw Cape",feet="Helios Boots"}
	-- Cap: 40%
    -- Akademos: 10%, Merlinic Hood: 4%, Mizukage: 10%, Locus: 5%, Seshaw: 5%, Helios Boots: 6%	= 40%

	--sets.buff['Sandstorm'] = {feet="Desert Boots"}
end
-------------------------------------------------------------------------------------------------------------------
-- Global settings
-------------------------------------------------------------------------------------------------------------------
 
-- You'll need the Shortcuts addon to handle the auto-targetting of the custom pact commands.
-- I really recommend if you use this, it's on a full keyboard it uses a lot of keybinds.  If you are imaginative there is enough keybinds using window and app key to go around though.  A supported macro keyboard also helps.  I use a Strix Tactic Pro that a windower developer kindly made work with Windower.
--
 
display_hud = true -- can toggle with app/menu key + 0
display_states = true -- can toggle with app/menu key + 8
--app/menu key + 9 will force the hud to refresh in case of any bugs/to trouble shoot bugs
base_icon_dir = 'D:/Program Files (x86)/Windower4/addons/Gearswap/data/icons/' --had to use absolute pathing, set this to the icon directory
hud_x_pos = 1500 --important to update these if you have a smaller screen
hud_y_pos = 200
hud_draggable = false -- really recommend leaving it false for now, after the icons were introduced it gets kind of buggy.  Can change positions and then hit false
hud_font_size = 12
hud_icon_width = 32 --the size of icons from plugins folder, if you change the icons in icon folder you gave above, set the width height here
hud_icon_height = 32 --the size of icons from plugins folder, if you change the icons in icon folder you gave above, set the width height here
hud_transparency = 220 -- a value of 0 (invisible) to 255 (no transparency at all)

-------------------------------------------------------------------------------------------------------------------
-- Key bindings, and toggles/switches using mote's libraries.  Feel free to change key bindings
-- ! = alt, ^ = ctrl, @ = windows key, # = menu key/app key, 
-- putting % after any of these disables the keybind if you are typing in a chat window
-------------------------------------------------------------------------------------------------------------------
-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('Perp', 'Melee')
    state.CastingMode:options('Normal', 'Resistant','PDT')
    --state.IdleMode:options('Normal', 'PDT')
    state.damagetaken = M{['description']="Damage Taken",'None','PDT'}
    --state.damagetaken = M{['description']="Damage Taken",'None','DT', 'PDT', 'MDT'} --can use this line instead and cycle more damage resistance types
    state.petdamagetaken = M{['description']="Pet Damage Taken",'None','DT'}
    state.cpmode = M(false, 'CP Mode')
    state.movement = M(false, 'Movement Mode')
    state.tplock = M(false, 'Staff Lock')
    state.impactmode = M(false, 'Impact Debuff Mode')
    state.favor = M{['description'] = 'Favor Mode'}
    state.favor:options('mpsaver','allout')
    state.burstmode = M{['description'] = 'Burst Mode'}
    state.burstmode:options('Normal','Burst')
 
    --gear.perp_staff = {name="Gridarvor"}
   
    select_default_macro_book()
    send_command('bind !%numpad1 gs c smn carbuncle')
    send_command('bind !%numpad2 gs c smn fenrir')
    send_command('bind !%numpad3 gs c smn ifrit')
    send_command('bind !%numpad4 gs c smn titan')
    send_command('bind !%numpad5 gs c smn leviathan')
    send_command('bind !%numpad6 gs c smn garuda')
    send_command('bind !%numpad7 gs c smn shiva')
    send_command('bind !%numpad8 gs c smn ramuh')
    send_command('bind !%numpad9 gs c smn diabolos')
    send_command('bind !%numpad0 gs c smn caitsith')
    send_command('bind !%numpadenter gs c smn atomos')
    send_command('bind !%numpad. gs c smn lightspirit')

    send_command('bind !%delete input /ja "Avatar\'s Favor"')
    send_command('bind !%pagedown input /ja "Apogee"')
    send_command('bind !%end input /ja "Sublimation"')

    send_command('bind @%numpad0 gs c warpring')
    send_command('bind #0 gs c toggle_hud')
    send_command('bind #9 gs c force_hud_refresh')
    send_command('bind #8 gs c toggle_states')

    send_command('alias stp_m1 input /ma "Cure III" <p0>')
    send_command('alias stp_m2 input /ma "Cure III" <p1>')
    send_command('alias stp_m3 input /ma "Cure III" <p2>')
    send_command('alias stp_m4 input /ma "Cure III" <p3>')
    send_command('alias stp_m5 input /ma "Cure III" <p4>')
    send_command('alias stp_m6 input /ma "Cure III" <p5>')
    send_command('alias stp_m7 input /ma "Cure III"')
    send_command('alias stp_m8 input /ma "Regen II"')
    send_command('alias stp_m9 gs c nukemode')
    send_command('alias stp_m10 gs c supportmode')
    send_command('alias stp_m11 gs c release')
    send_command('alias stp_m12 input /pet "Retreat" <me>')
    send_command('alias stp_m13 input /pet "Assault" <t>')
    send_command('alias stp_m14 input /ma "Light Spirit" <me>')

    --if you don't use a macro keyboard then you could use these
    send_command('bind ^%numpad1 gs c release')
    send_command('bind !%home input /pet "Retreat" <me>')
    send_command('bind !%insert input /pet "Assault" <t>')

    send_command('alias stp_m11 gs c release')
    send_command('alias stp_m12 input /pet "Retreat" <me>')
    send_command('alias stp_m13 input /pet "Assault" <t>')
    send_command('alias stp_m14 input /ma "Light Spirit" <me>')

    --shortcuts
    send_command('alias si input /ma sneak;wait 5;input /ma invisible')
    send_command('alias sn input /ma sneak')
    send_command('alias in input /ma invisible')
    send_command('alias f1 input /ma fire;wait 4;input /ma fire')
    send_command('alias t1 input /ma thunder;wait 4;input /ma thunder')
    send_command('alias p input /ma paralyna')
    send_command('alias l input /ma aurorastorm')
    send_command('alias po input /ma poisona')
    send_command('alias e input /ma erase')
    send_command('alias c input /ma cursna')
    send_command('alias s input /ma silena')
    send_command('alias b input /ma blindna')
    send_command('alias bu input /ma stoneskin;wait 8;input /ma aquaveil')
    send_command('alias ss input /ma stoneskin')
    send_command('alias bl input /ma blink')
    send_command('alias r input /ma refresh')
    send_command('alias rr input /ma reraise')
    send_command('alias rg lua r gearswap')

    --alt
    send_command('bind !1 gs c pact cure')
    send_command('bind !2 gs c pact curaga')
    send_command('bind !3 gs c pact buffoffense')
    send_command('bind !4 gs c pact buffdefense')
    send_command('bind !5 gs c pact buffspecial')
    send_command('bind !6 gs c pact debuff1')
    send_command('bind !7 gs c pact debuff2')
    send_command('bind !8 gs c pact sleep')
    send_command('bind !9 gs c pact misc2')
    --send_command('bind !0 input /item "Ginger Cookie" <stnpc>; wait 1; input /item "Ginger Cookie" <lastst>; wait 1;input /item "Ginger Cookie" <lastst>') --halloween event.. >.>

    --ctrl
    send_command('bind ^1 gs c pact nuke2')
    send_command('bind ^2 gs c pact nuke4')
    send_command('bind ^3 gs c pact bp70')
    send_command('bind ^4 gs c pact bp75')
    send_command('bind ^5 gs c pact bprage1')
    send_command('bind ^6 gs c pact astralflow')
    send_command('bind ^7 gs c pact misc1')
    --send_command('bind ^9 gs c pact misc3')
    --send_command('bind ^9 input /pet "Release" <me>')

    --send_command('bind ^0 gs c pact misc4')

    --send_command('bind ^o gs c switchmode')
    send_command('bind !q gs c siphon')
    send_command('bind !o input /map')
    send_command('bind !%numpad+ input /map')
    send_command('bind !%numpad- gs c fleet_wind')
    send_command('bind f11 gs c cycle damagetaken')
    send_command('bind !f11 gs c cycle petdamagetaken')
    send_command('bind f10 gs c toggle movement')
    send_command('bind ^f10 gs c cycle favor')
    send_command('bind !f10 gs c cycle impactmode')
    send_command('bind !f9 gs c cycle burstmode')
    --send_command('bind ^[ gs c cpmode')
    send_command('bind ^[ gs c toggle cpmode')
    send_command('bind ![ gs c toggle tplock')
    send_command('bind ^] gs c buffrotation')
    --send_command('bind %numpad1 setkey f8 down;wait .1;setkey f8 up;input /pet "Heavenly Strike" <t>')
    --send_command('bind %numpad3 setkey f8 down;wait .1;setkey f8 up;input /pet "Sleepga" <t>')
    --send_command('bind %numpad3 input /pet "Flaming Crush" <t>')
    --send_command('bind !%numpad. gs c smn lightspirit')

    --HUD for summoner, don't modify
    smn_property = {
	    avatar="\\cs(255,0,0)None\\cr",
	    pacts = {['Rage']="",['Ward']=""},
    }
    smn_info = {}
    smn_info.box={
	    pos={x=hud_x_pos,y=hud_y_pos},
	    text={font='Segoe UI Symbol', size=hud_font_size, Fonts={'sans-serif'},},
	    bg={alpha=hud_transparency,red=0,green=15,blue=0},
	    flags={draggable=hud_draggable},
	    padding=7
    }
    window = texts.new(smn_info.box)
    initialize(window, smn_info.box)
    icon_settings = {
	    name='avatar_icon',
	    color={alpha=hud_transparency,red=255,green=255,blue=255},
	    size={height=hud_icon_width,width=hud_icon_height},
	    pos={x=1300,y=0},
	    draggable=false
    }
    avatar_icon = images.new('',icon_settings,nil)
    images.path(avatar_icon,base_icon_dir..'base.png')
    images.show(avatar_icon)

    window:show()
    updatedisplay()
end
 
-------------------------------------------------------------------------------------------------------------------
-- Sets, modify these :D
-------------------------------------------------------------------------------------------------------------------
 
-- Define sets and vars used by this job file.
function init_gear_sets()
--mostly defunct for me helios set, I put this here so every time I changed my augs I'd just have one place to change it
--	sets.heliosmab = {
--		head={ name="Helios Band", augments={'Pet: "Mag.Atk.Bns."+29','Pet: Crit.hit rate +4','Blood Pact Dmg.+4',}}, 
--		body={ name="Helios Jacket", augments={'Pet: "Mag.Atk.Bns."+28','Pet: Crit.hit rate +4','Blood Pact Dmg.+4',}},
--		hands={ name="Helios Gloves", augments={'Pet: "Mag.Atk.Bns."+28','Pet: Crit.hit rate +4','Blood Pact Dmg.+4',}},
--		legs={ name="Helios Spats", augments={'Pet: "Mag.Atk.Bns."+29','Pet: Crit.hit rate +4','Blood Pact Dmg.+5',}},
--		feet={ name="Helios Boots", augments={'Pet: "Mag.Atk.Bns."+28','Pet: Crit.hit rate +3','Blood Pact Dmg.+6',}},
--	}
--you can use them by filling out your set then after putting:
--set_combine(sets.heliosmab,sets.midcast['Elemental Magic'])
--for example.  if an equip slot is defined for both sets, set_combine keeps the one on the right over the one on the left.  
--so that's why heliosmab is first
	--MAX: crit 20% mab 150 bpdmg 35
	--AT: crit 19% mab 142 bpdmg 23
	--MISSING: crit 1% mab 8 bpdmg 12
        bpmagicstaff = { name="Grioavolr", augments={'Blood Pact Dmg.+7','Pet: Mag. Acc.+20','Pet: "Mag.Atk.Bns."+19','DMG:+11',}}
	smnskillstaff = { name="Espiritus", augments={'Summoning magic skill +15','Pet: Mag. Acc.+30','System: 2 ID: 153 Val: 3',}}
	avatarattackstaff = { name="Espiritus", augments={'System: 2 ID: 136 Val: 14','Pet: Attack+25','System: 2 ID: 152 Val: 3',}}
	--if you don't have 3 staff you can set them all to the same one, until you do get more.  Nirvana is the best avatarattackstaff, espiritus techinically best for the other 2 with right augs
	--if you're confused for any sets with augs or just wanna save time, just equip the gear and type //gs export lua and it will be in your data/export folder
	dmgcape = { name="Conveyance Cape", augments={'Summoning magic skill +2','Blood Pact Dmg.+5','Pet: Enmity +11',}}
	skillcape = { name="Conveyance Cape", augments={'Summoning magic skill +5','Pet: Enmity+7',}}
	timercape = { name="Conveyance Cape", augments={'Summoning magic skill +2','Blood Pact Dmg.+1','Blood Pact ab. del. II -3',}}
	
	headmatb = { name="Apogee Crown", augments={'MP+60','Pet: "Mag.Atk.Bns."+30','Blood Pact Dmg.+7',}}
	
	
	feetmatb = { name="Apogee Pumps", augments={'MP+60','Pet: "Mag.Atk.Bns."+30','Blood Pact Dmg.+7',}}
	feethybrid = { name="Apogee Pumps", augments={'Pet: Attack+20','Pet: "Mag.Atk.Bns."+20','Blood Pact Dmg.+7',}}
	
	sets.cpmode = {back="Mecisto. Mantle"}
	sets.tplock = { --for when you wanna melee for self skill chains, or procing voidwatch, or just wanna crack some skulls the old fashioned way
		main=bpmagicstaff
	}
	sets.inwkr = {
		neck="Arciela's Grace +1"
	}
	sets.idleclub = {
		--	    main="Bolelabunga",
		--	    sub="Sors shield",
	}
	sets.movement = { --Feet is your biggest -perp slot, especially with apogee+1 being a massive -9.  Evans earring can help counter this, I keep moonshade on my left ear.  Lucidity helps too but my perp set uses it already
		right_ear="Evans earring",
		--waist="Lucidity sash",
		feet="Herald's Gaiters"
	}
	sets.farmer = { --When you zone into mog gardens, what you wear
		main="Hoe",
		body="Overalls",
		legs="",
		feet="Herald's Gaiters"
	}
	sets.adoulinmovement = { --For more movement in Adoulin
		body="Councilor's Garb"
	}
		
    --------------------------------------
    -- Precast Sets
    --------------------------------------
   
    -- Precast sets to enhance JAs
	sets.precast.JA['Astral Flow'] = {head="Glyphic Horn"}

	sets.precast.JA['Mana Cede'] = {hands="Beckoner's bracers"}
	sets.keep = {
		left_ring="Warp Ring",
		right_ring="Capacity Ring",
	}
	sets.keep2 = {
		left_ring="Echad Ring",
	}
	sets.keep3= {
		left_ring="Holy Water",
		main="Remedy",
		sub="Echo Drops",
		head="Grape Daifuku +1",
		body="Grape Daifuku",
		legs="Akamochi",
		feet="Akamochi +1",
		back="Rolanberry Daifuku",
		ammo="Rolanberry Daifuku +1",
	}


    sets.precast.JA['Elemental Siphon'] = {
	    main=smnskillstaff,
	    sub="Vox Grip",
	    ammo="Esper Stone +1",
	    head={ name="Telchine Cap", augments={'"Elemental Siphon"+30',}},
	    body={ name="Telchine Chasuble", augments={'"Elemental Siphon"+30',}},
	    hands={ name="Telchine Gloves", augments={'"Elemental Siphon"+15',}},
	    legs={ name="Telchine Braconi", augments={'"Elemental Siphon"+15',}},
	    feet="Beck. Pigaches +1",
	    neck="Incanter's Torque",
	    waist="Lucidity Sash",
	    --left_ear="",
	    right_ear="Andoaa earring",
	    left_ring="Fervor Ring",--technically shouldn't use on light or darks day, going to add logic for it later
	    right_ring="Evoker's Ring",
	    back=skillcape,
    }

    -- Pact delay reduction gear
    sets.precast.BloodPactWard = { --I just stack it all because when I do salvage or a gear slot is locked by a NM it's nice
	    main=smnskillstaff, --II -2
	    sub="Vox Grip",
	    ammo="Seraphicaller",-- II -5
	    body="Glyphic Doublet +1", -- II -2
	    head="Summoner's Horn",-- -3
	    legs="Beckoner's Spats +1",
	    feet="Glyphic Pigaches",--5 II-1
	    hands="Glyphic Bracers",--6
	    ear2="Evans Earring",
	    waist="Lucidity sash",
	    back=timercape, --II -3
	    --gift -5
    }
    -- delay 1: -15 cap (-20 equipped)
    -- delay II: -10
    -- gift: -5

    sets.precast.BloodPactRage = sets.precast.BloodPactWard

    -- Fast cast sets for spells

    sets.burstmode = {}
    sets.burstmode.Burst = {
	    hands="Glyphic Bracers +1"
    }
    sets.precast.FC = {
	    main="Malevolence", --5
	    sub="Chanter's Shield",--3 
	    head="Nahtirah Hat", --10
	    neck="Orunmila's Torque",--5
	    right_ear="Loquacious earring",--2
--	    ear1="Enchntr. Earring +1"--2
	    hands="Telchine Gloves", 
--	    body="Marduk's jubbah +1",-- +6
	    --body="Vrikodara Jupon", --5
	    body="Shango Robe", --8
--	    ring1="Weatherspoon ring",--5
	    left_ring="Prolix ring", -- 2
	    back="Swith cape", --3
	    waist="Witful belt", --3
	    legs="Orvail Pants +1", --7
	    feet="Chelona Boots", --7
    }
    --almaric+1 --+1
    --zendic --+2
    --max obtainable 73
    --at 61 
    --76 with rdm sub
    
    --sets.precast.FC['Stoneskin'] = {
	    --waist="Siegel Sash", --8
    --}
    sets.precast.FC.Resistant = { --this is still in the works for me, I want it to work that it makes compromises between casting speed, keeping you alive, spell interuption gear, and skill gear for that type of spell to reduce interuption rate
	    main="Earth Staff", -- -20 PDT
	    sub="Vox Strap",
	    head="Vanya hood", --10
	    body="Vrikodara Jupon", --5 -3 PDT
	    hands={ name="Telchine Gloves", augments={'Mag. Acc.+12','"Fast Cast"+5','"Regen" potency+1',}}, --5
	    legs="Lengo pants", --5 -1 PDT
	    feet="Regal Pumps +1", --7
	    left_ring="Prolix ring", -- 2
	    right_ring="Defending ring", -- -10 DT
	    neck="Wiglen Gorget", -- -6 PDT
	    back="Swith cape +1", --3
    }
    --39
 sets.precast.FC['Cure'] = set_combine(sets.precast.FC, {
	    main="Tamaxchi",
	    sub="Genbu's shield",
		neck="Incanter's Torque",
	    body="Heka's kalasiris",
		ear1="Nourishing Earring",
		ear2="Nourishing Earring +1",
	    back="pahtli cape",
		legs="Doyen Pants",
	    feet="Chelona boots"
    })
       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {}
 
    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Myrkr'] = {}
    sets.precast.WS['Shattersoul'] = { --stack INT and MAB, it's a magical WS, this isn't a very good set for it ;p
	    head="Apogee Crown",
	    body="Witching Robe",
	    hands="Apogee Mitts",
	    waist="Aswang Sash",
	    --legs="Helios Spats",
	    --feet="Helios Boots",
	    left_ear="Moonshade Earring",
	    right_ear="Friomisi Earring",
	    neck="Satlada necklace",
	    back="Toro Cape",
    }
 
   
    --------------------------------------
    -- Midcast sets
    --------------------------------------
 
--    sets.midcast.FastRecast = {
--	    main="Marin Staff",
--	    sub="Vivid Strap",
--	    ammo="Seraphicaller",
--	    head="Haruspex hat",
--	    neck="Jeweled collar",
--	    ear2="Loquacious earring",
--	    hands="Regimen mittens",
--	    body="Vanir cotehardie",
--	    ring1="Weatherspoon ring",
--	    ring2="Prolix ring",
--	    back="Swith cape",
--	    waist="Witful belt",
--	    legs="Lengo pants",
--	    feet="Glyph pigaches +1"
--    }

    sets.midcast.Cure = {
	    main="Tamaxchi",
		sub="Sors Shield",
	    head="Vanya hood",
	    body="Heka's Kalasiris",
	    hands="Bokwus Gloves",
	    legs="Nares Trews",
	    feet="Vanya clogs",
	    left_ear="Nourishing earring",
	    right_ear="Nourishing Earring +1",
	    right_ring="Sirona's Ring",
	    left_ring="Ephedra Ring",
	    neck="Incanter's Torque",
	    waist="Witful Belt",
	    back="Tempered Cape"
    }
    --Notes, but outdated
    --power:787.25
    --cure potency: 50+19 
    --haste:8+3+3+5+3+3 = 25
    --conserve mp: 18
    --enmity:-10 + -5
    sets.midcast.Cure.Self = {
	    waist="Gishdubar Sash",
    }
    sets.midcast.Refresh = {}
    sets.midcast.Refresh.Self = {
	    waist="Gishdubar Sash",
    }

    sets.midcast.Cursna = {
		neck="Incanter's Torque",
	    right_ring="Sirona's Ring",
	    left_ring="Ephedra Ring",
	    head="Vanya hood",
	    feet="Vanya clogs",
    }          
    sets.midcast.Cursna.Self = {
	    waist="Gishdubar Sash",
    }
    sets.midcast['Enhancing Magic'] = {
	    neck="Incanter's Torque", --+10
	    body={ name="Telchine Chasuble", augments={'"Elemental Siphon"+30',}}, --+12
	    right_ear="andoaa earring", --+5
	    feet="Regal Pumps +1", --+10
    }
    sets.midcast.Stoneskin = {
	    neck="Nodens Gorget", --+30
		legs="Doyen Pants",
	    --left_ear="Earthcry Earring", +10
	    --legs="Shedier Seraweels",--+35
	    --waist="Siegel Sash",--+20
    }
    sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'],sets.midcast.Stoneskin)

    sets.midcast['Elemental Magic'] = {
	    main="Grioavolr",
	    sub="Niobid Strap", 
	    neck="Incanter's Torque",
	    ear1="Friomisi Earring",
	    ear2="Hecate's Earring",
	    waist="Aswang Sash",
	    back="Toro Cape",
	    body="Witching Robe",
	    hands="Psycloth Manillas",
	    legs="Gyve trousers",
	    feet="Tutyr Sabots"
    }
    sets.midcast['Elemental Magic'] = set_combine(sets.heliosmab,sets.midcast['Elemental Magic'])
    
    sets.midcast['Enfeebling Magic'] = {
	    body="Cohort Cloak",
	    legs="Vanya Slops",
	    ammo="Kalboron stone"
    }
    sets.midcast['Enfeebling Magic'] = set_combine(sets.heliosmab,sets.midcast['Enfeebling Magic'])
--
--    sets.midcast['Dark Magic'] = {
--    }
 
    sets.meleehybrid = {
	    neck="Empath Necklace",
	    left_ear="Bladeborn Earring",
	    right_ear="Steelflash Earring",
	    waist="Olseni Belt",
    }
 
    -- Avatar pact sets.  All pacts are Ability type.
   
    -- Max out Summoning Magic Skill
    sets.midcast.Pet.BloodPactWard = {
	    main=smnskillstaff,
	    sub="Vox Grip",
	    ammo="Seraphicaller",
	    --head="Convoker's Horn +1",
	    head="Beckoner's Horn +1",
	    body="Beckoner's Doublet",
	    hands="Beckoner's Bracers",
	    legs="Beckoner's spats +1",
	    neck="Incanter's Torque",
	    --waist="Lucidity sash",
	    waist="Lucidity Sash",
	    --left_ear="Caller's Earring",
	    left_ear="Gifted earring",
	    right_ear="Andoaa earring",
	    left_ring="Fervor Ring",
	    right_ring="Evoker's ring",
	    back=skillcape,
	    feet="Beckoner's Pigaches +1"
    }
    sets.midcast.Pet.BloodPactWard = set_combine(sets.apogee,sets.midcast.Pet.BloodPactWard)
    sets.midcast.Pet.TPBloodPactWard = set_combine(sets.midcast.Pet.BloodPactWard,{
	    head="Apogee Crown",
	    hands="Apogee Mitts",
	    body="Apogee Dalmatica",
	    legs="Enticer's Pants",
	    feet="Apogee Pumps"
    })

    sets.midcast.Pet.DebuffBloodPactWard = {
	    main=smnskillstaff,
	    sub="Vox Grip",
	    ammo="Seraphicaller",
	    head="Beckoner's Horn +1 ",
	    body="Beckoner's Doublet",
	    hands="Glyphic Bracers ",
	    --hands="Lamassu Mitts +1",
	    neck="Incanter's torque",
	    waist="Lucidity Sash",
	    --left_ear="Caller's Earring",
	    --left_ear="Evans Earring",
	    left_ear="Summoning earring",
	    right_ear="Andoaa earring",
	    left_ring="Evoker's ring",
	    right_ring="Fervor Ring",
		legs="Enticer's Pants",
	    back=skillcape,
	    feet="Apogee Pumps"
    }
    sets.midcast.Pet.DebuffBloodPactWard = set_combine(sets.apogee,sets.midcast.Pet.DebuffBloodPactWard)
       
    sets.midcast.Pet.DebuffBloodPactWard.Acc = sets.midcast.Pet.DebuffBloodPactWard
   
    sets.midcast.Pet.PhysicalBloodPactRage = {
	    main=avatarattackstaff,
	    sub="Vox Grip",
	    ammo="Seraphicaller",
	    head="Helios Band",
	    body="Beckoner's Doublet",
	    hands="Merlinic Dastanas",
	    legs="Enticer's Pants",
	    feet="Apogee Pumps",
	    neck="Sacrifice Torque",
	    waist="Lucidity Sash",
	    left_ear="Gelos Earring",
	    right_ear="Esper earring",
	    left_ring="Evoker's ring",
	    right_ring="Fervor Ring",
	    back=dmgcape,
	    feet="Apogee Pumps",
    }
    sets.midcast.Pet.HybridBloodPactRage = {
	    main=bpmagicstaff,
	    sub="Vox Grip",
	    ammo="Seraphicaller",
	    head="Helios Band",
	    hands="Merlinic Dastanas",
	    body="Beckoner's Doublet",
	    legs="Helios Spats",
	    feet=feethybrid,
	    neck="Eidolon Pendant +1",
	    waist="Lucidity sash",
	    left_ear="Gelos Earring",
	    right_ear="Esper earring",
	    left_ring="Fervor Ring",
	    right_ring="Speaker's Ring",
	    back=dmgcape,
	    --back="Penetrating Cape",
--	    back="Argochampsa mantle",
    }
    sets.midcast.Pet.HybridBloodPactRage.Acc = sets.midcast.Pet.HybridBloodPactRage
    sets.midcast.Pet.PhysicalBloodPactRage.Acc = sets.midcast.Pet.PhysicalBloodPactRage
    sets.midcast.interruption = {
	    main=smnskillstaff,
	    sub="Vox Grip",
	    ammo="Seraphicaller",
	    head="Convoker's Horn +1",
	    hands="Lamassu Mitts +1",
	    neck="Incanter's Torque",
	    waist="Lucidity sash",
	    left_ear="Evans Earring",
	    right_ear="Andoaa earring",
	    left_ring="Evoker's ring",
	    right_ring="Fervor Ring",
	    back=dmgcape
    }
    sets.midcast.interruption = set_combine(sets.heliosmab,sets.midcast.interruption)
 
    sets.midcast.Pet.MagicalBloodPactRage = {
--	    ring2="Globidonta Ring",
--	    back="Argochampsa mantle",
	    main=bpmagicstaff,
	    sub="Vox Grip",
	    ammo="Seraphicaller",
	    neck="Eidolon Pendant +1",
	    head=headmatb,
	    hands="Merlinic Dastanas",
	    body="Beckoner's Doublet",
	    legs="Apogee Slacks",
	    feet=feetmatb,
	    waist="Lucidity Sash",
	    left_ear="Gelos Earring",
	    --right_ear="Andoaa earring",
	    right_ear="Esper earring",
	    left_ring="Speaker's Ring",
	    right_ring="Evoker's ring",
	    back=dmgcape,
    }
 
    sets.midcast.Pet.MagicalBloodPactRage.Acc = sets.midcast.Pet.MagicalBloodPactRage
    sets.midcast.Pet.TPMagicalBloodPactRage = set_combine(sets.midcast.Pet.MagicalBloodPactRage,{legs="Enticer's Pants"})
    sets.midcast.Pet.IfritMagicalBloodPactRage = set_combine(sets.midcast.Pet.MagicalBloodPactRage,{left_ring="Speaker's Ring",right_ring="Fervor Ring"})
 
    -- Spirits cast magic spells, which can be identified in standard ways.
   
--    sets.midcast.Pet.WhiteMagic = {
--	    ammo="Seraphicaller",
--	    main="Tumafyrig",
--	    head="Convoker's Horn +1 +1",
--	    neck="Caller's Pendant",
--	    ear1="Andoaa earring",
--	    ear2="Summoning earring",
--	    body="Anhur Robe",
--	    hands="Glyphic Bracers +1 +1",
--	    ring1="Evoker's Ring",
--	    ring2="Globidonta Ring",
--	    back="Conveyance cape",
--	    waist="Lucidity sash",
--	    legs="Marduk's Shalwar +1",
--	    sub="Vox grip",
--	    feet="Marduk's crackows +1"
--    }
   
--    sets.midcast.Pet['Elemental Magic'] = set_combine(sets.midcast.Pet.BloodPactRage, {legs="Helios spats"})
-- 
--    sets.midcast.Pet['Elemental Magic'].Resistant = {}
   
 
    --------------------------------------
    -- Idle/resting/defense/etc sets
    --------------------------------------
   
    -- Resting sets
    sets.resting = {
	    main="Chatoyant Staff",
	    sub="Oneiros grip",
	    waist="Fucho-no-obi",
	    legs="Assiduity pants +1",
    }
   
    -- Idle sets
    sets.idle = {
        main="Gridarvor",
        sub="Vox Grip",
        ranged="",
        ammo="Seraphicaller",
        head="Beckoner's Horn +1",
        neck="Caller's Pendant",
        lear="Gifted Earring",
        rear="Evans Earring",
        body="Shomonjijoe +1",
        hands="Serpentes Cuffs",
        lring="Evoker's Ring",
        rring="Fervor Ring",
        back="Mecistopins Mantle",
        waist="Moepapa Stone",
        legs="Assiduity pants +1",
        feet="Apogee Pumps"
    }
      sets.damagetaken = {}
      sets.damagetaken.None = {
      }
      sets.damagetaken.DT = {
	      body="Onca Suit",--10
	      hands="",
	      legs="",
	      feet="",
	      right_ring="Defending Ring",--10
	      --neck="Twlight Torque"--5
	      --back="Hexerei Cape"--3
      }
      sets.damagetaken.PDT = { --
	      --main="Earth Staff", --20
	      main="Mafic Cudgel", --10
	      sub="Genmei Shield", --10
	      left_ring="Gelatinous Ring +1",--6
	      right_ring="Defending Ring",--10
	      --neck="Wiglen Gorget",--6
	      --neck="Twilight Torque",--5
	      body="Onca Suit", --10
	      hands="",
	      legs="",
	      feet="",
	      back="Repulse Mantle"--4
	      --back="Umbra Cape"--6, 12 at night
      }
      sets.damagetaken.MDT = {--Shell V is around 24%
	      right_ring="Defending Ring",--10
	      body="Onca Suit",--10
	      --back="Hexerei Cape"--3
	      --neck="Twilight Torque",--5
	      --left_ring="Vengeful Ring",--magiceva
      }
      --sets.damagetaken.MagicEvasion = {
	      --left_ring="Vengeful Ring",--9
	      --right_ring="Purity Ring",--10
	      --back="Felicitas Cape +1",--10
	      --body="Onca Suit" -- 252
	      --body 91, hands 48, legs 118, feet 118
	      --left_ear="Eabani Earrng", --8
	      --right_ear="Flashward Earrng", --8
	      --head 86
	      --
      --}
      sets.petdamagetaken = {}
      sets.petdamagetaken.DT = {
	    main=bpmagicstaff,
	    neck="Empath Necklace",
	    left_ear="Handler's Earring +1",
	    right_ear="Handler's Earring",
	    --right_ear="Rimeice earring",
	    legs="Psycloth Lappas",
      }
 
    sets.precast.FC.PDT = set_combine(sets.precast.FC, sets.damagetaken.PDT)
    sets.idle.PDT = {--mixes refresh with pdt
	    main="Earth staff", --20
	    sub="Oneiros Grip",
	    --main="Bolelabunga",
	    --sub="Sors shield",
	    
	    ammo="Seraphicaller",
	    head="Convoker's Horn +1",
	    body="Shomonjijoe +1",
	    hands="Asteria Mitts +1",
	    legs="Assiduity pants +1",
	    feet="Convoker's Pigaches +1",
	    neck="Wiglen Gorget", --6
	    waist="Fucho-no-obi",
	    left_ear="Moonshade Earring",
	    right_ear="Andoaa earring",
	    left_ring="Gelatinous Ring +1", --6
	    --left_ring="Thurandaut ring",
	    right_ring="Defending Ring", --10
	    back="Repulse Mantle" --4
    }

    -- perp costs:
    -- spirits: 7
    -- carby: 11 (5 with mitts)
    -- fenrir: 13
    -- others: 15
    -- avatar's favor: free, if you minimized perp cost already, -4 a tick with no -perp gear.  Weird I know but it's true, test it yourself
   
    -- Max useful -perp gear is 1 less than the perp cost (can't be reduced below 1)
    -- Aim for -14 perp, and refresh in other slots.
    --
   
    -- -perp gear:
    -- Grivardor: -5
    -- Glyphic Horn: -4
    -- Caller's Doublet +2/Glyphic Doublet: -4
    -- Evoker's Ring: -1
    -- Convoker's Pigaches: -4
    -- total: -18
   
    -- Can make due without either the head or the body, and use +refresh items in those slots.
    sets.keep = {
	    left_ring="Warp Ring",
    }
    sets.keep2 = {
	    left_ring="Echad Ring",
	    right_ring="Trizek Ring",
    }
   

    sets.idle.PDT = {}
    --maximize summoning skill and reduce perp and use glyphic legs, tho it doesn't seem smn skill doing much for these anymore
    sets.idle.Spirit = set_combine(sets.midcast.Pet.BloodPactWard, {main="Gridarvor",left_ear="Moonshade Earring",legs="Glyphic Spats"})
-- 
--    sets.idle.Town = {
--                main="Terra's staff",
--                sub="Oneiros grip",
--                head="Convoker's horn +1",
--                neck="Twilight torque",
--                ear1="Moonshade earring",
--                ear2="Gifted earring",
--                body="Hagondes coat +1",
--                hands="Serpentes cuffs",
--                ring1="Dark ring",
--                ring2="Dark ring",
--                back="umbra cape",
--                waist="Fucho-no-obi",
--                legs="Assiduity pants +1",
--                feet="Serpentes sabots"
--    }
 
    -- Favor uses Caller's Horn instead of Convoker's Horn +1 for refresh
    --sets.idle.Avatar.Favor = {head="Caller's Horn +1"}
    
    sets.favor= {}
    sets.favor.mpsaver={ -- don't sacrifice refresh gear for smn skill gear
	    main="Gridarvor",
	    sub="Vox Grip",
	    ammo="Seraphicaller",
	    head="Beckoner's Horn +1",
	    body="Shomonjijoe +1",
	    --body="Beckoner's Doublet +1",
	    --hands={ name="Telchine Gloves", augments={'"Avatar perpetuation cost" -4',}},
	    hands="Glyphic Bracers",
	    --legs="Beckoner's Spats",
	    legs="Assiduity pants +1",
	    --feet="Convoker's Pigaches +1",
	    --feet="Beck. Pigaches +1",
	    feet="Apogee pumps",
	    neck="Caller's Pendant",
	    waist="Lucidity sash",
	    --left_ear="Caller's Earring",
	    left_ear="Moonshade Earring",
	    right_ear="Andoaa earring",
	    --right_ear="Evans earring",
	    --left_ring="Thurandaut ring",
	    left_ring="Evoker's ring",
	    right_ring="Fervor Ring",
	    back=skillcape,
    }
    sets.favor.allout={ -- equip all the favor and smn skill you can while not losing MP
	    --main="Gridarvor",
	    main=smnskillstaff,
	    sub="Vox Grip",
	    ammo="Seraphicaller",
	    head="Beckoner's Horn +1",
	    --body="Shomonjijoe +1",
	    body="Beckoner's Doublet +1",
	    --hands={ name="Telchine Gloves", augments={'"Avatar perpetuation cost" -4',}},
	    hands="Glyphic Bracers",
	    --hands="Lamassu Mitts +1",
	    --legs="Beckoner's Spats",
	    legs="Assiduity pants +1",
	    --feet="Convoker's Pigaches +1",
	    --feet="Beck. Pigaches +1",
	    feet="Apogee Pumps",
	    --neck="Caller's Pendant",
	    neck="Incanter's Torque",
	    waist="Lucidity sash",
	    --left_ear="Caller's Earring",
	    left_ear="Moonshade Earring",
	    right_ear="Andoaa earring",
	    left_ring="Evoker's ring",
	    right_ring="Fervor Ring",
	    back=skillcape,
	    back=skillcape,
    }
       
    sets.idle.Avatar = { 
--	    ear2="Loquacious Earring",
--	    body="Hagondes coat +1",
--	    hands="Regimen mittens",
--	    ring2="Globidonta Ring",
	    waist="Isa belt",
	    main="Gridarvor",
	    sub="Vox Grip",
	    head="Beckoner's Horn",
	    body="Shomonjijoe +1",
	    --hands={ name="Telchine Gloves", augments={'"Avatar perpetuation cost" -4',}},
	    hands="Serpentes Cuffs",
	    legs="Assiduity pants +1",
	    --feet="Beck. Pigaches +1",
	    feet="Apogee pumps",
	    neck="Caller's Pendant",
	    ammo="Seraphicaller",
	    --waist="Lucidity sash",
	    --waist="Fucho-no-obi",
	    --left_ear="Caller's Earring",
	    left_ear="Moonshade Earring",
	    --right_ear="Andoaa earring",
	    --right_ear="Evans earring",
	    right_ear="Andoaa earring",
	    --left_ring="Paguroidea Ring",
	    --left_ring="Thurandaut ring",
	    left_ring="Evoker's ring",
	    right_ring="Fervor Ring",
	    back="Conveyance Cape",
    }
    sets.Avatar = {}
    sets.Avatar.Haste = {
	    main="Gridarvor",
	    sub="Vox Grip",
	    head="Beckoner's Horn",
	    body="Shomonjijoe +1",
	    --hands={ name="Telchine Gloves", augments={'"Avatar perpetuation cost" -4',}},
	    hands="Asteria Mitts +1",
	    legs="Assiduity pants +1",
	    --feet="Beck. Pigaches +1",
	    feet="Apogee pumps",
	    --feet="Psycloth boots",
	    --neck="Caller's Pendant",
	    neck="Empath necklace",
	    ammo="Seraphicaller",
	    --waist="Incarnation Sash",
	    waist="Moepapa Stone",
	    --waist="Fucho-no-obi",
	    --left_ear="Caller's Earring",
	    left_ear="Moonshade Earring",
	    --right_ear="Handler's Earring +1",
	    --right_ear="Rimeice earring",
	    right_ear="Evans earring",
	    --left_ring="Paguroidea Ring",
	    right_ring="Thurandaut ring",
	    left_ring="Evoker's ring",
	    --right_ring="Fervor Ring",
	    --back={ name="Conveyance Cape", augments={'Summoning magic skill +4','Blood Pact Dmg.+4','Blood Pact ab. del. II -3',}},
	    back="Penetrating Cape"

    }
    sets.idle.Spirit = set_combine(sets.midcast.Pet.BloodPactWard, {main="Gridarvor",left_ear="Moonshade Earring",legs="Glyphic Spats"})
    sets.perp = sets.idle.Avatar
    
    -- -5 staff
    --    head +2
    --    body +3
    -- -3 pants +2
    --    hands +2
    --    earring +1
    -- -1 ring
    -- -2 waist
    -- -8 feet
    -- -2 earring
    -- Caller's Bracer's halve the perp cost after other costs are accounted for.
    -- Using -10 (Gridavor, ring, Conv.feet), standard avatars would then cost 5, halved to 2.
    -- We can then use Hagondes Coat and end up with the same net MP cost, but significantly better defense.
    -- Weather is the same, but we can also use the latent on the pendant to negate the last point lost.
    --sets.perp.Day = {body="Hagondes Coat +1"}
    --sets.perp.Weather = {neck="Caller's Pendant",body="Hagondes Coat +1"}
    sets.perp.Weather = {neck="Caller's Pendant"}
    -- Carby: Mitts+Conv.feet = 1/tick perp.  Everything else should be +refresh
--    sets.perp.Carbuncle = {
--	    hands="Carbuncle Mitts"
--    }
    sets.perp.Carbuncle = set_combine(sets.perp, {hands="Asteria Mitts +1"})
    sets.perp['Cait Sith'] = set_combine(sets.perp, {hands="Lamassu Mitts +1"})
    sets.perp.LightSpirit = set_combine(sets.midcast.Pet.BloodPactWard, {main="Gridarvor",left_ear="Moonshade Earring",legs="Glyphic Spats"})
    sets.perp.AirSpirit = set_combine(sets.midcast.Pet.BloodPactWard, {legs="Glyphic Spats"})
    sets.perp.FireSpirit = set_combine(sets.midcast.Pet.BloodPactWard, {legs="Glypic Spats"})
    --can add other spirits too 
	    
--    sets.perp.staff_and_grip = {main=gear.perp_staff}
   
    sets.Kiting = {}
   
    sets.latent_refresh = {sub="Oneiros grip",waist="Fucho-no-obi"}
   
 
    --------------------------------------
    -- Engaged sets
    --------------------------------------
   
    sets.engaged = sets.perp 
    sets.engaged.Perp = sets.perp
    sets.engaged.Melee = {
	    head={ name="Telchine Cap", augments={'"Elemental Siphon"+30',}},
	    --body="Beckoner's Doublet +1",
	    --body={ name="Telchine Chasuble", augments={'"Elemental Siphon"+15',}},
	    --hands={ name="Telchine Gloves", augments={'Pet: Regen+3'}},
	    --legs={ name="Telchine Braconi", augments={'"Elemental Siphon"+15',}},
	    --feet="Beck. Pigaches +1",
	    body="Onca Suit",
	    neck="Subtlety spectacles",
	    --right_ring="Thurandaut ring",
	    right_ring="Evoker's Ring",
	    left_ring="Rajas ring",
	    left_ear="Bladeborn earring",
	    right_ear="Steelflash earring",
	    waist="Olseni Belt",
    }
--    sets.engaged.Acc = {
--	    main="Ungeri Staff",
--	    neck="Subtlety spectacles"
--    }
end

-------------------------------------------------------------------------------------------------------------------
-- Under the hood after this point, modify at your own risk
-------------------------------------------------------------------------------------------------------------------
 
images =require('images')
inwkr = 0

function get_sets()
    mote_include_version = 2
 
    -- Load and initialize the include file.
    include('Mote-Include.lua')
    include('organizer-lib')
end
 
function initialize(text, settings)
	local properties = L{}
	properties:append('Avatar : ${avatar}')
	properties:append('${ragepacts}')
	properties:append('${wardpacts}')
	properties:append('${modestates}')
	text:clear()
	text:append(properties:concat('\n'))
end
function concat_strings(s)
    local t = { }
    for k,v in ipairs(s) do
        t[#t+1] = tostring(v)
    end
    return table.concat(t,"\n")
end
function set_hud_info()
	if pet.name then 
		smn_property.avatar = "\\cs(125,125,255)"..pet.name.."\\cr"
	else
		smn_property.avatar = "\\cs(125,125,125)None\\cr"
	end
	--print('c:'..pet.name)
	tmp_sort = {['Rage']={},['Ward']={}}
	--print(tostring(tmp_sort['Ward']))
	smn_property.pacts['Rage'] = ''
	smn_property.pacts['Ward'] = ''
	for index,value in pairs(pacts) do
		--print('p:'..smn_property.pacts)
		--print('i:'..index)
		--print('v:'..pacts[index][pet.name])
		if pacts[index][pet.name] then 
			keybindtxt = ''
			category = ''
			for k,v in pairs(pact_keys[index]) do 
				category = k
				keybindtxt = v
				break 
			end
			--print (category..keybindtxt)
			tmp_sort[category][keybindtxt] = smn_property.pacts[category].."\n     ".. keybindtxt.. ": \\cs(125,125,255)".. pacts[index][pet.name]..'\\cr     ' 
		end
	end
	for index,value in spairs(tmp_sort['Rage']) do
		smn_property.pacts['Rage'] = smn_property.pacts['Rage']..value
	end
	for index,value in spairs(tmp_sort['Ward']) do
		smn_property.pacts['Ward'] = smn_property.pacts['Ward']..value
	end
	if smn_property.pacts['Rage'] ~= '' then smn_property.pacts['Rage'] = "-- Rage --"..smn_property.pacts['Rage'] end
	if smn_property.pacts['Ward'] ~= '' then smn_property.pacts['Ward'] = "\n-- Ward --"..smn_property.pacts['Ward'] end
	if display_states then 
		modestates_table = {
			'\n-- Modes --\n     Offense: \\cs(125,125,255)'..tostring(state.OffenseMode.value)..'\\cr',
			'     Casting: \\cs(125,125,255)'..tostring(state.CastingMode.value)..'\\cr',
			'     DT: \\cs(125,125,255)'..tostring(state.damagetaken.value)..'\\cr',
			'     Pet DT: \\cs(125,125,255)'..tostring(state.petdamagetaken.value)..'\\cr',
			'     Capacity Points: \\cs(125,125,255)'..tostring(state.cpmode.value)..'\\cr',
			'     Movement: \\cs(125,125,255)'..tostring(state.movement.value)..'\\cr',
			'     TP/Staff Lock: \\cs(125,125,255)'..tostring(state.tplock.value)..'\\cr',
			'     Impact Debuff: \\cs(125,125,255)'..tostring(state.impactmode.value)..'\\cr',
			'     Favor: \\cs(125,125,255)'..tostring(state.favor.value)..'\\cr',
			'     Magic Burst: \\cs(125,125,255)'..tostring(state.burstmode.value)..'\\cr',
		}
		smn_property.modestates = concat_strings(modestates_table)
	else
		smn_property.modestates = ''
	end
end
update_delay=0
function updatedisplay() --update hud display
	if update_delay ~=0 then
		coroutine.sleep(update_delay)
		update_delay = 0
	end
	set_hud_info()
	local info = {}
	info.avatar = smn_property.avatar
	info.ragepacts = smn_property.pacts['Rage']
	info.wardpacts = smn_property.pacts['Ward']
	info.modestates = smn_property.modestates
	if pet.name then 
		icon = pet.name:lower()
	else
		icon = 'base'
	end
	images.path(avatar_icon,base_icon_dir..icon..'.png')
	images.pos(avatar_icon,smn_info.box.pos.x,smn_info.box.pos.y-32)
	images.update(avatar_icon)
	--button:update(info)
	--button:show()
	window:update(info)
	window:show()
end

-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()
    --send_command('exec verda/verda_smn.txt');
    state.Buff["Avatar's Favor"] = buffactive["Avatar's Favor"] or false
    state.Buff["Astral Conduit"] = buffactive["Astral Conduit"] or false
    buffrotation = {
	    [0] = {['Hastega II']='Garuda'},
	    [1] = {['Aerial Armor']='Garuda'},
	    [2] = {['Crimson Howl']='Ifrit'},
	    [3] = {['Earthen Armor']='Titan'},
	    [4] = {['Crystal Blessing']='Shiva'},
	    [5] = {['Frost Armor']='Shiva'},
	    [6] = {['Ecliptic Growl']='Fenrir'},
	    [7] = {['Ecliptic Howl']='Fenrir'},
	    [8] = {['Heavenward Howl']='Fenrir'},
	    [9] = {['Dream Shroud']='Diabolos'},
	    [10] = {['Noctoshield']='Diabolos'},
	    [11] = {['Soothing Current']='Leviathan'},
    }
    rotationfavor = 'Ifrit'
    buffrot_count = 0
    for index, value in pairs( buffrotation ) do
	    buffrot_count = buffrot_count + 1
    end
 
    spirits = S{"LightSpirit", "DarkSpirit", "FireSpirit", "EarthSpirit", "WaterSpirit", "AirSpirit", "IceSpirit", "ThunderSpirit"}
    avatars = S{"Carbuncle", "Fenrir", "Diabolos", "Ifrit", "Titan", "Leviathan", "Garuda", "Shiva", "Ramuh", "Odin", "Alexander", "Cait Sith"}
 
    magicalRagePacts = S{
        'Inferno','Earthen Fury','Tidal Wave','Aerial Blast','Diamond Dust','Judgment Bolt','Searing Light','Howling Moon','Ruinous Omen',
        'Fire II','Stone II','Water II','Aero II','Blizzard II','Thunder II',
        'Fire IV','Stone IV','Water IV','Aero IV','Blizzard IV','Thunder IV','Chaotic strike',
        'Thunderspark','Volt strike','Burning Strike','Meteorite','Nether Blast',
        'Meteor Strike','Conflag Strike','Heavenly Strike','Wind Blade','Geocrush','Crag Throw','Grand Fall','Thunderstorm',
        'Holy Mist','Lunar Bay','Night Terror','Level ? Holy','Impact','Zantetsuken'}
    enticersRagePacts = S{
	    'Impact','Heavenly Strike','Wind Blade','Geocrush','Thunderstorm','Meteor Strike','Grand Fall'
    }
    enticersWardPacts = S{
	    'HealingRuby II','Whispering Wind','Healing Ruby','Spring Water'
    }
    hybridPacts = S{
	    'Flaming Crush'
    }
 
    sets.cpmode = {back="Mecisto. Mantle"}
    sets.dtmode = {
	    main="Earth Staff",
	    left_ring="Dark Ring",
	    right_ring="Defending Ring",
    }
 
    pacts = {}
    pacts.cure = {['Carbuncle']='Healing Ruby'}
    pacts.curaga = {['Carbuncle']='Healing Ruby II', ['Garuda']='Whispering Wind', ['Leviathan']='Spring Water'}
    pacts.buffoffense = {['Carbuncle']='Glittering Ruby', ['Ifrit']='Crimson Howl', ['Garuda']='Hastega', ['Garuda']='Hastega II', ['Ramuh']='Rolling Thunder',
        ['Fenrir']='Ecliptic Growl'}
    pacts.buffdefense = {['Carbuncle']='Shining Ruby', ['Shiva']='Frost Armor', ['Garuda']='Aerial Armor', ['Titan']='Earthen Ward',
        ['Ramuh']='Lightning Armor', ['Fenrir']='Ecliptic Howl', ['Diabolos']='Noctoshield', ['Cait Sith']='Reraise II'}

    pacts.buffspecial = {['Ifrit']='Inferno Howl', ['Garuda']='Fleet Wind', ['Titan']='Earthen Armor', ['Diabolos']='Dream Shroud',
        ['Carbuncle']='Soothing Ruby',['Carbuncle']='Pacifying ruby', ['Shiva']='Crystal blessing',['Fenrir']='Heavenward Howl', ['Leviathan']='Soothing current',['Cait Sith']='Raise II',}

    pacts.debuff1 = {['Shiva']='Diamond Storm', ['Ramuh']='Shock Squall', ['Leviathan']='Tidal Roar', ['Fenrir']='Lunar Cry',
        ['Diabolos']='Pavor Nocturnus', ['Cait Sith']='Eerie Eye',['Carbuncle']='Soothing Ruby' }
    pacts.debuff2 = {['Leviathan']='Slowga', ['Fenrir']='Lunar Roar', ['Diabolos']='Somnolence'}
    pacts.sleep = {['Shiva']='Sleepga', ['Diabolos']='Nightmare', ['Cait Sith']='Mewing Lullaby'}
    pacts.nuke2 = {['Ifrit']='Fire II', ['Shiva']='Blizzard II', ['Garuda']='Aero II', ['Titan']='Stone II',
        ['Ramuh']='Thunder II', ['Leviathan']='Water II'}
    pacts.nuke4 = {['Ifrit']='Fire IV', ['Shiva']='Blizzard IV', ['Garuda']='Aero IV', ['Titan']='Stone IV',
        ['Ramuh']='Thunder IV', ['Leviathan']='Water IV',['Fenrir']='Crescent Fang'}
    pacts.bp70 = {
	    ['Ifrit']='Flaming Crush', ['Shiva']='Rush', ['Garuda']='Predator Claws', ['Titan']='Mountain Buster',
	    ['Ramuh']='Chaotic Strike', ['Leviathan']='Spinning Dive', ['Carbuncle']='Meteorite', ['Fenrir']='Eclipse Bite',
	    ['Diabolos']='Nether Blast',['Cait Sith']='Regal Scratch'
    }
    pacts.bp75 = {['Ifrit']='Meteor Strike', ['Shiva']='Heavenly Strike', ['Garuda']='Wind Blade', ['Titan']='Geocrush',
        ['Ramuh']='Thunderstorm', ['Leviathan']='Grand Fall', ['Carbuncle']='Holy Mist', ['Fenrir']='Lunar Bay',
        ['Diabolos']='Night Terror', ['Cait Sith']='Level ? Holy'}
    pacts.astralflow = {['Ifrit']='Inferno', ['Shiva']='Diamond Dust', ['Garuda']='Aerial Blast', ['Titan']='Earthen Fury',
        ['Ramuh']='Judgment Bolt', ['Leviathan']='Tidal Wave', ['Carbuncle']='Searing Light', ['Fenrir']='Howling Moon',
        ['Diabolos']='Ruinous Omen', ['Cait Sith']="Altana's Favor"}
    pacts.bprage1 = {['Fenrir']='Impact',['Ramuh']='Volt Strike',['Cait Sith']='Regal Gash',['Carbuncle']='Poison Nails',['Ifrit']='Conflag Strike',['Titan']='Crag Throw',['Diabolos']='Blindside'}
    pacts.misc1 = {['Ramuh']='Thunderspark',['Fenrir']='Moonlit Charge'}
    pacts.misc2 = {['Diabolos']='Ultimate Terror'}

    --Note this is only for display on the Summoner HUD, if you want to change the actual keybinds you need to go to the user_setup function, this saves string comparisons but mostly makes it easier on the programmer (me)
    pact_keys = {}
    pact_keys.cure = {['Ward']='Alt 1'}
    pact_keys.curaga = {['Ward']='Alt 2'}
    pact_keys.buffoffense = {['Ward']='Alt 3'}
    pact_keys.buffdefense = {['Ward']='Alt 4'}
    pact_keys.buffspecial = {['Ward']='Alt 5'}
    pact_keys.debuff1 = {['Ward']='Alt 6'}
    pact_keys.debuff2 = {['Ward']='Alt 7'}
    pact_keys.sleep = {['Ward']='Alt 8'}
    pact_keys.nuke2 = {['Rage']='Ctrl 1'}
    pact_keys.nuke4 = {['Rage']='Ctrl 2'}
    pact_keys.bp70 = {['Rage']='Ctrl 3'}
    pact_keys.bp75 = {['Rage']='Ctrl 4'}
    pact_keys.bprage1 = {['Rage']='Ctrl 5'}
    pact_keys.astralflow = {['Rage']='Ctrl 6'}
    pact_keys.misc1 = {['Rage']='Ctrl 7'}
    pact_keys.misc2 = {['Ward']='Alt 9'}
 
    -- Wards table for creating custom timers  
    wards = {}
    -- Base duration for ward pacts.
    -- Icons to use when creating the custom timer.
    -- Base duration for ward pacts.
    wards.durations = {
        ['Crimson Howl'] = 60, ['Earthen Armor'] = 60, ['Inferno Howl'] = 60, ['Heavenward Howl'] = 60,
        ['Rolling Thunder'] = 120, ['Fleet Wind'] = 120,
        ['Shining Ruby'] = 180, ['Frost Armor'] = 180, ['Lightning Armor'] = 180, ['Ecliptic Growl'] = 180,
        ['Glittering Ruby'] = 180, ['Hastega'] = 180, ['Hastega II'] = 180,['Noctoshield'] = 180, ['Ecliptic Howl'] = 180,
        ['Dream Shroud'] = 180,
        ['Reraise II'] = 3600
    }
    -- Icons to use when creating the custom timer.
--    wards.icons = {
--        ['Earthen Armor']   = 'spells/00299.png', -- 00299 for Titan
--        ['Shining Ruby']    = 'spells/00043.png', -- 00043 for Protect
--        ['Dream Shroud']    = 'spells/00304.png', -- 00304 for Diabolos
--        ['Noctoshield']     = 'spells/00106.png', -- 00106 for Phalanx
--        ['Inferno Howl']    = 'spells/00298.png', -- 00298 for Ifrit
--        ['Hastega']         = 'spells/00358.png', -- 00358 for Hastega
--        ['Hastega II']         = 'spells/00358.png', -- 00358 for Hastega
--        ['Rolling Thunder'] = 'spells/00104.png', -- 00358 for Enthunder
--        ['Frost Armor']     = 'spells/00250.png', -- 00250 for Ice Spikes
--        ['Lightning Armor'] = 'spells/00251.png', -- 00251 for Shock Spikes
--        ['Reraise II']      = 'spells/00135.png', -- 00135 for Reraise
--        ['Fleet Wind']      = 'abilities/00074.png', --
--    }
   
end
 
-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------
 
function user_unload()
    send_command('unbind !1')
    send_command('unbind !2')
    send_command('unbind !3')
    send_command('unbind !4')
    send_command('unbind !5')
    send_command('unbind !6')
    send_command('unbind !7')
    send_command('unbind !8')
    send_command('unbind !9')
    send_command('unbind !0')

    send_command('unbind ^1')
    send_command('unbind ^2')
    send_command('unbind ^3')
    send_command('unbind ^4')
    send_command('unbind ^5')
    send_command('unbind ^6')
    send_command('unbind ^7')
    send_command('unbind ^8')
    send_command('unbind ^9')
    send_command('unbind ^0')
    send_command('unbind !%numpad1')
    send_command('unbind !%numpad2')
    send_command('unbind !%numpad3')
    send_command('unbind !%numpad4')
    send_command('unbind !%numpad5')
    send_command('unbind !%numpad6')
    send_command('unbind !%numpad7')
    send_command('unbind !%numpad8')
    send_command('unbind !%numpad9')
    send_command('unbind !%numpad0')
    send_command('unbind !%numpadenter')
    send_command('unbind !%numpad.')

    send_command('unbind !%delete')
    send_command('unbind !%pagedown')
    send_command('unbind !%end')

    send_command('unbind @%numpad0')
    send_command('unbind #0')
    send_command('unbind #9')

    send_command('unbind ^o')
    send_command('unbind !q')
    send_command('unbind !o')
    send_command('unbind !%numpad+')
    send_command('unbind !%numpad-')
    send_command('unbind f11')
    send_command('unbind !f11')
    send_command('unbind f10')
    send_command('unbind ^f10')
    send_command('unbind !f10')
    send_command('unbind !f9')
    send_command('unbind ^[')
    send_command('unbind ![')
    send_command('unbind ^]')
    --send_command('unbind %numpad1 setkey f8 down;wait .1;setkey f8 up;input /pet "Heavenly Strike" <t>')
    --send_command('unbind %numpad3 setkey f8 down;wait .1;setkey f8 up;input /pet "Sleepga" <t>')
    send_command('unbind %numpad3')
    send_command('unbind !%numpad.')
end
-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------
 
--swapspaused = false
--function pauseswaps(seconds)
--	swapspaused = true
--	coroutine.sleep(seconds)
--	swapspaused = false
--end

function check_midpact(spell,eventArgs)
    local recast = windower.ffxi.get_ability_recasts()
    --174 BP Ward
    --173 BP Rage

    if spell.type == "BloodPactWard" and recast[174] ~= 0 then 
	--add_to_chat(122,'Blood Pact Ward Cancelled, it is on cooldown')
        eventArgs.handled = true
	return 1
    end
    if spell.type == "BloodPactRage" and recast[173] ~= 0 then 
	--add_to_chat(122,'Blood Pact Rage Cancelled, it is on cooldown')
        eventArgs.handled = true
	return 1
    end
--    if (spell.type == "BloodPactRage" and recast[173] == 0) or (spell.type=="BloodPactWard" and recast[174] == 0) then 
--	swapspaused = true
--	coroutine.schedule(function()
--		swapspaused = false
--	end, 3000)
--    end
    if pet_midaction() then
	--add_to_chat(122,'Avatar Midaction, cancelling')
        eventArgs.handled = true
	return 1
    end
    return 0
end
-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
-- Set eventArgs.useMidcastGear to true if we want midcast gear equipped on precast.
function job_precast(spell, action, spellMap, eventArgs)
--    if state.damagetaken.value ~= "None" then 
--	    tempset = {}
--	    pr (eventArgs)
--	    pr(action)
--    end
--
    --if swapspaused then eventArgs.handled = true end
    beforemp = player.mp
    local check = check_midpact(spell,eventArgs)
    if check==1 then return end
    if buffactive['Astral Conduit'] then
        eventArgs.handled = true
    end
    if buffactive['Apogee'] then
        eventArgs.handled = true
    end
    if state.damagetaken.value ~= "None" then 
	    state.CastingMode:set('PDT')
	    --eventArgs.handled = true
    elseif state.CastingMode.value == 'PDT' then 
	    state.CastingMode:reset()
    end
end
 
function job_midcast(spell, action, spellMap, eventArgs)
    --if swapspaused then eventArgs.handled = true end
    local check = check_midpact(spell,eventArgs)
    --print ('check '..check)
    if check==1 then return end
    --print (spell.english)
    --print(spell.type)
    --if state.Buff['Astral Conduit'] and pet_midaction() then
    --    eventArgs.handled = true
    --end
    if spell.english:startswith('Cure') and spell.target.name == player.name then
	    equip(sets.midcast.Cure.Self)
    end
    if spell.english:contains('Cursna') and spell.target.name == player.name then
	    equip(sets.midcast.Cursna.Self)
    end
    if spell.english:contains('Refresh') and spell.target.name == player.name then
	    equip(sets.midcast.Refresh.Self)
    end
--    elseif spell.type=='SummonerPact' then
--	equip(sets.midcast.interruption)
--        eventArgs.handled = true
--    end
end
function job_pet_midcast(spell,action,spellMap,eventArgs)
end
function job_post_pet_midcast(spell,action,spellMap,eventArgs)--override equip sets for bloodpacts without lots of messy sets
    	if pet.name=='Cait Sith' then
		equip({ hands="Lamassu Mitts +1", })
	elseif pet.name=='Carbuncle' then
		equip({ hands="Asteria Mitts +1", })
	end
	if state.burstmode.value=='Burst' and enticersRagePacts:contains(spell.english) and spell.english~="Impact" then
		equip(sets.burstmode.Burst)
	end
end
function job_aftercast(spell, action, spellMap, eventArgs)
    --if swapspaused then eventArgs.handled = true end
    local check = check_midpact(spell,eventArgs)
    --if check then return end
    if check==1 then return end
    --print('spell '..spell.type..' aftercast')
    handle_equipping_gear(player.status,pet.status)
--    if spell.type == 'Summoning' then
--	return 'idle.Avatar'
--    end
end
 
-- Runs when pet completes an action.
function job_pet_aftercast(spell, action, spellMap, eventArgs)
    --add_to_chat(122,'Player Status is '..player.status)
--    if not spell.interrupted and spell.type == 'BloodPactWard' and spellMap ~= 'DebuffBloodPactWard' then
--        wards.flag = true
--        wards.spell = spell.english
--        send_command('wait 4; gs c reset_ward_flag')
--    end
--    if player.status == 'Engaged' then
--	equip(sets.engaged)
--    end
	aftermp = player.mp
	diffmp = beforemp - aftermp
	savemp = 100*diffmp/248
	savemp = tonumber(string.format("%.3f", savemp))
	--if(spell.en == "Hastega II" and diffmp < 248) then add_to_chat (122,'Blood Boon! Cost was about '..savemp..'% ['..diffmp..'] before:'..beforemp..' after:'..aftermp) end
	handle_equipping_gear(player.status,pet.status)
    --print ('pet aftercast '..pet.status..' action '..action)
--    if pet.isvalid and pet.status == 'Engaged'  then
--	    print('pet aftercast')
--	    equip(sets.Avatar.Haste)
--	    return 'Avatar.Haste'
--    end
--    if pet.isvalid and not midaction() and not pet_midaction() then
--	    if player.status == "Idle" then
--		    --equip(sets.idle.Avatar)
--		    return 'idle.Avatar'
--	    end
--    end
end
 
-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------
 
-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
function job_buff_change(buff, gain)
    if state.Buff[buff] ~= nil then
        handle_equipping_gear(player.status)
    elseif storms:contains(buff) then
        handle_equipping_gear(player.status)
    end
    if gain and buff=="quickening" then
        handle_equipping_gear(player.status)
    end
end
 
 
-- Called when the player's pet's status changes.
-- This is also called after pet_change after a pet is released.  Check for pet validity.
function job_pet_status_change(newStatus, oldStatus, eventArgs)
--    if pet.isvalid and not midaction() and not pet_midaction() and (newStatus == 'Engaged' or oldStatus == 'Engaged') then
--        --handle_equipping_gear(player.status, newStatus)
--    end
--    if pet.isvalid and not pet_midaction() and player.status == 'Idle' and pet.status == 'Engaged'  then
--	    --print('pet haste')
--	    equip(sets.Avatar.Haste)
--    end
	handle_equipping_gear(player.status, newStatus)
end
 
function spairs(t, order)
    -- collect the keys
    local keys = {}
    for k in pairs(t) do keys[#keys+1] = k end

    -- if order function given, sort by it by passing the table and keys a, b,
    -- otherwise just sort the keys 
    if order then
        table.sort(keys, function(a,b) return order(t, a, b) end)
    else
        table.sort(keys)
    end

    -- return the iterator function
    local i = 0
    return function()
        i = i + 1
        if keys[i] then
            return keys[i], t[keys[i]]
        end
    end
end
-- Called when a player gains or loses a pet.
-- pet == pet structure
-- gain == true if the pet was gained, false if it was lost.
function job_pet_change(petparam, gain)
    classes.CustomIdleGroups:clear()
    if gain then
	trackavatar = pet.name
	smn_property.pacts = {['Rage']="",['Ward']=""} 
        if avatars:contains(pet.name) then
            classes.CustomIdleGroups:append('Avatar')
        elseif spirits:contains(pet.name) then
            classes.CustomIdleGroups:append('Spirit')
        end
	updatedisplay()
    else
	smn_property.avatar = "\\cs(255,0,0)None\\cr"
	smn_property.pacts = {['Rage']="",['Ward']=""} 
	updatedisplay()
    end
end
 
-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------
-- Custom spell mapping.
function job_get_spell_map(spell)
    if spell.type == 'BloodPactRage' then
	if spell.english == "Impact" and state.impactmode.value==true then
            return 'DebuffBloodPactWard'
	elseif enticersRagePacts:contains(spell.english) and spell.english ~= 'Impact' and pet.tp > 35 then
            return 'MagicalBloodPactRage'
	elseif enticersRagePacts:contains(spell.english) then
            return 'TPMagicalBloodPactRage'
        elseif hybridPacts:contains(spell.english) then
            return 'HybridBloodPactRage'
	elseif magicalRagePacts:contains(spell.english) and pet.name=="Ifrit" then
            return 'IfritMagicalBloodPactRage'
	elseif magicalRagePacts:contains(spell.english) then
            return 'MagicalBloodPactRage'
	else
            return 'PhysicalBloodPactRage'
        end
    elseif spell.type == 'BloodPactWard' and spell.target.type == 'MONSTER' then
        return 'DebuffBloodPactWard'
    elseif spell.type=='BloodPactWard' and enticersWardPacts:contains(spell.english) then
	return 'TPBloodPactWard'
    end
end
-- Modify the default idle set after it was constructed.
function customize_idle_set(idleSet)
	--print('customize idle set')
	if pet.isvalid then
		if pet.element == world.day_element then
			idleSet = set_combine(idleSet, sets.perp.Day)
		end
		if pet.element == world.weather_element then
			idleSet = set_combine(idleSet, sets.perp.Weather)
		end
		if sets.perp[pet.name] then
			idleSet = set_combine(idleSet, sets.perp[pet.name])
		end
--		gear.perp_staff.name = elements.perpetuance_staff_of[pet.element]
--		if gear.perp_staff.name and (player.inventory[gear.perp_staff.name] or player.wardrobe[gear.perp_staff.name]) then
--			idleSet = set_combine(idleSet, sets.perp.staff_and_grip)
--		end
		if state.Buff["Avatar's Favor"] and avatars:contains(pet.name) then
			--idleSet = set_combine(idleSet, sets.idle.Avatar.Favor)
			idleSet = set_combine(idleSet,sets.favor[state.favor.value])
		end
		if pet.status == 'Engaged' then
			idleSet = set_combine(idleSet, sets.Avatar.Haste)
		end
	end
	if player.max_mp - player.mp < 100 then
		if pet.isvalid then idleSet = set_combine(idleSet, {left_ring="Mephitas's Ring +1", right_ring="Evoker's Ring"})
		else idleSet = set_combine(idleSet, {left_ring="Mephitas's Ring +1"})
		end
	end
	if pet.name=='Cait Sith' then
		idleSet = set_combine(idleSet, {hands="Lamassu Mitts +1"})
	end

	if areas.Cities:contains(world.area) and world.area:contains("Adoulin") then
		idleSet = set_combine(idleSet, sets.adoulinmovement)
	elseif  world.area:contains("Mog Garden") then
		idleSet = set_combine(idleSet, sets.farmer)
		--windower.send_command('input /ja Release <me>;wait 2;input /ma '..tosummon..' <me>')
	elseif buffactive["Quickening"] or buffactive["Fleet Wind"] or areas.Cities:contains(world.area) then
		idleSet = set_combine(idleSet, sets.movement)
	elseif state.movement.current == 'on' then 
		idleSet = set_combine(idleSet, sets.movement)
	end

	if player.mpp < 51 then -- this won't work because gear isn't considered only base
		idleSet = set_combine(idleSet, sets.latent_refresh)
	end
    
	if state.damagetaken.value ~= "None" then idleSet = set_combine(idleSet,sets.damagetaken[state.damagetaken.value]) end
	if state.petdamagetaken.value ~= "None" then idleSet = set_combine(idleSet,sets.petdamagetaken[state.petdamagetaken.value]) end
	
	if state.cpmode.current == 'on' then idleSet = set_combine(idleSet,sets.cpmode) end
	if state.tplock.current == 'on' then 
		idleSet = set_combine(idleSet,sets.tplock) 
		equip(idleSet)
		disable('main','sub')
	else
		enable('main','sub')
	end
	
	if inwkr == 1 then 
		idleSet = set_combine(idleSet, sets.inwkr)
	end
	equip(idleSet)

	return idleSet
end

function customize_melee_set(meleeSet)
    if state.damagetaken.value ~= "None" then meleeSet = set_combine(meleeSet,sets.damagetaken[state.damagetaken.value]) end
    if state.petdamagetaken.value ~= "None" then meleeSet = set_combine(meleeSet,sets.petdamagetaken[state.petdamagetaken.value]) end
    if state.cpmode.current == 'on' then meleeSet = set_combine(meleeSet,sets.cpmode) end
    if state.tplock.current == 'on' then 
	    meleeSet = set_combine(meleeSet,sets.tplock) 
	    equip(meleeSet)
	    disable('main','sub')
    else
	    enable('main','sub')
    end
    if inwkr == 1 then 
	    meleeSet = set_combine(meleeSet, sets.inwkr)
    end
    return meleeSet
    --if state.dtmode.current == 'on' then meleeSet = set_combine(meleeSet,sets.dtmode) end
end
function customize_resting_set(restingSet)
    if state.damagetaken.value ~= "None" then restingSet = set_combine(meleeSet,sets.damagetaken[state.damagetaken.value]) end
	
    if state.cpmode.current == 'on' then restingSet = set_combine(restingSet,sets.cpmode) end
    return restingSet
end

 
-- Called by the 'update' self-command, for common needs.
-- Set eventArgs.handled to true if we don't want automatic equipping of gear.
function job_update(cmdParams, eventArgs)
    classes.CustomIdleGroups:clear()
    if pet.isvalid then
        if avatars:contains(pet.name) then
            classes.CustomIdleGroups:append('Avatar')
        elseif spirits:contains(pet.name) then
            classes.CustomIdleGroups:append('Spirit')
        end
    end
end
 
-- Set eventArgs.handled to true if we don't want the automatic display to be run.
function display_current_job_state(eventArgs)
 
end
 
 
-------------------------------------------------------------------------------------------------------------------
-- User self-commands.
-------------------------------------------------------------------------------------------------------------------
 
modepage = 0;
movement=0
buffrotkey=0
-- Called for custom player commands.
function job_self_command(cmdParams, eventArgs)
    if cmdParams[1] == 'toggle' or cmdParams[1] == 'cycle' then
	    send_command('wait .5;gs c force_hud_refresh')-- there is no way to hook into motes modes function when called, if I update now it is before motes does, a .5 second delay is minimal for update to hud and seems to work well.  coroutine.sleep gives a return error because we have function returns going on
    end
    if cmdParams[1]:lower() == 'petweather' then
        handle_petweather()
        eventArgs.handled = true
    elseif cmdParams[1]:lower() == 'test' then
	pr(buffactive['Apogee']) 
    elseif cmdParams[1]:lower() == 'siphon' then
        handle_siphoning()
        eventArgs.handled = true
    elseif cmdParams[1]:lower() == 'pact' then
        handle_pacts(cmdParams)
        eventArgs.handled = true
    elseif cmdParams[1] == 'reset_ward_flag' then
        wards.flag = false
        wards.spell = ''
        eventArgs.handled = true
    elseif cmdParams[1] == 'smn' then
	tosummon = cmdParams[2]
	smntarget = "<me>"
	if tosummon=='atomos' then smntarget="<t>" end
	if tosummon == 'caitsith' then tosummon='cait sith' end
	if tosummon == 'lightspirit' then tosummon='light spirit' end
        if pet.isvalid and pet.name:lower()==tosummon then
		add_to_chat(122,cmdParams[2].." is already summoned!")
        elseif pet.isvalid then
		windower.send_command('input /ja Release <me>;wait 2;input /ma '..tosummon..' '..smntarget)
        else  
		windower.send_command('input /ma '..tosummon..' '..smntarget)
	end
        eventArgs.handled = true
    elseif cmdParams[1] == 'fleet_wind' then
        if pet.isvalid and pet.name:lower()=='garuda' then
		send_command('input /ma Fleet Wind <me>')
	elseif pet.isvalid then
		send_command('input /ja Release <me>;wait 1;input /ma Garuda <me>;wait 4;input /ma Fleet Wind <me>;wait 2')
	else
		send_command('input /ma Garuda <me>;wait 4;input /ma Fleet Wind <me>')
	end
    elseif cmdParams[1] == 'supportmode' then
	    send_command('input /ja "Light Arts";wait 1;input /ja "Sublimation";wait 1;input /ja "Addendum: White";wait 1;input /ma "Aurorastorm" <me>')
    elseif cmdParams[1] == 'nukemode' then
	    send_command('input /ja "Dark Arts";wait 1;input /ja "Sublimation";wait 1;input /ja "Addendum: Black";wait 1;input /ma "Firestorm" <me>')

    elseif cmdParams[1] == 'release' then
        set_macro_page(1,19)
	send_command('input /pet "Release" <me>')
    elseif cmdParams[1] == 'buffrotation' then
	    buffability,buffavatar = next(buffrotation[buffrotkey]) 
	    print (buffavatar)
	    if pet.isvalid and pet.name ~= buffavatar then
		    send_command('input /ja "Release" <me>;wait 1;input /ma "'..buffavatar..'" <me>;wait 5;input /ja "'..buffability..'"')
	    elseif not pet.isvalid then
		    send_command('input /ma "'..buffavatar..'" <me>;wait 5;input /ja "'..buffability..'"')
	    else
		    send_command('input /ja "'..buffability..'"')
	    end
	    buffrotkey = buffrotkey + 1
	    if buffrotkey >= buffrot_count then buffrotkey=0 end
    elseif cmdParams[1] == 'warpring' then
	    equip({left_ring="Warp Ring"})
	    send_command('wait 9;input /item "Warp Ring" <me>')
    elseif cmdParams[1] == 'toggle_hud' then
	    if display_hud==true then 
		    display_hud = false
		    window:hide()
		    images.hide(avatar_icon)
	    else 
		    display_hud=true
		    window:show()
		    images.show(avatar_icon)
	    end
    elseif cmdParams[1] == 'toggle_states' then
	    if display_states==true then 
		    display_states = false
	    else 
		    display_states=true
	    end
	    updatedisplay()
    elseif cmdParams[1] == 'force_hud_refresh' then
	    updatedisplay()
    elseif cmdParams[1] == 'toggle' and cmdParams[2]=='cpmode' then
	--logic is reversed b/c it's true/false and lags behind motes toggle since this is called first
	if state.cpmode.current ~= 'on' then 
		equip(sets.cpmode) 
		send_command('gs disable back')
	else
		send_command('gs enable back')
	end
    end
end
 
 
-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------
 
-- Cast the appopriate storm for the currently summoned avatar, if possible.
function handle_petweather()
    if player.sub_job ~= 'SCH' then
        add_to_chat(122, "You can not cast storm spells")
        return
    end
       
    if not pet.isvalid then
        add_to_chat(122, "You do not have an active avatar.")
        return
    end
   
    local element = pet.element
    if element == 'Thunder' then
        element = 'Lightning'
    end
   
--    if S{'Light','Dark','Lightning'}:contains(element) then
--        add_to_chat(122, 'You do not have access to '..elements.storm_of[element]..'.')
--        return
--    end
   
    local storm = elements.storm_of[element]
   
    if storm then
        send_command('@input /ma "'..elements.storm_of[element]..'" <me>')
    else
        add_to_chat(123, 'Error: Unknown element ('..tostring(element)..')')
    end
end
 
 
-- Custom uber-handling of Elemental Siphon
function handle_siphoning()
    if areas.Cities:contains(world.area) then
        add_to_chat(122, 'Cannot use Elemental Siphon in a city area.')
        return
    end
 
    local siphonElement
    local stormElementToUse
    local releasedAvatar
    local dontRelease
   
    -- If we already have a spirit out, just use that.
    if pet.isvalid and spirits:contains(pet.name) then
        siphonElement = pet.element
        dontRelease = true
        -- If current weather doesn't match the spirit, but the spirit matches the day, try to cast the storm.
        if player.sub_job == 'SCH' and pet.element == world.day_element and pet.element ~= world.weather_element then
--            if not S{'Light','Dark','Lightning'}:contains(pet.element) then
--                stormElementToUse = pet.element
--            end
	    stormElementToUse = pet.element
        end
    -- If we're subbing /sch, there are some conditions where we want to make sure specific weather is up.
    -- If current (single) weather is opposed by the current day, we want to change the weather to match
    -- the current day, if possible.
    elseif player.sub_job == 'SCH' and world.weather_element ~= 'None' then
        -- We can override single-intensity weather; leave double weather alone, since even if
        -- it's partially countered by the day, it's not worth changing.
        if get_weather_intensity() == 1 then
            -- If current weather is weak to the current day, it cancels the benefits for
            -- siphon.  Change it to the day's weather if possible (+0 to +20%), or any non-weak
            -- weather if not.
            -- If the current weather matches the current avatar's element (being used to reduce
            -- perpetuation), don't change it; just accept the penalty on Siphon.
            if world.weather_element == elements.weak_to[world.day_element] and
                (not pet.isvalid or world.weather_element ~= pet.element) then
                -- We can't cast lightning/dark/light weather, so use a neutral element
--                if S{'Light','Dark','Lightning'}:contains(world.day_element) then
--                    stormElementToUse = 'Wind'
--                else
--                    stormElementToUse = world.day_element
--                end
		stormElementToUse = world.day_element
            end
        end
    end
   
    -- If we decided to use a storm, set that as the spirit element to cast.
    if stormElementToUse then
        siphonElement = stormElementToUse
    elseif world.weather_element ~= 'None' and (get_weather_intensity() == 2 or world.weather_element ~= elements.weak_to[world.day_element]) then
        siphonElement = world.weather_element
    else
        siphonElement = world.day_element
    end
   
    local command = ''
    local releaseWait = 0
    local elementused = ''
   
    if pet.isvalid and avatars:contains(pet.name) then
        command = command..'input /pet "Release" <me>;wait 1.1;'
        releasedAvatar = pet.name
        releaseWait = 10
    end
   
    if stormElementToUse then
        command = command..'input /ma "'..elements.storm_of[stormElementToUse]..'" <me>;wait 5;'
        releaseWait = releaseWait - 4
	elementused = stormElementToUse
    end
   
    if not (pet.isvalid and spirits:contains(pet.name)) then
        command = command..'input /ma "'..elements.spirit_of[siphonElement]..'" <me>;wait 5;'
        releaseWait = releaseWait - 4
	elementused = siphonElement
    end
   
    command = command..'input /ja "Elemental Siphon" <me>;'
    releaseWait = releaseWait - 1
    releaseWait = releaseWait + 0.1
   
    if not dontRelease then
        if releaseWait > 0 then
            command = command..'wait '..tostring(releaseWait)..';'
        else
            command = command..'wait 1.1;'
        end
       
        command = command..'input /pet "Release" <me>;'
    end
   
    if releasedAvatar then
        command = command..'wait 1.1;input /ma "'..releasedAvatar..'" <me>'
    end
   
    send_command(command)
end
 
 
-- Handles executing blood pacts in a generic, avatar-agnostic way.
-- cmdParams is the split of the self-command.
-- gs c [pact] [pacttype]
function handle_pacts(cmdParams)
    if areas.Cities:contains(world.area) then
        add_to_chat(122, 'You cannot use pacts in town.')
        return
    end
 
    if not pet.isvalid then
        --add_to_chat(122,'No avatar currently available. Returning to default macro set.')
        return
    end
 
    if spirits:contains(pet.name) then
        add_to_chat(122,'Cannot use pacts with spirits.')
        return
    end
 
    if not cmdParams[2] then
        add_to_chat(123,'No pact type given.')
        return
    end
   
    local pact = cmdParams[2]:lower()
   
    if not pacts[pact] then
        add_to_chat(123,'Unknown pact type: '..tostring(pact))
        return
    end
   
    if pacts[pact][pet.name] then
        if pact == 'astralflow' and not buffactive['astral flow'] then
            add_to_chat(122,'Cannot use Astral Flow pacts at this time.')
            return
        end
       
        -- Leave out target; let Shortcuts auto-determine it.
        send_command('@input /pet "'..pacts[pact][pet.name]..'"')
    else
        add_to_chat(122,pet.name..' does not have a pact of type ['..pact..'].')
    end
end
 
function select_default_macro_book(reset)
    -- Default macro set/book
    set_macro_page(1, 19)
end
 
-- Event handler for updates to player skill, since we can't rely on skill being
-- correct at pet_aftercast for the creation of custom timers.
--windower.raw_register_event('incoming chunk',
--    function (id)
--        if id == 0x62 then
--            if wards.flag then
--                create_pact_timer(wards.spell)
--                wards.flag = false
--                wards.spell = ''
--            end
--        end
--    end)
 
-- Function to create custom timers using the Timers addon.  Calculates ward duration
-- based on player skill and base pact duration (defined in job_setup).
--function create_pact_timer(spell_name)
--    -- Create custom timers for ward pacts.
--    if wards.durations[spell_name] then
--        local ward_duration = wards.durations[spell_name]
--        if ward_duration < 181 then
--            local skill = player.skills.summoning_magic
--            if skill > 300 then
--                skill = skill - 300
--                --if skill > 200 then skill = 200 end
--                ward_duration = ward_duration + skill
--            end
--        end
--       
--        local timer_cmd = 'timers c "'..spell_name..'" '..tostring(ward_duration)..' down'
--       
--        if wards.icons[spell_name] then
--            timer_cmd = timer_cmd..' '..wards.icons[spell_name]
--        end
-- 
--        send_command(timer_cmd)
--    end
--end
 
-- Select default macro book on initial load or subjob change.
--windower.raw_register_event('mouse', function(type, x, y, delta, blocked)
--    if type == 2 then
--	    updatedisplay()
--    end
--end)

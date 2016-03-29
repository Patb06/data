
include('organizer-lib')
function set_macros(sheet,book)
    if book then 
        send_command('@input /macro book '..tostring(book)..';wait .1;input /macro set '..tostring(sheet))
        return
    end
    send_command('@input /macro set '..tostring(sheet))
end
 
function set_style(sheet)
    send_command('@input /lockstyleset '..sheet)
end
 
bp_physical=S{'Punch','Rock Throw','Barracuda Dive','Claw','Axe Kick','Shock Strike','Camisado','Regal Scratch','Poison Nails','Moonlit Charge','Crescent Fang','Rock Buster','Tail Whip','Double Punch','Megalith Throw','Double Slap','Eclipse Bite','Mountain Buster','Spinning Dive','Predator Claws','Rush','Chaotic Strike','Crag Throw','Volt Strike'}bp_hybrid=S{'Burning Strike','Flaming Crush'}bp_magical=S{'Inferno','Earthen Fury','Tidal Wave','Aerial Blast','Diamond Dust','Judgment Bolt','Searing Light','Howling Moon','Ruinous Omen','Fire II','Stone II','Water II','Aero II','Blizzard II','Thunder II','Thunderspark','Somnolence','Meteorite','Fire IV','Stone IV','Water IV','Aero IV','Blizzard IV','Thunder IV','Nether Blast','Meteor Strike','Geocrush','Grand Fall','Wind Blade','Heavenly Strike','Thunderstorm','Level ? Holy','Holy Mist','Lunar Bay','Night Terror','Conflagration Strike'}bp_debuff=S{'Lunar Cry','Mewing Lullaby','Nightmare','Lunar Roar','Slowga','Ultimate Terror','Sleepga','Eerie Eye','Tidal Roar','Diamond Storm','Shock Squall','Pavor Nocturnus'}bp_buff=S{'Shining Ruby','Frost Armor','Rolling Thunder','Crimson Howl','Lightning Armor','Ecliptic Growl','Hastega','Noctoshield','Ecliptic Howl','Dream Shroud','Earthen Armor','Fleet Wind','Inferno Howl','Soothing Ruby','Heavenward Howl','Soothing Current','Hastega II','Crystal Blessing'}bp_other=S{'Healing Ruby','Raise II','Aerial Armor','Reraise II','Whispering Wind','Glittering Ruby','Earthen Ward','Spring Water','Healing Ruby II'} AvatarList=S{'Shiva','Ramuh','Garuda','Leviathan','Diabolos','Titan','Fenrir','Ifrit','Carbuncle','Fire Spirit','Air Spirit','Ice Spirit','Thunder Spirit','Light Spirit','Dark Spirit','Earth Spirit','Water Spirit','Cait Sith','Alexander','Odin','Atomos'}spirit_element={Fire='Fire Spirit',Earth='Earth Spirit',Water='Water Spirit',Wind='Air Spirit',Ice='Ice Spirit',Lightning='Thunder Spirit',Light='Light Spirit',Dark='Dark Spirit'}spirit_conflict={Fire='Ice',Earth='Lightning',Water='Fire',Wind='Earth',Ice='Wind',Lightning='Water',Light='Dark',Dark='Light'}

smnskillstaff = { name="Espiritus", augments={'Summoning magic skill +15','Pet: Mag. Acc.+30','System: 2 ID: 153 Val: 3',}}
bpmagicstaff = { name="Espiritus", augments={'MP+50','Pet: "Mag.Atk.Bns."+20','Pet: Mag. Acc.+20',}}
avatarattackstaff = { name="Espiritus", augments={'System: 2 ID: 136 Val: 14','Pet: Attack+25','System: 2 ID: 152 Val: 3',}}
set_macros(1,19) -- Sheet, Book
 
function get_sets()
 
    -- My formatting is very easy to follow. All sets that pertain to my character doing things are under 'me'.
    -- All sets that are equipped to faciliate my avatar's behaviour or abilities are under 'avatar', eg, Perpetuation, Blood Pacts, etc
     
    sets.me = {}
    sets.avatar = {}
     
    -- Your idle set when you DON'T have an avatar out
    sets.me.idle = {
        main="Bolelabunga",
        sub="Genbu's Shield",
        ranged="",
        ammo="Seraphicaller",
        head="Beckoner's Horn",
        neck="Wiglen Gorget",
        lear="Gifted Earring",
        rear="Evans Earring",
        body="Shomonjijoe +1",
        hands="Serpentes Cuffs",
        lring="Evoker's Ring",
        rring="Fervor Ring",
        back="Mecistopins Mantle",
        waist="",
        legs="Assiduity Pants",
        feet="Herald's Gaiters"
    }
     
    -- Your MP Recovered Whilst Resting Set
    sets.me.resting = { 
        main="Bolelabunga",
        sub="Genbu's Shield",
        ranged="",
        ammo="Seraphicaller",
        head="Beckoner's Horn",
        neck="Wiglen Gorget",
        lear="Gifted Earring",
        rear="Evans Earring",
        body="Shomonjijoe +1",
        hands="Serpentes Cuffs",
        lring="Evoker's Ring",
        rring="Fervor Ring",
        back="Conveyance Cape",
        waist="",
        legs="Assiduity Pants",
        feet="Serpentes Sabots"
    }
     
    -----------------------
    -- Perpetuation Related
    -----------------------
     
    -- Avatar's Out --  
    -- This is the base for all perpetuation scenarios, as seen below
    sets.avatar.perp = {
        main="Gridarvor",
        sub="Vox Grip",
        ranged="",
        ammo="Seraphicaller",
        head="Beckoner's Horn",
        neck="Caller's Pendant",
        lear="Gifted Earring",
        rear="Evans Earring",
        body="Shomonjijoe +1",
        hands="Serpentes Cuffs",
        lring="Evoker's Ring",
        rring="Fervor Ring",
        back="Mecistopins Mantle",
        waist="Moepapa Stone",
        legs="Assiduity Pants",
        feet="Apogee Pumps"
    }
 
    -- The following sets base off of perpetuation, so you can consider them idle sets.
    -- Set the relevant gear, bearing in mind it will overwrite the perpetuation item for that slot!
     
    -- When we want our avatar to stay alive
    sets.avatar.tank = set_combine(sets.avatar.perp,{
        main="Gridarvor",
        sub="Vox Grip",
        ranged="",
        ammo="Seraphicaller",
        head="Beckoner's Horn",
        neck="Caller's Pendant",
        lear="Handler's Earring",
        rear="Handler's Earring +1",
        body="Shomonjijoe +1",
        hands="Serpentes Cuffs",
        lring="Evoker's Ring",
        rring="Fervor Ring",
        back="Conveyance Cape",
        waist="Moepapa Stone",
        legs={ name="Helios Spats", augments={'Pet: "Mag.Atk.Bns."+23','Pet: Crit.hit rate +3','Blood Pact Dmg.+7',}},
        feet="Herald's Gaiters"
    })
     
    -- When we want our avatar to shred
    sets.avatar.melee = set_combine(sets.avatar.perp,{
        main="Gridarvor",
        sub="",
        ranged="",
        ammo="",
        head="",
        neck="",
        lear="",
        rear="",
        body="",
        hands="",
        lring="",
        rring="",
        back="",
        waist="",
        legs="",
        feet=""
    })
     
    -- When we want our avatar to hit
    sets.avatar.acc = set_combine(sets.avatar.perp,{
        main="Gridarvor",
        sub="",
        ranged="",
        ammo="",
        head="",
        neck="",
        lear="",
        rear="",
        body="",
        hands="Summoner's Bracers +2",
        lring="",
        rring="",
        back="Samanisi Cape",
        waist="",
        legs="",
        feet=""
    })
     
    -- When Avatar's Favori s active
    sets.avatar.favor = set_combine(sets.avatar.perp,{
        main=smnskillstaff,
        sub="Vox Grip",
        ranged="",
        ammo="Seraphicaller",
        head="Beckoner's Horn",
        neck="Incanter's Torque",
        lear="Gifted Earring",
        rear="Evans Earring",
        body="Shomonjijoe +1",
        hands="Serpentes Cuffs",
        lring="Evoker's Ring",
        rring="Fervor Ring",
        back="Conveyance Cape",
        waist="Moepapa Stone",
        legs={ name="Helios Spats", augments={'Pet: "Mag.Atk.Bns."+23','Pet: Crit.hit rate +3','Blood Pact Dmg.+7',}},
        feet="Apogee Pumps"
    })
     
    ----------------------------
    -- Summoning Skill Related
    -- Including all blood pacts
    ----------------------------
     
    -- + Summoning Magic. This is a base set for max skill and blood pacts and we'll overwrite later as and when we need to
    sets.avatar.skill = {
        main=smnskillstaff,
        sub="Vox Grip",
        ranged="",
        ammo="Seraphicaller",
        head="Beckoner's Horn",
        neck="Incanter's Torque",
        lear="Gifted Earring",
        rear="Evans Earring",
        body="Beckoner's Doublet",
        hands="Summoner's Bracers +2",
        lring="Evoker's Ring",
        rring="Fervor Ring",
        back="Conveyance Cape",
        waist="Jaq'ij Sash",
        legs="Assiduity Pants",
        feet="Apogee Pumps"
    }
     
    -------------------------
    -- Individual Blood Pacts
    -------------------------
     
    -- Physical damage
    sets.avatar.atk = set_combine(sets.avatar.skill,{
        main="Gridarvor",
        sub="Vox Grip",
        ranged="",
        ammo="Seraphicaller",
        head="Merlinic Hood",
        neck="Eidolon Pendant +1",
        lear="Evans Earring",
        rear="Gelos Earring",
        body="Beckoner's Doublet",
        hands="Merlinic Dastanas",
        lring="Thurandaut Ring",
        rring="Evoker's Ring",
        back={ name="Conveyance Cape", augments={'Summoning magic skill +2','Pet: Enmity+11','Blood Pact Dmg.+5',}},
        waist="Mujin Obi",
        legs={ name="Helios Spats", augments={'Pet: "Mag.Atk.Bns."+23','Pet: Crit.hit rate +3','Blood Pact Dmg.+7',}},
        feet="Apogee Pumps"
    })
     
    -- Magic Attack
    sets.avatar.mab = set_combine(sets.avatar.skill,{
        main=bpmagicstaff,
        sub="Vox Grip",
        ranged="",
        ammo="Seraphicaller",
        head="Merlinic Hood",
        neck="Eidolon Pendant +1",
        lear="Evans Earring",
        rear="Gelos Earring",
        body="Beckoner's Doublet",
        hands="Merlinic Dastanas",
        lring="Fervor Ring",
        rring="Speaker's Ring",
        back={ name="Conveyance Cape", augments={'Summoning magic skill +2','Pet: Enmity+11','Blood Pact Dmg.+5',}},
        waist="Mujin Obi",
        legs="Enticer's Pants",
        feet="Apogee Pumps"
    })
 
    -- Hybrid
    sets.avatar.hybrid = set_combine(sets.avatar.skill,{
        main=Gridarvor,
        sub="Vox Grip",
        ranged="",
        ammo="Seraphicaller",
        head="Merlinic Hood",
        neck="Eidolon Pendant +1",
        lear="Evans Earring",
        rear="Gelos Earring",
        body="Beckoner's Doublet",
        hands="Merlinic Dastanas",
        lring="Speaker's Ring",
        rring="Thurandaut Ring",
        back={ name="Conveyance Cape", augments={'Summoning magic skill +2','Pet: Enmity+11','Blood Pact Dmg.+5',}},
        waist="Mujin Obi",
        legs="Apogee Slacks",
        feet="Apogee Pumps"
    })
     
    -- Magic Accuracy
    sets.avatar.macc = set_combine(sets.avatar.skill,{
        main=bpmagicstaff,
        sub="Vox Grip",
        ranged="",
        ammo="Seraphicaller",
        head="Merlinic Hood",
        neck="Caller's Pendant",
        lear="Evans Earring",
        rear="Gelos Earring",
        body="Beckoner's Doublet",
        hands="Merlinic Dastanas",
        lring="Fervor Ring",
        rring="Speaker's Ring",
        back={ name="Conveyance Cape", augments={'Summoning magic skill +2','Pet: Enmity+11','Blood Pact Dmg.+5',}},
        waist="Mujin Obi",
        legs="Apogee Slacks",
        feet="Apogee Pumps"
    })
     
    -- Buffs
    sets.avatar.buff = set_combine(sets.avatar.skill,{
        main="smnskillstaff",
        sub="",
        ranged="",
        ammo="",
        head="",
        neck="",
        lear="",
        rear="",
        body="",
        hands="",
        lring="",
        rring="",
        back="",
        waist="",
        legs="",
        feet=""
    })
     
    -- Other
    sets.avatar.other = set_combine(sets.avatar.skill,{
        main="",
        sub="",
        ranged="",
        ammo="",
        head="",
        neck="",
        lear="",
        rear="",
        body="",
        hands="",
        lring="",
        rring="",
        back="",
        waist="",
        legs="",
        feet=""
    })
     
    -- Combat Related Sets
     
    -- Melee
    -- The melee set combines with perpetuation, because we don't want to be losing all our MP whilst we swing our Staff
    -- Anything you equip here will overwrite the perpetuation/refresh in that slot.
    sets.me.melee = set_combine(sets.avatar.perp,{
        main="",
        sub="",
        ranged="",
        ammo="",
        head="",
        neck="",
        lear="",
        rear="",
        body="",
        hands="",
        lring="",
        rring="",
        back="",
        waist="",
        legs="",
        feet=""
    })
     
    -- Shattersoul. Weapon Skills do not work off perpetuation as it only stays equipped for a moment
    sets.me["Shattersoul"] = {
        main="",
        sub="",
        ranged="",
        ammo="",
        head="",
        neck="",
        lear="",
        rear="",
        body="",
        hands="",
        lring="",
        rring="",
        back="",
        waist="",
        legs="",
        feet=""
    }
    sets.me["Garland of Bliss"] = {
        main="",
        sub="",
        ranged="",
        ammo="",
        head="",
        neck="",
        lear="",
        rear="",
        body="",
        hands="",
        lring="",
        rring="",
        back="",
        waist="",
        legs="",
        feet=""
    }
     
    -- Feel free to add new weapon skills, make sure you spell it the same as in game. These are the only two I ever use though
 
    ---------------
    -- Casting Sets
    ---------------
     
    sets.precast = {}
    sets.midcast = {}
    sets.aftercast = {}
     
    ----------
    -- Precast
    ----------
     
    -- Generic Casting Set that all others take off of. Here you should add all your fast cast  
    sets.precast.casting = {
        main="Malevolence",
        sub="",
        ranged="",
        ammo="",
        head="Nahtirah Hat",
        neck="",
        lear="Loquacious Earring",
        rear="",
        body="",
        hands="Bokwus Gloves",
        lring="",
        rring="",
        back="Ogapepo Cape",
        waist="",
        legs="Hagondes Pants +1",
        feet="Bukwus Boots"
    }   
     
    -- Summoning Magic Cast time - gear
    sets.precast.summoning = {
        main="Malevolence",
        sub="",
        ranged="",
        ammo="",
        head="Nahtirah Hat",
        neck="",
        lear="Loquacious Earring",
        rear="",
        body="",
        hands="Bokwus Gloves",
        lring="",
        rring="",
        back="Ogapepo Cape",
        waist="",
        legs="Hagondes Pants +1",
        feet="Bukwus Boots"
    }   
     
    -- Enhancing Magic, eg. Siegal Sash, etc
    sets.precast.enhancing = {
        main="Malevolence",
        sub="",
        ranged="",
        ammo="",
        head="Nahtirah Hat",
        neck="",
        lear="Loquacious Earring",
        rear="",
        body="",
        hands="Bokwus Gloves",
        lring="",
        rring="",
        back="Ogapepo Cape",
        waist="",
        legs="Hagondes Pants +1",
        feet="Bukwus Boots"
    }   
 
    -- Stoneskin casting time -, works off of enhancing -
    sets.precast.stoneskin = {
        main="Malevolence",
        sub="",
        ranged="",
        ammo="",
        head="Nahtirah Hat",
        neck="",
        lear="Loquacious Earring",
        rear="",
        body="",
        hands="Bokwus Gloves",
        lring="",
        rring="",
        back="Ogapepo Cape",
        waist="",
        legs="Hagondes Pants +1",
        feet="Bukwus Boots"
    }   
     
    -- Curing Precast, Cure Spell Casting time -
    sets.precast.cure = {
        main="Malevolence",
        sub="",
        ranged="",
        ammo="",
        head="Nahtirah Hat",
        neck="",
        lear="Loquacious Earring",
        rear="",
        body="",
        hands="Bokwus Gloves",
        lring="",
        rring="",
        back="Ogapepo Cape",
        waist="",
        legs="Hagondes Pants +1",
        feet="Bukwus Boots"
    }   
     
    ---------------------
    -- Ability Precasting
    ---------------------
     
    -- Blood Pact Ability Delay
    sets.precast.bp = {
        main="Espiritus",
        sub="Vox Grip",
        ranged="",
        ammo="Seraphicaller",
        head="Summoner's Horn",
        neck="",
        lear="",
        rear="Evans Earring",
        body="Glyphic Doublet +1",
        hands="Glyphic Bracers",
        lring="",
        rring="",
        back={ name="Conveyance Cape", augments={'Summoning magic skill +2','Blood Pact Dmg.+1','Blood Pact ab. del. II -3',}},
        waist="",
        legs="",
        feet="Glyphic Pigaches"
    }
     
    -- Mana Cede
    sets.precast["Mana Cede"] = {
        main="",
        sub="",
        ranged="",
        ammo="",
        head="",
        neck="",
        lear="",
        rear="",
        body="",
        hands="",
        lring="",
        rring="",
        back="",
        waist="",
        legs="",
        feet=""
    }
     
    -- Astral Flow  
    sets.precast["Astral Flow"] = {
        main="",
        sub="",
        ranged="",
        ammo="",
        head="",
        neck="",
        lear="",
        rear="",
        body="",
        hands="",
        lring="",
        rring="",
        back="",
        waist="",
        legs="",
        feet=""
    }
     
    -- Elemental Siphon, eg, Tatsumaki Thingies, Esper Stone, etc
    sets.precast.siphon = set_combine(sets.avatar.skill,{
        main="",
        sub="",
        ranged="",
        ammo="Esper Stone +1",
        head="",
        neck="",
        lear="",
        rear="",
        body="Telchine Chasuble",
        hands="",
        lring="",
        rring="",
        back="",
        waist="",
        legs="",
        feet="Beckoner's Pigaches +1"
    })
     
    ----------
    -- Midcast
    ----------
     
    -- We handle the damage and etc. in Pet Midcast later
     
    -- Whatever you want to equip mid-cast as a catch all for all spells, and we'll overwrite later for individual spells
    sets.midcast.casting = {
        main="",
        sub="",
        ranged="",
        ammo="",
        head="",
        neck="Incanter's Torque",
        lear="",
        rear="",
        body="",
        hands="",
        lring="",
        rring="",
        back="",
        waist="",
        legs="",
        feet=""
    }
     
    -- Enhancing
    sets.midcast.enhancing = set_combine(sets.midcast.casting,{
        main="",
        sub="",
        ranged="",
        ammo="",
        head="",
        neck="Incanter's Torque",
        lear="",
        rear="",
        body="",
        hands="",
        lring="",
        rring="",
        back="",
        waist="",
        legs="",
        feet=""
    })
     
    -- Stoneskin
    sets.midcast.stoneskin = set_combine(sets.midcast.enhancing,{
        main="",
        sub="",
        ranged="",
        ammo="",
        head="Umuthi Hat",
        neck="Incanter's Torque",
        lear="",
        rear="",
        body="",
        hands="",
        lring="",
        rring="",
        back="",
        waist="",
        legs="",
        feet=""
    })
     
    -- Cure Potency
    sets.midcast.cure = set_combine(sets.midcast.casting,{
        main="Tamaxchi",
        sub="Genbu's Shield",
        lear="",
		head="Nahtirah Hat",
		neck="Incanter's Torque",
		ear2="Loquacious Earring",
		body="Heka's Kalasiris",
		hands="Bokwus Gloves",
		ring1="Prolix Ring",
		ring2="Sirona's Ring",
		back="Swith Cape +1",
		waist="Witful Belt",
		legs="Hagondes Pants",
		feet="Hagondes Sabots"
    })
     
    ------------
    -- Aftercast
    ------------
     
    -- I don't use aftercast sets, as we handle what to equip later depending on conditions using a function, eg, do we have an avatar out?
 
end
 
function precast(spell)
 
    -- Don't swap if we're in the middle of something or our pet's doing something
    -- Stops macro spam from interfering with an action GS is already handling
    if midaction() or pet_midaction() then
        return
    end
     
    -- If we're doing a blood pact, equip our delay set IF Apogee or Astral Conduit are not active
    if (spell.type == 'BloodPactRage' or spell.type == 'BloodPactWard') and not (buffactive['Astral Conduit'] or buffactive['Apogee']) then
     
        equip(sets.precast.bp)
         
    elseif spell.type == 'SummonerPact' then
     
        -- This chunk of code handles Elemental Siphon. It will look at the current day and weather and cancel the spell to summon
        -- the right elemental. Your elemental siphon macro should summon a Dark Spirit to trigger this check
         
        -- These use the included lists in global.lua to determine the right spirit to summon
             
        if spell.name == 'Dark Spirit' then
            if world.weather_element == 'Dark' then
             
                -- Dark Weather is active, lets the spell go ahead and equips summoning precast
                equip(sets.precast.summoning)
                 
            elseif world.weather_element ~= 'None' and spirit_conflict[world.day_element] ~= world.weather_element then
             
                -- It's not dark weather but there is some weather up, cancels dark and summons the right spirit
                cancel_spell()
                send_command('input /ma "%s" <me>':format(spirit_element[world.weather_element]))
                equip(sets.precast.summoning)
                 
            elseif world.day_element == 'Dark' then
             
                -- It's darksday so allow the dark spirit to go ahead and equip summoning
                equip(sets.precast.summoning)
                 
            else
             
                -- There is no weather up and it's not darksday, so summon the current day's spirit
                cancel_spell()              
                send_command('input /ma "%s" <me>':format(spirit_element[world.day_element]))
                equip(sets.precast.summoning)
                 
            end
        else
         
            -- We're not summoning Dark Spirit, so we don't want to Siphon, which means we're summoning an avatar
            equip(sets.precast.summoning)
             
        end
         
    -- Moving on to other types of magic
    elseif spell.type == 'WhiteMagic' or spell.type == 'BlackMagic' then
     
        -- Stoneskin Precast
        if spell.name == 'Stoneskin' then
         
            windower.ffxi.cancel_buff(37)--[[Cancels stoneskin, not delayed incase you get a Quick Cast]]
            equip(sets.precast.stoneskin)
             
        -- Cure Precast
        elseif spell.name:match('Cure') or spell.name:match('Cura') then
         
            equip(sets.precast.cure)
             
        -- Enhancing Magic
        elseif spell.skill == 'Enhancing Magic' then
         
            equip(sets.precast.enhancing)
             
            if spell.name == 'Sneak' then
                windower.ffxi.cancel_buff(71)--[[Cancels Sneak]]
            end
        else
         
            -- For everything else we go with max fastcast
            equip(sets.precast.casting)
             
        end
         
    -- Summoner Abilities
    -- We use a catch all here, if the set exists for an ability, use it
    -- This way we don't need to write a load of different code for different abilities, just make a set
     
    elseif sets.precast[spell.name] then
        equip(sets.precast[spell.name])
    end
     
end
 
function midcast(spell)
 
    -- If our pet is doing something, prevents us swapping equipment too early
    if pet_midaction() then
        return
    end
     
    -- No need to annotate all this, it's fairly logical. Just equips the relevant sets for the relevant magic
    if spell.type == 'WhiteMagic' or spell.type == 'BlackMagic' then
        if spell.name == 'Stoneskin' then
            equip(sets.midcast.stoneskin)
        elseif spell.name:match('Cure') or spell.name:match('Cura') then
            equip(sets.midcast.cure)
        elseif spell.skill == 'Enhancing Magic' then
            equip(sets.midcast.enhancing)
            if spell.name:match('Protect') or spell.name:match('Shell') then
                equip({rring="Sheltered Ring"})
            end
        else
            equip(sets.midcast.casting)
        end
    elseif spell.name == 'Elemental Siphon' then
     
        -- Siphon Set
        equip(sets.midcast.siphon)
         
        -- Checks if pet matches weather
        if pet.element == world.weather_element then
            equip(sets.midcast.siphon,{main="Chatoyant Staff"--[[Take advantage of the weather boost]]})
        end
         
    -- And our catch all, if a set exists for this spell use it
    elseif sets.midcast[spell.name] then
        equip(sets.midcast[spell.name])
         
    -- Remember those WS Sets we defined? :)
    elseif sets.me[spell.name] then
        equip(sets.me[spell.name])
    end
end
 
function aftercast(spell)
 
    -- If our pet's doing something, Stop!
    if pet_midaction() then
        return
    end 
     
    -- If not a blood pact or summon
    if spell and (not spell.type or not string.find(spell.type,'BloodPact') and not AvatarList:contains(spell.name) or spell.interrupted) then
     
        -- Then initiate idle function to check which set should be equipped
        idle(pet)
         
    end
end
 
function pet_midcast(spell)
 
    -- Our pet is doing something
    if spell.type=='BloodPactRage' then
     
        -- We're going to check the lists in global.lua for matches and equip the relevant sets
         
        if bp_physical:contains(spell.name) then
         
            equip(sets.avatar.atk)
             
        elseif bp_hybrid:contains(spell.name) then
         
            equip(sets.avatar.hybrid)
            if pet.name == 'Ifrit' then
                equip({rring="Fervor Ring"})--[[Change rring to lring if you put Evoker's on your right hand]]
            end
             
        elseif bp_magical:contains(spell.name) then
         
            equip(sets.avatar.mab)
            if pet.name == 'Ifrit' then
                equip({rring="Fervor Ring"})--[[Change rring to lring if you put Evoker's on your right hand]]
            end
 
        elseif bp_debuff:contains(spell.name) then
         
            equip(sets.avatar.macc)
             
        elseif bp_buff:contains(spell.name) then
         
            equip(sets.avatar.buff)
             
        elseif bp_other:contains(spell.name) then
         
            equip(sets.avatar.other)
             
        elseif spell.name == 'Perfect Defense' then
         
            equip(sets.avatar.skill)
             
        else
         
            equip(sets.avatar.skill)
             
        end
    end 
end
 
function pet_aftercast(spell)
     
    -- Pet aftercast is simply a check for whether Conduit and Apogee are up, and then a call to our aftercast function
    -- We have a variable called autobp that we set to true or false with commands to auto repeat BPs for us
    if (buffactive['Apogee'] or buffactive['Astral Conduit']) and autobp then
        send_command('input /pet "%s" <t>':format(spell.name))
        return
    end
     
    idle(pet)
     
end
 
function idle(pet)
 
    -- This function is called after every action, and handles which set to equip depending on what we're doing
    -- We check if we're meleeing because we don't want to idle in melee gear when we're only engaged for trusts
     
    if meleeing and player.status=='Engaged' then
     
        -- We're both engaged and meleeing
        equip(sets.me.melee)
         
    elseif pet.isvalid then
         
        -- We have a pet out but we're not meleeing, set the right idle set
        equip(sets.avatar[mode])
 
    else
     
        -- We're not meleeing and we have no pet out
        equip(sets.me.idle)
         
    end
end
 
function status_change(new,old)
    if new == 'Engaged' then
     
        -- If we engage check our meleeing status
        idle(pet)
         
    elseif new=='Resting' then
     
        -- We're resting
        equip(sets.me.resting)
    end
end
 
function pet_change(pet,gain)
 
    -- When we summon or release an avatar
    idle(pet)
 
end
 
 
function self_command(command)
 
    local commandArgs = command
     
    -- This command takes //gs c avatar mode, where mode is what you want, eg, tank, acc, melee, etc
    if #commandArgs:split(' ') >= 2 then
        commandArgs = T(commandArgs:split(' '))
        if commandArgs[1] == 'avatar' then
            if commandArgs[2] then
                mode = tostring(commandArgs[2])
                equip(sets.avatar[mode])
                windower.add_to_chat(8,'----- Avatar set to '..mode..' mode! -----')
            end
        elseif commandArgs[1] == 'toggle' then
            if commandArgs[2] == 'auto' then
             
                -- //gs c toggle auto will toggle auto blood pacts on and off. Auto blood pact will make your GS repeat BPs under Apogee or Conduit
                -- And by repeat I mean repeat. If Conduit is up, it will SPAM the BP until Conduit is down
                if autobp then
                    autobp = false
                    windower.add_to_chat(8,'----- Auto BP mode Disabled -----')
                else
                    autobp = true
                    windower.add_to_chat(8,'----- Auto BP mode Enabled -----')
                end
            elseif commandArgs[2] == 'melee' then
             
                -- //gs c toggle melee will toggle melee mode on and off.
                -- This basically locks the slots that will cause you to lose TP if changing them,
                -- As well as equip your melee set if you're engaged
 
                if meleeing then
                    meleeing = false
                    enable('main','sub','ranged')
                    windower.add_to_chat(8,'----- Weapons Unlocked, WILL LOSE TP -----')
                    idle(pet)
                else
                    meleeing=true
                    disable('main','sub','ranged')
                    windower.add_to_chat(8,'----- Weapons Locked, WILL NOT LOSE TP -----')
                    idle(pet)
                end
                 
            elseif commandArgs[2] == 'favor' then
                     
                -- //gs c toggle favor will toggle Favor mode on and off.
                -- It won't automatically toggle, as some people like having favor active without the gear swaps for maximum effectiveness
                -- You need to toggle prioritisation yourself
                if favor then
                    favor = false
                    windower.add_to_chat(8,"----- Avatar's Favor Mode OFF -----")
                else
                    favor = true
                    windower.add_to_chat(8,"----- Avatar's Favor Mode ON -----")
                end
                 
            end
        end
    end
end
 
-- Required variables and their initial value
meleeing = false
autobp = false
favor = false
mode = "perp"
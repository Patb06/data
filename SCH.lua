include('organizer-lib')
function get_sets()
       
                --Idle Sets--
                sets.Idle = {}
               
                sets.Idle.Standard = {main="Akademos",sub="Niobid Strap",range="Kalboron Stone",
                                      head="Befouled Crown",neck="Twilight torque",ear1="Moonshade earring",ear2="Ethereal earring",
                                      body="Amalric Doublet",hands="Serpentes cuffs",ring1="Defending Ring",ring2="Dark ring",
                                      back="Mecistopins Mantle",waist="Porous Rope",legs="Assiduity pants +1",feet="Herald's Gaiters"}
                                                         
                sets.Idle.Sublimation = {main="Akademos",sub="Niobid Strap",range="Kalboron Stone",
                                        head="Scholar's M.board",neck="Twilight torque",ear1="Moonshade earring",ear2="Savant's earring",                               
										body="Argute gown",hands="Serpentes cuffs",ring1="Tamas ring",ring2="Maquette ring",
                                        back="Mecistopins Mantle",waist="Porous Rope",legs="Hagondes pants",feet="Herald's Gaiters"}
               
                sets.Idle.Sandstorm = {main="Akademos",sub="Niobid Strap",range="Kalboron Stone",
                                       head="Befouled Crown",neck="Twilight torque",ear1="Moonshade earring",ear2="Ethereal earring",
                                       body="Amalric Doublet",hands="Serpentes cuffs",ring1="Tamas ring",ring2="Maquette ring",
                                       back="Umbra cape",waist="Porous Rope",legs="Hagondes pants",feet="Herald's Gaiters"}
                                                                 
                sets.Idle.SublimationSandstorm = {main="Akademos",sub="Niobid Strap",range="Kalboron Stone",
                                                  head="Scholar's M.board",neck="Twilight torque",ear1="Moonshade earring",ear2="Savant's earring",
                                                  body="Argute gown",hands="Serpentes cuffs",ring1="Tamas ring",ring2="Maquette ring",
                                                  back="Umbra cape",waist="Porous Rope",legs="Hagondes pants",feet="Herald's Gaiters"}
               
               
               
               
               
               
                --Precast Sets--
                sets.Precast = {}
               
                sets.Precast.FC = {}
               
                sets.Precast.FC.Standard = {ammo="Incantor stone",
											head="Nahtirah Hat",
                                            ear1="Loquac. earring",
                                            hands="Gendewitha gages",ring1="Prolix ring",
                                            back="Swith cape",waist="Witful belt",legs="Orvail pants +1",feet="Argute loafers +2"}
                                                                       
                sets.Precast.FC.Cures = {ammo="Incantor Stone",
										 head="Nahtirah Hat",
                                         ear1="Nourishing Earring", ear2="Nourishing Earring +1",
                                         body="Nefer kalasiris",hands="Gendewitha gages",ring1="Prolix ring",
                                         back="Pahtli cape",waist="Witful belt",legs="Doyen Pants",feet="Argute loafers +2"}
                                                                 
                sets.Precast.JA = {}
               
                sets.Precast.JA.PenuryParsimony = {legs="Savant's pants +1"}
               
                sets.Precast.JA.ImmanencePerpetuation = {hands="Svnt. Bracers +1"}
               
                sets.Precast.JA.EbullienceRapture = {head="Arbatel Bonnet"}
               
               
               
               
               
               
                --Midcast Sets--
                sets.Midcast = {}
               
                sets.Midcast.Cures = {main="Tamaxchi",sub="Sors Shield",ammo="Clarus stone",
                                      head="Gende. caubeen", neck="Incanter's torque",ear1="Nourishing Earring",ear2="Nourishing Earring +1",
                                      body="heka's kalasiris",hands="Bokwus gloves",ring1="Ephedra ring",ring2="Sirona's ring",
                                      back="Tempered cape",waist="Porous Rope",legs="Scholar's pants",feet="Argute loafers +2"}
                                                         
                sets.Midcast.LowNukes = {
    main="Akademos",
    sub="Niobid Strap",
    ammo="ghastly tathlum",
    head="Merlinic Hood",
    body={ name="Amalric Doublet", augments={'MP+60','Mag. Acc.+15','"Mag.Atk.Bns."+15',}},
    hands="Amalric Gages",
    legs="Gyve Trousers",
    feet="Arbatel Loafers +1",
    neck="Eddy Necklace",
    waist="Porous Rope",
    left_ear="Friomisi Earring",
    right_ear="Hecate's Earring",
    left_ring="shiva Ring",
    right_ring="Acumen Ring",
    back="Toro Cape",
}
               
                sets.Midcast.HighNukes = { main="Akademos",
										sub="Niobid Strap",
										ammo="ghastly tathlum",
										head="Merlinic Hood",
										body={ name="Amalric Doublet", augments={'MP+60','Mag. Acc.+15','"Mag.Atk.Bns."+15',}},
										hands="Amalric Gages",
										legs="Gyve Trousers",
										feet="Tutyr Sabots",
										neck="Mizukage-no-Kubikazari",
										waist="Porous Rope",
										left_ear="Friomisi Earring",
										right_ear="Hecate's Earring",
										left_ring="Mujin Band",
										right_ring="Locus Ring",
										back="Seshaw Cape",
										}
										
				sets.Midcast.Helix = { main="Akademos",
										sub="Niobid Strap",
										ammo="ghastly tathlum",
										head="Merlinic Hood",
										body={ name="Amalric Doublet", augments={'MP+60','Mag. Acc.+15','"Mag.Atk.Bns."+15',}},
										hands="Amalric Gages",
										legs="Gyve Trousers",
										feet="Tutyr Sabots",
										neck="Mizukage-no-Kubikazari",
										waist="Porous Rope",
										left_ear="Friomisi Earring",
										right_ear="Hecate's Earring",
										left_ring="Mujin Band",
										right_ring="Locus Ring",
										back="Seshaw Cape",						
                                        }                   
                                                                 
                sets.Midcast.Stun = {main="Akademos",sub="Mephitis grip",ammo="Incantor stone",
                                     head="Zelus tiara",neck="Aesir torque",ear1="Psystorm earring",ear2="Lifestorm earring",
                                     body="Amalric Doublet",hands="Gendewitha gages",ring1="Maquette ring",ring2="Balrahn's ring",
                                     back="Swith cape",waist="Witful belt",legs="Orvail pants +1",feet="Argute loafers +2"}
                                                         
                sets.Midcast.Enhancing = {ammo="Savant's treatise",
                                          head="Befouled Crown",neck="Incanter's torque",ear1="Loquac. earring",
                                          body="Argute gown",
                                          back="Merciful cape",waist="Porous Rope",legs="Scholar's pants"}
                                                                 
                sets.Midcast.Enfeebling = {main="Akademos",sub="Mephitis grip",
                                           head="Befouled Crown",neck="Incanter's Torque",ear1="Psystorm earring",ear2="Lifestorm earring",
                                           body="Artsieq Jubbah",hands="Gendewitha gages",ring1="Sangoma ring",ring2="Balrahn's ring",
                                           back="Swith cape",waist="Porous Rope",legs="Vanya slops",feet="Orvail souliers +1"}
                                                                   
                sets.Midcast.Stoneskin = {head="Nahtirah hat",neck="Stone gorget",ear1="Earthcry earring",ear2="Loquac. earring",
                                          hands="Stone mufflers",ring1="Prolix ring",
                                          back="Swith cape",waist="Siegel sash",legs="Haven hose",feet="Chelona boots"}
                                                                 
                sets.Midcast.Regen = {main="Bolelabunga",sub="Genbu's shield",ammo="Clarus stone",
                                      head="Arbatel bonnet", neck="Incanter's Torque",ear1="Aredan earring",ear2="Beatific earring",
                                      body="Nefer kalasiris",hands="Bokwus gloves",ring1="Ephedra ring",ring2="Sirona's ring",
                                      back="Pahtli cape",waist="Porous Rope",legs="Scholar's pants",feet="Argute loafers +2"}
                                                         
                sets.Obi = {waist="Hachirin-No-Obi",}
                sets.Obi.helix = {waist="Hachirin-No-Obi", back="Bookworm's Cape"}
                --Aftercast Sets--
                sets.Aftercast = {}
end
 
function precast(spell)
        if spell.action_type == "Magic" then
                equip(sets.Precast.FC.Standard)
                if string.find(spell.english,"Cur") and spell.name ~= "Cursna" then
                        equip(sets.Precast.FC.Cure)
                end
        end
       
        if spell.english == "Penury" or spell.english == "Parsimony" then
                equip(sets.Precast.JA.PenuryParsimony)
        end
       
        if spell.english == "Ebullience" or spell.english == "Rapture" then
                equip(sets.Precast.JA.EbullienceRapture)
        end
       
        if spell.english == "Immanence" or spell.english == "Perpetuation" then
                equip(sets.Precast.JA.ImmanencePerpetuation)
        end
end
 
function midcast(spell)
        if spell.english == "Cure" or spell.english == "Cure II" or spell.english == "Cure III" or spell.english == "Cure IV" then
                equip(sets.Midcast.Cures)
                if spell.element == world.weather_element or spell.weather_element or spell_element == world.day_element then
                        equip(sets.Obi)
                end
                if buffactive.rapture then
                        equip(sets.Precast.JA.EbullienceRapture)
                end
        end
       
        if string.find(spell.english,"helix") then
                equip(sets.Midcast.Helix)
                if spell.element == world.weather_element or spell_element == world.day_element then
                        equip(sets.Obi)
				end	
			end
       
        if spell.english == "Kaustra" then
                equip(sets.Midcast.Helix)
                if spell.element == world.weather_element or spell_element == world.day_element then
                        equip(sets.Obi)
                end
        end
       
        if spell.english == "Stone" or spell.english == "Stone II" or spell.english == "Thunder" or spell.english == "Thunder II" or spell.english == "Water" or spell.english == "Water II" or spell.english == "Fire" or spell.english == "Fire II" or spell.english == "Blizzard" or spell.english == "Blizzard II" or spell.english == "Aero" or spell.english == "Aero II" then
                equip(sets.Midcast.LowNukes)
                if spell.element == world.weather_element or spell.weather_element or spell_element == world.day_element then
                        equip(sets.Obi)
				end		
                if buffactive.ebullience then
                        equip(sets.Precast.JA.EbullienceRapture)
                end
                if buffactive.klimaform then
                        equip ({feet="Arbatel Loafers +1"})
				end
        end
       
        if spell.english == "Stone III" or spell.english == "Thunder III" or spell.english == "Water III" or spell.english == "Fire III" or spell.english == "Blizzard III" or spell.english == "Aero III" or spell.english == "Stone IV" or spell.english == "Thunder IV" or spell.english == "Water IV" or spell.english == "Fire IV" or spell.english == "Blizzard IV" or spell.english == "Aero IV" or spell.english == "Stone V" or spell.english == "Thunder V" or spell.english == "Water V" or spell.english == "Fire V" or spell.english == "Blizzard V" or spell.english == "Aero V"then
                equip(sets.Midcast.HighNukes)
                if spell.element == world.weather_element or spell.weather_element or spell_element == world.day_element then
                        equip(sets.Obi)
                end
                if buffactive.ebullience then
                        equip(sets.Precast.JA.EbullienceRapture)
                end
                if buffactive.klimaform then
                        equip ({feet="Arbatel Loafers +1"})
                end
		
        end
 
        if spell.skill == "EnhancingMagic" then
                if spell.english == "Embrava" then
                        equip(sets.Midcast.Enhancing)
                        if not buffactive.perpetuance then
                                add_to_chat(8,"--------- Perpetuance is down ---------")
                        end
                        if not buffactive.accession then
                                add_to_chat(8,"--------- Accession is down ---------")
                        end
                        if not buffactive.penury then
                                add_to_chat(8,"--------- Penury is down ---------")
                        end
                end
                if buffactive.perpetuance then
                        equip(sets.Midcast.Enhancing,{hands="Savant's Bracers +1"})
                else
                        equip(sets.Midcast.Enhancing)
                end
        end
       
        if spell.english == "Stoneskin" then
                equip(sets.Midcast.Stoneskin)
        end
       
        if spell.english == "Slow" or spell.english == "Paralyze" or spell.english == "Blind" or spell.english == "Silence" or spell.english == "Break" or spell.english == "Sleep" or spell.english == "Sleep II" or spell.english == "Sleepga" or spell.english == "Dispel" then
                equip(sets.Midcast.Enfeebling)
        end
       
        if spell.english == "Sneak" then
                send_command("@wait 1.8;cancel 71;")
        end    
end
 
function aftercast(spell)
        equip(sets.Idle.Standard)
               
        if buffactive["Sublimation: Activated"] then
                equip(sets.Idle.Sublimation)
        end
       
        if buffactive["Sandstorm"] then
                equip(sets.Idle.Sandstorm)
                        if buffactive["Sublimation: Activated"] then
                                equip(sets.Idle.SublimationSandstorm)
                        end
        end
       
       
        if spell.english == "Sleep" or spell.english == "Sleepga" then
                send_command("@wait 50;input /echo ------- "..spell.english.." is wearing off in 10 seconds -------")
        elseif spell.english == "Sleep II" or spell.english == "Sleepga II" then
                send_command("@wait 80;input /echo ------- "..spell.english.." is wearing off in 10 seconds -------")
        elseif spell.english == "Break" or spell.english == "Breakga" then
                send_command("@wait 20;input /echo ------- "..spell.english.." is wearing off in 10 seconds -------")
        end
end
	

    --To toggle gearsets:
    --Main command: //gs c toggle x set       where x = set name variable. Variables are as follows: --
    --Idle sets: Idle, Melee TP sets: MTP, Ranged TP sets: RTP--
    --Shoha sets: Shoha, Fudo sets: Fudo, Kaiten sets: Kaiten, Apex Arrow sets: Apex, Namas Arrow sets: Namas--
     
    --TO ADD YOUR OWN WEAPON-SPECIFIC SETS:--
    --Change the TP set index, toggle information at the bottom of the lua, and set names to your desired weapon. For example,--
    --sets.AmanoTP.Standard for the Amanomurakumo standard TP set. Duplicate this as many times as you need to for your desired effect.--
	
include('organizer-lib')
    function get_sets()
     
                    --Idle Sets--
                    sets.Idle = {}         
     
                    sets.Idle.index = {'Standard', 'Town'}
                   
                    Idle_ind = 1
                   
                    sets.Idle.Standard = {ammo="Potestas bomblet",
                                          head="Otronif mask",neck="Ganesha's mala", ear1="Steelflash earring", ear2="Bladeborn earring",
                                          body="Miki. breastplate",hands="Otronif gloves",ring1="Defending ring",ring2="Dark ring",
                                          back="Shadow mantle",waist="Flume belt",legs="Otronif brais",feet="Danzo Sune-Ate"}
                                                             
                    sets.Idle.Town = {ammo="Potestas bomblet",
                                      head="Ogier's Helm",neck="Twilight torque", ear1="Steelflash earring", ear2="Bladeborn earring",
                                      body="Nocturnus mail",hands="Sao. kote +2",ring1="Defending ring",ring2="Dark ring",
                                      back="Shadow mantle",waist="Flume belt",legs="Otronif Brais +1",feet="Danzo Sune-Ate"}
           
                   
                                   
                                   
                                   
                                   
                    --TP Sets--
                    sets.TP = {}
     
                    sets.TP.index = {'Standard', 'AccuracyLite', 'AccuracyFull', 'DT', 'DTAccuracy'}
                    --1=Standard, 2=AccuracyLite, 3=AccuracyFull, 4=DT, 5=DTAccuracy--
                    TP_ind = 1
           
                    sets.TP.Standard = {   main="Tsurumaru",
    sub="Tzacab Grip",
    ammo="Jukukik Feather",
    head={ name="Otomi Helm", augments={'Phys. dmg. taken -2%','Magic dmg. taken -2%','STR+8',}},
    body="Emet Harness +1",
    hands="Umuthi Gloves",
    legs={ name="Otronif Brais +1", augments={'Phys. dmg. taken -2%','"Dbl.Atk."+1',}},
    feet={ name="Otronif Boots +1", augments={'Phys. dmg. taken -2%','"Dbl.Atk."+1',}},
    neck="Ganesha's Mala",
    waist="Windbuffet Belt",
    left_ear="Steelflash Earring",
    right_ear="Zwazo Earring",
    left_ring="Rajas Ring",
    right_ring="Defending Ring",
    back="Takaha Mantle",}
                                                           
                    sets.TP.AccuracyLite = {ammo="Hagneia stone",
                                            head="Otomi helm",neck="Ganesha's mala", ear1="Steelflash earring", ear2="Bladeborn earring",
											body="Gorney Haubert +1",hands="Otronif gloves",ring1="K'ayres ring",ring2="Rajas ring",
                                            back="Takaha mantle",waist="Dynamic belt +1",legs="Otronif Brais +1",feet="Wakido Sune-Ate"}
           
                    sets.TP.AccuracyFull = {ammo="Jukukik feather",
                                            head="Yaoyotl helm",neck="Iqabi necklace", ear1="Steelflash earring", ear2="Bladeborn earring",
                                            body="Sakonji domaru",hands="Buremte gloves",ring1="K'ayres ring",ring2="Rajas ring",
                                            back="Takaha mantle",waist="Dynamic belt +1",legs="Otronif Brais +1",feet="Wakido Sune-Ate"}
                                                           
                    sets.TP.DT = {ammo="Hagneia stone",
                                  head="Yaoyotl helm",neck="Asperity necklace", ear1="Steelflash earring", ear2="Bladeborn earring",
                                  body="Miki. breastplate",hands="Otronif gloves",ring1="K'ayres ring",ring2="Rajas ring",
                                  back="Takaha mantle",waist="Cetl belt",legs="Otronif brais",feet="Wakido Sune-Ate"}
                                     
                    sets.TP.DTAccuracy = {ammo="Hagneia stone",
                                          head="Yaoyotl helm",neck="Asperity necklace", ear1="Steelflash earring", ear2="Bladeborn earring",                              body="Miki. breastplate",hands="Otronif gloves",ring1="K'ayres ring",ring2="Rajas ring",
                                          back="Takaha mantle",waist="Cetl belt",legs="Otronif Brais +1",feet="Wakido Sune-Ate"}
     
     
     
                    sets.RangedTP = {}
     
                    sets.RangedTP.index = {'Standard', 'AccuracyLite', 'AccuracyFull'}
                    --1=Standard, 2=AccuracyLite, 3=AccuracyFull--
                    TP_ind = 1
           
                    sets.RangedTP.Standard = {range="Some Bow",ammo="Tulfaire arrow",
                                              head="Otomi helm",neck="Asperity necklace", ear1="Steelflash earring", ear2="Bladeborn earring",                                body="Sakonji domaru",hands="Otronif gloves",ring1="K'ayres ring",ring2="Rajas ring",
                                              back="Takaha mantle",waist="Cetl belt",legs="Otronif Brais +1",feet="Wakido Sune-Ate"}
                                                           
                    sets.RangedTP.AccuracyLite = {range="Some bow",ammo="Tulfaire arrow",
                                                  head="Otomi helm",neck="Asperity necklace", ear1="Steelflash earring", ear2="Bladeborn earring",                                body="Sakonji domaru",hands="Otronif gloves",ring1="K'ayres ring",ring2="Rajas ring",
                                                  back="Takaha mantle",waist="Dynamic belt +1",legs="Otronif Brais +1",feet="Wakido Sune-Ate"}
           
                    sets.RangedTP.AccuracyFull = {range="Some Bow",ammo="Tulfaire arrow",
                                                  head="Yaoyotl helm",neck="Iqabi necklace", ear1="Steelflash earring", ear2="Bladeborn earring",                                 body="Sakonji domaru",hands="Buremte gloves",ring1="K'ayres ring",ring2="Rajas ring",
                                                  back="Takaha mantle",waist="Dynamic belt +1",legs="Otronif Brais +1",feet="Wakido Sune-Ate"}
                                                             
                                                             
                                                             
                                                             
                                                             
                                                             
                    --Weaponskill Sets--
                    sets.WS = {}
           
                    sets.Shoha = {}
           
                    sets.Shoha.index = {'Attack','Accuracy'}
                    Shoha_ind = 1
           
                    sets.Shoha.Attack = {ammo="Thew bomblet",
                                         head="Otomi helm",neck="Fotia Gorget",ear1="Steelflash earring",ear2="Bladeborn earring",
                                         body="Phorcys korazin",hands="Phorcys mitts",ring1="Vulcan's ring",ring2="Rajas ring",
                                         back="Buquwik cape",waist="Fotia Belt",legs="Otronif Brais +1",feet="Gor. sollerets +1"}
                                                                     
                    sets.Shoha.Accuracy = {ammo="Cheruski needle",
                                           head="Yaoyotl helm",neck="Fotia Gorget",ear1="Steelflash earring",ear2="Bladeborn earring",
                                           body="Phorcys korazin",hands="Buremte gloves",ring1="Vulcan's ring",ring2="Rajas ring",
                                           back="Buquwik cape",waist="Fotia Belt",legs="Otronif Brais +1",feet="Wakido Sune-Ate"}
                                                             
                    sets.Fudo = {}
           
                    sets.Fudo.index = {'Attack','Accuracy'}
                    Fudo_ind = 1
           
                    sets.Fudo.Attack = {ammo="Potestas bomblet",
                                        head="Otomi helm",neck="Fotia Gorget",ear1="Steelflash earring",ear2="Bladeborn earring",
                                        body="Phorcys korazin",hands="Boor Bracelets",ring1="Vulcan's ring",ring2="Rajas ring",
                                        back="Buquwik cape",waist="Fotia Belt",legs="Otronif Brais +1",feet="Otronif  +1"}
                                                               
                    sets.Fudo.Accuracy = {ammo="Potestas bomblet",
                                          head="Yaoyotl helm",neck="Fotia Gorget",ear1="Bladeborn earring",ear2="Steelflash earring",
                                          body="Phorcys korazin",hands="Phorcys mitts",ring1="Vulcan's ring",ring2="Rajas ring",
                                          back="Buquwik cape",waist="Fotia Belt",legs="Otronif Brais +1",feet="Gor. sollerets +1"}
     
                    sets.Kaiten = {}
                   
                    sets.Kaiten.index = {'Attack','Accuracy'}
                    Kaiten_ind = 1
           
                    sets.Kaiten.Attack = {ammo="Potestas bomblet",
                                          head="Otomi helm",neck="Fotia Gorget",ear1="Steelflash earring", ear2="Bladeborn earring",
                                          body="Phorcys korazin",hands="Phorcys mitts",ring1="Vulcan's ring",ring2="Rajas ring",
                                          back="Buquwik cape",waist="Fotia Belt",legs="Otronif Brais +1",feet="Kar. sollerets +1"}
                                                               
                    sets.Kaiten.Accuracy = {ammo="Potestas bomblet",
                                            head="Yaoyotl helm",neck="Fotia Gorget",ear1="Steelflash earring", ear2="Bladeborn earring",
                                            body="Phorcys korazin",hands="Phorcys mitts",ring1="Vulcan's ring",ring2="Rajas ring",
                                            back="Buquwik cape",waist="Fotia Belt",legs="Otronif Brais +1",feet="Kar. sollerets +1"}
     
                    sets.Apex = {}
           
                    sets.Apex.index = {'Attack','Accuracy'}
                    Apex_ind = 1
           
                    sets.Apex.Attack = {ammo="Potestas bomblet",
                                        head="Otomi helm",neck="Fotia Gorget",ear1="Brutal earring",ear2="Moonshade earring",
                                        body="Phorcys korazin",hands="Phorcys mitts",ring1="Vulcan's ring",ring2="Rajas ring",
                                        back="Buquwik cape",waist="Fotia Belt",legs="Otronif Brais +1",feet="Gor. sollerets +1"}
                                                               
                    sets.Apex.Accuracy = {ammo="Potestas bomblet",
                                          head="Yaoyotl helm",neck="Fotia Gorget",ear1="Brutal earring",ear2="Moonshade earring",
                                          body="Phorcys korazin",hands="Phorcys mitts",ring1="Vulcan's ring",ring2="Rajas ring",
                                          back="Buquwik cape",waist="Fotia Belt",legs="Otronif Brais +1",feet="Gor. sollerets +1"}
     
                    sets.Namas = {}
           
                    sets.Namas.index = {'Attack','Accuracy'}
                    Namas_ind = 1
           
                    sets.Namas.Attack = {ammo="Potestas bomblet",
                                         head="Otomi helm",neck="Fotia Gorget",ear1="Brutal earring",ear2="Moonshade earring",
                                         body="Phorcys korazin",hands="Phorcys mitts",ring1="Vulcan's ring",ring2="Rajas ring",
                                         back="Buquwik cape",waist="Fotia Belt",legs="Otronif Brais +1",feet="Gor. sollerets +1"}
                                                               
                    sets.Namas.Accuracy = {ammo="Potestas bomblet",
                                           head="Yaoyotl helm",neck="Fotia Gorget",ear1="Brutal earring",ear2="Moonshade earring",
                                           body="Phorcys korazin",hands="Phorcys mitts",ring1="Vulcan's ring",ring2="Rajas ring",
                                           back="Buquwik cape",waist="Fotia Belt",legs="Otronif Brais +1",feet="Gor. sollerets +1"}
                                                                             
                                                                             
                                                                             
                                                                             
                                                                             
                                                                             
                    --Utility Sets--
                    sets.Utility = {}
                   
                    sets.Utility.PDT = {head="Otronif mask",neck="Twilight torque",
                                        body="Miki. breastplate",hands="Otronif gloves",ring1="Defending ring",ring2="Dark ring",
                                        back="Mollusca mantle",waist="Flume belt",legs="Otronif brais",feet="Otronif boots"}
                                                   
                    sets.Utility.MDT = {head="Ogier's helm",neck="Twilight torque",
                                        body="Nocturnus mail",hands="Buremte gloves",ring1="Defending ring",ring2="Dark ring",
                                        back="Mollusca mantle",legs="Otronif Brais +1",feet="Wakido Sune-Ate"}
                                                           
                                   
                                   
                                   
                                   
                                   
                    --Job Ability Sets--
                    sets.JA = {}
           
                    sets.JA.Meditate = {head="Myochin kabuto",
                                       hands="Sao. kote +2",
									   main="Tsurumaru"}
    end
     
     
     
                   
                   
                   
    function precast(spell)
            if spell.english == 'Meditate' then
                    equip(sets.JA.Meditate)
            end
                   
            if spell.english == 'Tachi: Shoha' then
                    equip(sets.Shoha[sets.Shoha.index[Shoha_ind]])
            end
           
            if spell.english == 'Tachi: Fudo' then
                    equip(sets.Fudo[sets.Fudo.index[Fudo_ind]])
            end
     
            if spell.english == 'Tachi: Kaiten' then
                    equip(sets.Kaiten[sets.Kaiten.index[Kaiten_ind]])
            end
     
            if spell.english == 'Apex Arrow' then
                    equip(sets.Apex[sets.Apex.index[Apex_ind]])
            end
     
            if spell.english == 'Namas Arrow' then
                    equip(sets.Namas[sets.Namas.index[Namas_ind]])
            end
     
             if spell.name == "Ranged" then
                    equip(sets.Utility.Snapshot)
             end
    end            
     
    function midcast(spell,act)
        if spell.name == "Ranged" then
            equip(sets.RangedTP[sets.RangedTP.index[RangedTP_ind]])
        end
    end
     
    function aftercast(spell,act)
            if player.status == 'Engaged' then
                    equip(sets.TP[sets.TP.index[TP_ind]])
            else
                    equip(sets.Idle[sets.Idle.index[Idle_ind]])
            end
    end
     
    function status_change(new,old)
            if new == 'Engaged' then
                    equip(sets.TP[sets.TP.index[TP_ind]])
            else
                    equip(sets.Idle[sets.Idle.index[Idle_ind]])
            end
    end
     
    function self_command(command)
            if command == 'toggle MTP set' then
                    TP_ind = TP_ind +1
                    if TP_ind > #sets.TP.index then TP_ind = 1 end
                    send_command('@input /echo <----- TP Set changed to '..sets.TP.index[TP_ind]..' ----->')
                    equip(sets.TP[sets.TP.index[TP_ind]])
            elseif command == 'toggle RTP set' then
                    RangedTP_ind = RangedTP_ind +1
                    if RangedTP_ind > #sets.RangedTP.index then RangedTP_ind = 1 end
                    send_command('@input /echo <----- Ranged TP Set changed to '..sets.RangedTP.index[RangedTP_ind]..' ----->')
                    equip(sets.RangedTP[sets.RangedTP.index[RangedTP_ind]])
            elseif command == 'toggle Idle set' then
                    Idle_ind = Idle_ind +1
                    if Idle_ind > #sets.Idle.index then Idle_ind = 1 end
                    send_command('@input /echo <----- Idle Set changed to '..sets.Idle.index[Idle_ind]..' ----->')
                    equip(sets.Idle[sets.Idle.index[Idle_ind]])
            elseif command == 'toggle Shoha set' then
                    Shoha_ind = Shoha_ind +1
                    if Shoha_ind > #sets.Shoha.index then Shoha_ind = 1 end
                    send_command('@input /echo <----- Tachi: Shoha Set changed to '..sets.Shoha.index[Shoha_ind]..' ----->')
            elseif command == 'toggle Fudo set' then
                    Fudo_ind = Fudo_ind +1
                    if Fudo_ind > #sets.Fudo.index then Fudo_ind = 1 end
                    send_command('@input /echo <----- Tachi: Fudo Set changed to '..sets.Fudo.index[Fudo_ind]..' ----->')
            elseif command == 'toggle Kaiten set' then
                    Kaiten_ind = Kaiten_ind +1
                    if Kaiten_ind > #sets.Kaiten.index then Kaiten_ind = 1 end
                    send_command('@input /echo <----- Tachi: Kaiten Set changed to '..sets.Kaiten.index[Kaiten_ind]..' ----->')
            elseif command == 'toggle Apex set' then
                    Apex_ind = Apex_ind +1
                    if Apex_ind > #sets.Apex.index then Apex_ind = 1 end
                    send_command('@input /echo <----- Apex Arrow Set changed to '..sets.Apex.index[Apex_ind]..' ----->')
            elseif command == 'toggle Namas set' then
                    Namas_ind = Namas_ind +1
                    if Namas_ind > #sets.Namas.index then Namas_ind = 1 end
                    send_command('@input /echo <----- Namas Arrow Set changed to '..sets.Namas.index[Namas_ind]..' ----->')
            elseif command == 'equip TP set' then
                    equip(sets.TP[sets.TP.index[TP_ind]])
            elseif command == 'equip Idle set' then
                    equip(sets.Idle[sets.Idle.index[Idle_ind]])
            end
    end


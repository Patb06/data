include('organizer-lib')	

    --GearSwap Version 0.823
    --File Created 2-16-13
    --Update
    --(3-22-14) Wildfire sets added.
    --(2-21-14) [For the buff "Battlefield" you'll see you can use an echo or the actual JA Scavenge for when
    --exiting a battlefield. By default when u exit a battlefield, you will receive a scavenge reminder. Change accordingly.]
     
    function get_sets()
            TP_Index = 1
            Idle_Index = 1 
            DefensePDT_Index = 1
            DefenseMDT_Index = 1
            Midshot_Index = 1
            Barrage_Index = 1
            Coronach_Index = 1
            LS_Index = 1 --Last Stand
            WF_Index = 1 --Wildfire
            NA_Index = 1 --Namas Arrow
            JR_Index = 1 --Jishnu's Radiance
            SW_Index = 1 --Sidewinder
            TF_Index = 1 --Trueflight
			
            --Default Macro Set for RNG
            send_command('input /macro book 15;wait .1;input /macro set 1')
     
            --PreSets Below (Snapshot/JA's)
            sets.precast = {}
            sets.precast.bullet = {ammo="Achiyalabopa Bullet"}
            sets.precast.arrow = {ammo="Achiyal. Arrow"}
            sets.precast.trialsammo = {ammo="Gargouille Arrow"}
			sets.precast.bolt = {ammo="Oxidant Bolt"}
            sets.precast['Double Shot'] = {head="Sylvan Gapette +2"}
            sets.precast['Velocity Shot'] = {body="Sylvan Caban +2"}
            sets.precast['Camouflage'] = {body="Orion Jerkin"}     
            sets.precast['Bounty Shot'] = {hands="Syl. Glvltte. +2"}
            sets.precast['Sharpshot'] = {legs="Orion Braccae +1"}
            sets.precast['Scavenge'] = {feet="Orion socks +1"}
            sets.precast['Shadowbind'] = {hands="Orion Bracers +1"}
           
            sets.precast['Eagle Eye Shot'] = {
                    head="Pursuer's Beret",
                    neck="Huani collar",
                    ear1="Flame pearl",
                    ear2="Flame pearl",
                    body="Kyujutsugi",
                    hands={ name="Herculean Gloves", augments={'Rng.Acc.+20 Rng.Atk.+20','Crit.hit rate+3','DEX+4',}},
                    ring1="Strigoi Ring",
                    ring2="Pyrosoul Ring",
                    back="Lutian cape",
                    waist="Prosilio belt",
                    legs="Arcadian Braccae",
                    feet="Orion Socks +1"}
                                                   
            sets.precast.PreShot = {
                    head="Pursuer's Beret",                                                 
                    body="Pursuer's Doublet",
                    hands={ name="Herculean Gloves", augments={'Rng.Acc.+20 Rng.Atk.+20','Crit.hit rate+3','DEX+4',}},
                    waist="Impulse Belt",
                    legs="Nahtirah Trousers",
                    feet="Pursuer's Gaiters"}
                   
            -- Magic Sets Below            
            sets.precast.FastCast = {
                    head="Whirlpool Mask",
                    neck="Twilight Torque",        
                    hands="Floral Gauntlets",
                    ring1="Dark Ring",
                    ring2="Dark Ring",
                    back="Iximulew Cape",          
                    legs="Nahtirah Trousers",
                    feet="Iuitl Gaiters"}
           
            sets.precast.Utsusemi = set_combine(sets.precast.FastCast,{neck="Magoraga Beads"})             
                                                   
            --Midshot Sets Below
            sets.Midshot = {
					head="Sylvan Gapette +2",
					body="Pursuer's Doublet",
					hands="Floral Gauntlets",
					legs="Feast Hose",
					feet={ name="Herculean Boots", augments={'Rng.Acc.+30','Crit. hit damage +4%','Rng.Atk.+10',}},
					neck="Iqabi Necklace",
					waist="Scout's Belt",
					left_ear="Volley Earring",
					right_ear="Clearview Earring",
					left_ring="Paqichikaji Ring",
					right_ring="Cacoethic Ring",
					back="Libeccio Mantle",}

            --Barrage Sets Below
            sets.Barrage = {
                    head="Pursuer's Beret",
                    neck="Iqabi Neckalce",
                    ear1="Clearview Earring",
                    ear2="Volley Earring",
                    body="Pursuer's Doublet",
                    hands="Sylvan Glovelettes +2",
                    ring1="Cacoethic ring",
                    ring2="Paqichikaji Ring",
                    back="Lutian cape",
                    waist="Elanid Belt",
                    legs="Feast Hose",
                    feet={ name="Herculean Boots", augments={'Rng.Acc.+30','Crit. hit damage +4%','Rng.Atk.+10',}},}                                         
           
            -- Coronach Sets Below
            sets.Coronach = {     
                    head="Pursuer's Beret",
                    neck="Fotia Gorget",
                    ear1="Flame pearl",
                    ear2="Flame pearl",
                    body="Kyujutsugi",
                    hands="Orion Bracers +1",
                    ring1="Rajas Ring",
                    ring2="Karieyh Ring",
                    back="Lutian cape",
                    waist="Fotia belt",
                    legs="Nahtirah Trousers",
                    feet={ name="Herculean Boots", augments={'Rng.Acc.+30','Crit. hit damage +4%','Rng.Atk.+10',}},}
           
            -- Last Stand Sets Below
            sets.LSgun = {
                    ammo="Achiyalabopa Bullet",
					head="Pursuer's Beret",
                    neck="Fotia Gorget",
                    ear1="Suppanomimi",
                    ear2="Clearview Earring",
                    body={ name="Pursuer's Doublet", augments={'DEX+7','AGI+10','"Recycle"+15',}},
                    hands="Floral Gauntlets",
                    ring1="Stormsoul Ring",
                    ring2="Karieyh Ring",
                    back="Lutian Cape",
                    waist="Fotia belt",
                    legs="Feast Hose",
                    feet={ name="Herculean Boots", augments={'Rng.Acc.+30','Crit. hit damage +4%','Rng.Atk.+10',}},
					}
             sets.LSxbow = {
                    ammo="",
					head="Pursuer's Beret",
                    neck="Fotia Gorget",
                    ear1="Suppanomimi",
                    ear2="Clearview Earring",
                    body={ name="Pursuer's Doublet", augments={'DEX+7','AGI+10','"Recycle"+15',}},
                    hands={ name="Herculean Gloves", augments={'Rng.Acc.+20 Rng.Atk.+20','Crit.hit rate+3','DEX+4',}},
                    ring1="Stormsoul Ring",
                    ring2="Karieyh Ring",
                    back="Lutian Cape",
                    waist="Fotia belt",
                    legs="Feast Hose",
                    feet={ name="Herculean Boots", augments={'Rng.Acc.+30','Crit. hit damage +4%','Rng.Atk.+10',}},
					}
           
            -- Wildfire Sets Below
            sets.WFgun = {
					ammo="Orichalcum Bullet",
					head={ name="Herculean Helm", augments={'CHR+10','"Mag.Atk.Bns."+23','Accuracy+13 Attack+13','Mag. Acc.+10 "Mag.Atk.Bns."+10',}},
					body={ name="Rawhide Vest", augments={'HP+50','"Subtle Blow"+7','"Triple Atk."+2',}},
					hands={ name="Herculean Gloves", augments={'Accuracy+2 Attack+2','"Mag.Atk.Bns."+30','Mag. Acc.+15 "Mag.Atk.Bns."+15',}},
					legs={ name="Herculean Trousers", augments={'Mag. Acc.+19 "Mag.Atk.Bns."+19','Weapon skill damage +5%','INT+8','Mag. Acc.+12','"Mag.Atk.Bns."+11',}},
					feet={ name="Herculean Boots", augments={'"Mag.Atk.Bns."+30','Pet: Accuracy+21 Pet: Rng. Acc.+21','Accuracy+13 Attack+13','Mag. Acc.+11 "Mag.Atk.Bns."+11',}},
					neck="Deviant Necklace",
					waist="Fotia Belt",
					left_ear="Hecate's Earring",
					right_ear="Friomisi Earring",
					left_ring="Acumen Ring",
					right_ring="Karieyh Ring",
					back="Toro Cape",
					}
					
			sets.WFxbow = {
					ammo="",
					head={ name="Herculean Helm", augments={'CHR+10','"Mag.Atk.Bns."+23','Accuracy+13 Attack+13','Mag. Acc.+10 "Mag.Atk.Bns."+10',}},
					body={ name="Rawhide Vest", augments={'HP+50','"Subtle Blow"+7','"Triple Atk."+2',}},
					hands={ name="Herculean Gloves", augments={'Accuracy+2 Attack+2','"Mag.Atk.Bns."+30','Mag. Acc.+15 "Mag.Atk.Bns."+15',}},
					legs={ name="Herculean Trousers", augments={'Mag. Acc.+19 "Mag.Atk.Bns."+19','Weapon skill damage +5%','INT+8','Mag. Acc.+12','"Mag.Atk.Bns."+11',}},
					feet={ name="Herculean Boots", augments={'"Mag.Atk.Bns."+30','Pet: Accuracy+21 Pet: Rng. Acc.+21','Accuracy+13 Attack+13','Mag. Acc.+11 "Mag.Atk.Bns."+11',}},
					neck="Deviant Necklace",
					waist="Fotia Belt",
					left_ear="Hecate's Earring",
					right_ear="Friomisi Earring",
					left_ring="Acumen Ring",
					right_ring="Karieyh Ring",
					back="Toro Cape",
					}
           
            -- Jishnu's Radiance Sets Below
            sets.JR = {
					range="Hangaku-no-yumi",
					ammo="Achiyalabopa Arrow",
					head={ name="Taeon Chapeau", augments={'Accuracy+17 Attack+17','"Dual Wield"+5','Crit. hit damage +3%',}},
					body={ name="Pursuer's Doublet", augments={'DEX+7','AGI+10','"Recycle"+15',}},
					hands="Floral Gauntlets",
					legs="Feast Hose",
					feet={ name="Herculean Boots", augments={'Rng.Acc.+30','Crit. hit damage +4%','Rng.Atk.+10',}},
					neck="Fotia Gorget",
					waist="Fotia Belt",
					left_ear="Clearview Earring",
					right_ear="Pixie Earring",
					left_ring="Karieyh Ring",
					right_ring="Paqichikaji Ring",
					back="Rancorous Mantle",
}

			-- Trueflight Sets Below 
			sets.TFgun = {
					ammo="Orichalcum Bullet",
					head={ name="Herculean Helm", augments={'CHR+10','"Mag.Atk.Bns."+23','Accuracy+13 Attack+13','Mag. Acc.+10 "Mag.Atk.Bns."+10',}},
					body={ name="Rawhide Vest", augments={'HP+50','"Subtle Blow"+7','"Triple Atk."+2',}},
					hands={ name="Herculean Gloves", augments={'Accuracy+2 Attack+2','"Mag.Atk.Bns."+30','Mag. Acc.+15 "Mag.Atk.Bns."+15',}},
					legs={ name="Herculean Trousers", augments={'Mag. Acc.+19 "Mag.Atk.Bns."+19','Weapon skill damage +5%','INT+8','Mag. Acc.+12','"Mag.Atk.Bns."+11',}},
					feet={ name="Herculean Boots", augments={'"Mag.Atk.Bns."+30','Pet: Accuracy+21 Pet: Rng. Acc.+21','Accuracy+13 Attack+13','Mag. Acc.+11 "Mag.Atk.Bns."+11',}},
					neck="Deviant Necklace",
					waist="Fotia Belt",
					left_ear="Hecate's Earring",
					right_ear="Friomisi Earring",
					left_ring="Karieyh Ring",
					right_ring="Apate Ring",
					back="Toro Cape",
}
			
			sets.TFxbow = {
					ammo="",
					head={ name="Herculean Helm", augments={'CHR+10','"Mag.Atk.Bns."+23','Accuracy+13 Attack+13','Mag. Acc.+10 "Mag.Atk.Bns."+10',}},
					body={ name="Rawhide Vest", augments={'HP+50','"Subtle Blow"+7','"Triple Atk."+2',}},
					hands={ name="Herculean Gloves", augments={'Accuracy+2 Attack+2','"Mag.Atk.Bns."+30','Mag. Acc.+15 "Mag.Atk.Bns."+15',}},
					legs={ name="Herculean Trousers", augments={'Mag. Acc.+19 "Mag.Atk.Bns."+19','Weapon skill damage +5%','INT+8','Mag. Acc.+12','"Mag.Atk.Bns."+11',}},
					feet={ name="Herculean Boots", augments={'"Mag.Atk.Bns."+30','Pet: Accuracy+21 Pet: Rng. Acc.+21','Accuracy+13 Attack+13','Mag. Acc.+11 "Mag.Atk.Bns."+11',}},
					neck="Deviant Necklace",
					waist="Fotia Belt",
					left_ear="Hecate's Earring",
					right_ear="Friomisi Earring",
					left_ring="Stormsoul Ring",
					right_ring="Karieyh Ring",
					back="Toro Cape",
}

     
            -- Sidewinder Sets Below
            sets.SW = {
                    head="Pursuer's Beret",
                    neck="Fotia Gorget",
                    ear1="Suppanomimi",
                    ear2="Clearview Earring",
                    body={ name="Pursuer's Doublet", augments={'DEX+7','AGI+10','"Recycle"+15',}},
                    hands={ name="Herculean Gloves", augments={'Rng.Acc.+20 Rng.Atk.+20','Crit.hit rate+3','DEX+4',}},
                    ring1="Karieyh Ring",
                    ring2="Stormsoul Ring",
                    back="Lutian Cape",
                    waist="Fotia belt",
                    legs="Feast Hose",
                    feet={ name="Herculean Boots", augments={'Rng.Acc.+30','Crit. hit damage +4%','Rng.Atk.+10',}},
					}
           
            -- TP Sets Below(I don't really use for RNG but feel free to add your own)
            sets.TP = {    
					head={ name="Dampening Tam", augments={'DEX+9','Accuracy+13','Mag. Acc.+14','Quadruple Attack +2',}},
					body="Rawhide Vest",
					hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
					legs="Carmine Cuisses",
					feet={ name="Herculean Boots", augments={'Accuracy+30','"Dual Wield"+1','AGI+2','Attack+8',}},
					neck="Iqabi Necklace",
					waist="Hurch'lan Sash",
					left_ear="Steelflash Earring",
					right_ear="Heartseeker Earring",
					left_ring="Karieyh Ring",
					right_ring="Cacoethic Ring",
					back="Kayapa Cape",
}
	sets.inwkr = {
		neck="Ygnas's Resolve +1"}		
           
            --Idle Sets Below
            sets.Idle = {
                    head="Ocelomeh headpiece",
                    neck="Wiglen Gorget",                                          
                    body="Khepri Jacket",
                    hands="Garden Bangles",
                    ring1="Karieyh Ring",
                    ring2="Sheltered Ring",
					feet="Fajin Boots"}

    end
     
    function precast(spell)
            if sets.precast[spell.english] then
                    equip(sets.precast[spell.english])
                    elseif spell.type == 'WeaponSkill' then
                            if spell.target.distance > 21.0  then                                          
                            add_to_chat(167,''..spell.target.name..' is too far can not use '..spell.name..'!!!. Cancelling WeaponSkill ')                          
                cancel_spell()
                return                     
                            elseif spell.name == "Coronach" then
                    equip(sets.Coronach)
							elseif spell.name == "Last Stand" and player.equipment.range == 'Doomsday' or player.equipment.range == 'Lionsquall' then
					equip(sets.LSgun)
							elseif spell.name == "Last Stand" and player.equipment.range == 'Illapa' then
					equip(sets.LSxbow)
                            elseif spell.name == "Namas Arrow" then
                    equip(sets.NA)
                            elseif spell.name == "Jishnu's Radiance" then
                    equip(sets.JR)
                            elseif spell.name == "Sidewinder" then
                    equip(sets.SW)
							elseif spell.name == "Trueflight" and player.equipment.range == 'Doomsday' or player.equipment.range == 'Lionsquall' then
					equip(sets.TFgun)		
							elseif spell.name == "Trueflight" and player.equipment.range == 'Illapa' then
					equip(sets.TFxbow)	
							elseif spell.name == "Wildfire" and player.equipment.range == 'Doomsday' or player.equipment.range == 'Lionsquall' then
					equip(sets.WFgun)	
							elseif spell.name == "Wildfire" and player.equipment.range == 'Illapa' then
					equip(sets.WFxbow)	
                    end            
                    elseif spell.name == "Ranged" then
                            equip(sets.precast.PreShot)
                            if player.equipment.range == 'Ajjub Bow' then
                            equip(sets.precast.arrow)            
                            elseif player.equipment.range == 'Hangaku-no-yumi' then
                            equip(sets.precast.arrow)            
                            elseif player.equipment.range == 'Lionsquall'  then
                            equip(sets.precast.bullet)            
                            elseif player.equipment.range == 'Astrild' then
                            equip(sets.precast.trialsammo)                 
                    end
                    elseif spell.type == "Ninjutsu" then
                            if string.find(spell.english,'Utsusemi') then
                                    if buffactive['Copy Image (3)'] or buffactive['Copy Image (4)'] then
                                            cancel_spell()
                                            add_to_chat(167, spell.english .. ' Canceled: [3+ Images]')
                                            return
                            else
                                    equip(sets.precast.Utsusemi)
                            end
                            else
                                    equip(sets.precast.FastCast)
                    end
                    elseif spell.english == 'Spectral Jig' and buffactive.Sneak then
                            cast_delay(0.2)
                            send_command('cancel Sneak')        
        end
    end
     if buffactive["reive mark"] then
        equip(sets.inwkr)
end
    function midcast(spell)
            if spell.name == "Ranged" then
                    equip(sets.Midshot)
                    if buffactive.Barrage then
                            equip(sets.Barrage)                                          
                    end
            end
    end
     
    function aftercast(spell)      
            if player.status=='Engaged' then
                    equip(sets.TP) 
            else           
                    equip(sets.Idle)           
            end
    end
     
    function status_change(new,old)
            if T{'Idle','Resting'}:contains(new) then              
                    equip(sets.Idle)
            elseif new == 'Engaged' then
                    equip(sets.TP)
            end
    end
     
    function buff_change(name,gain_or_loss)
            if name == 'Battlefield' and not gain_or_loss then
                    --send_command('wait 3; input /ja "Scavenge" <me>')
                    add_to_chat(167,'You left the Battlefield, don\'t forget to Scavenge!')
            end
    end


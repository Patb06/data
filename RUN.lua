--[[
        Written 08/26/2014 by Quixacotl.
 
        Custom Commands:
                //gs c cycle in chatlog or /console gs c cycle for macros.
                Useage: cycles through 5 different mode groups:
                Normal, Fodder, DD Accuracy, Physical Defense, and Magic Defense.
 
        Shortcut Commands (jump straight to any mode):
                //gs c normal
                //gs c fodder
                //gs c acc
                //gs c pdt
                //gs c mdt
--]]
 
include('organizer-lib')
function get_sets()
        ----------------------------------------------------------------
        -- Gear that needs to be equipped for the duration of a buff. --
        ----------------------------------------------------------------
        sets.buff = {}
        sets.buff['Swordplay'] = {hands="Futhark Mitons"}
 
        --------------------------------------------
        -- City areas for town gear and behavior. --
        --------------------------------------------
        areas = {}
        areas.Cities = S{
                "Eastern Adoulin", "Western Adoulin",
                "Ru'Lude Gardens", "Upper Jeuno", "Lower Jeuno", "Port Jeuno",
                "Port Windurst", "Windurst Waters", "Windurst Woods",
                "Windurst Walls", "Heavens Tower",
                "Port San d'Oria", "Northern San d'Oria", "Southern San d'Oria",
                "Port Bastok", "Bastok Markets",
                "Bastok Mines", "Metalworks",
                "Aht Urhgan Whitegate", "Tavanazian Safehold",
                "Nashmau", "Selbina",
                "Mhaura", "Norg", "Kazham"}
 
        ----------------------
        -- Weaponskill sets --
        ----------------------
        sets.WS ={ammo="Honed Tathlum",
                head="Rabid VIsor", 
				neck="Fotia Gorget",
                ear1="Triumph Earring", 
				ear2="Bladeborn Earring",
                body="Lustratio Harness", 
				hands="Erilaz Gauntlets",
                ring1="Rajas Ring", 
				ring2="Epona's Ring",
                back="Buquwik Cape", 
				waist="Fotia Belt",
                legs="Erilaz Leg Guards +1", 
				feet="Despair Greaves"}
 
        sets.WS['Dimidiation'] = set_combine(sets.WS,{
                neck="Fotia Gorget",
                ring1="Rajas Ring", 
				ring2="Epona's Ring",
                feet="Futhark Boots",
				waist="Fotia Belt",
				})
 
        sets.WS['Resolution'] = set_combine(sets.WS,{neck="Breeze Gorget"})
 
        sets.WS['Requiescat'] = set_combine(sets.WS,{
				neck="Fotia Gorget",
                ring1="Aquasoul Ring", 
				ring2="Epona's Ring"
				})
 
        sets.WS['Vorpal Blade'] = set_combine(sets.WS, {
				neck="Soil Gorget"
				})
 
        sets.Enmity = {neck="Invidia Torque",
				head="Rabid Visor",
                ear1="Cryptic Earring", 
				ear2="Friomisi Earring",
				body="Emet Harness +1",
                hands="Futhark Mitons", 
				back="Fravashi Mantle",
				legs="Erilaz Leg Guards +1",
				feet="Erilaz Greaves",
                ring1="Odium Ring", 
				ring2="Vexer Ring +1"}
 
        ------------------
        -- Precast Sets --
        ------------------
        sets.precast = {}
        sets.precast.FastCast = {ammo="Honed Tathlum",
                head="Runeist Bandeau", 
				neck="Twilight Torque",
                ear1="Loquac. Earring",
                body="Taeon Tabard", 
				hands="Thaumas Gloves",
                ring1="Defending Ring", 
				ring1="Prolix Ring",
                back="Mollusca Mantle", 
				waist="Goading Belt",
                legs="Orvail Pants +1", 
				feet="Chelona Boots"}
 
        sets.precast.Waltz = {}
        sets.precast.Step = {ear1="Choreia Earring"}
 
 
        ------------------
        -- Midcast Sets --
        ------------------
        sets.midcast = {}
        sets.midcast.Flash = sets.Enmity
        sets.midcast.FastRecast = {ammo="Honed Tathlum",
                head="Rune. Bandeau", 
				neck="Incanter's Torque",
                ear1="Loquac. Earring",
                body="Vanir Cotehardie", 
				hands="Thaumas Gloves",
                ring1="Defending Ring", 
				ring1="Prolix Ring",
                back="Mollusca Mantle", 
				waist="Goading Belt",
                legs="Orvail Pants +1", 
				feet="Chelona Boots"}
 
        sets.midcast['Enhancing Magic'] = set_combine(sets.midcast.FastRecast, {
                head="Rune. Bandeau", 
				neck="Incanter's Torque",
                body="Futhark Coat", 
				hands="Runeist Mitons",
                back="Mollusca Mantle", 
				waist="Olympus Sash",
                legs="Futhark Trousers"
				})
 
        sets.midcast['Divine Magic'] = set_combine(sets.midcast.FastRecast, {
                legs="Rune. Trousers"
				})
 
        sets.midcast.Regen = set_combine(sets.midcast['Enhancing Magic'], {
                head="Rune. Bandeau", 
				neck="Incanter's Torque",
                body="Futhark Coat", 
				hands="Runeist Mitons",
                back="Mollusca Mantle", 
				legs="Futhark Trousers"
				})
 
        sets.midcast.Phalanx = set_combine(sets.midcast['Enhancing Magic'], {
                head="Rune. Bandeau", 
				neck="Incanter's Torque",
                body="Futhark Coat", 
				hands="Runeist Mitons",
                back="Mollusca Mantle", 
				legs="Futhark Trousers"
				})
 
        --------------------
        -- AfterCast Sets --
        --------------------
 
        -----------------
        -- Status Sets --
        -----------------
        sets.Resting = {neck="Wiglen Gorget",
                ear1="Ethereal Earring", 
				ear2="Phawaylla Earring",
                ring1="Sheltered Ring", 
				ring2="Paguroidea Ring",
                body="Runeist Coat", 
				feet="Chelona Boots"
				}
 
        ---------------
        -- Idle Sets --
        ---------------
 
        Idle_Set_Names = {"Normal","Fodder","DD Accuracy","Physical Defense","Magic Defense"}
 
        sets.idle = {}
        sets.idle.Town = {
				main="Aettir",
                sub="Tzacab Grip", 
				ammo="Ginsen",
                head="Skormoth Mask", 
				neck="Twilight Torque",
                ear1="Ethereal Earring", 
				ear2="Dawn Earring",
                body="Futhark Coat", 
				hands="Erilaz Gauntlets",
                ring1="Defending Ring", 
				ring2={ name="Dark Ring", augments={'Magic dmg. taken -3%','Phys. dmg. taken -5%',}},
                back="Atheling Mantle", 
				waist="Flume Belt",
                legs="Erilaz Leg Guards +1", 
				feet="Skadi's Jambeaux +1"
				}
 
        sets.idle.Normal = {
				ammo="Ginsen",
                head="Skormoth Mask", 
				neck="Twilight Torque",
                ear1="Ethereal Earring", 
				ear2="Dawn Earring",
                body="Rawhide Vest", 
				hands="Futhark Mitons",
                ring1="Sheltered Ring", 
				ring2="Paguroidea Ring",
                back="Shadow Mantle", 
				waist="Flume Belt",
                legs="Erilaz Leg Guards +1", 
				feet="Skadi's Jambeaux +1"
				}
 
        sets.idle.Fodder = {
				ammo="Ginsen",
                head="Skormoth Mask", 
				neck="Wiglen Gorget",
                ear1="Ethereal Earring", 
				ear2="Dawn Earring",
                body="Thaumas Coat", 
				hands="Qaaxo Mitaines",
                ring1="Sheltered Ring", 
				ring2="Paguroidea Ring",
                back="Shadow Mantle", 
				waist="Flume Belt",
                legs="Erilaz Leg Guards +1", 
				feet="Skadi's Jambeaux +1"
				}
 
        sets.idle['DD Accuracy'] = {
				ammo="Ginsen",
                head="Skormoth Mask", 
				neck="Wiglen Gorget",
                ear1="Ethereal Earring", 
				ear2="Dawn Earring",
                body="Rawhide Vest", 
				hands="Erilaz Gauntlets",
                ring1="Sheltered Ring", 
				ring2="Rajas Ring",
                back="Atheling Mantle", 
				waist="Dynamic Belt +1",
                legs="Taeon Tights", 
				feet="Skadi's Jambeaux +1"
				}
 
        sets.idle['Physical Defense'] = { 
				ammo="Vanir Battery",
                head="Fu. Bandeau", 
				neck="Twilight Torque",
                ear1="Ethereal Earring", 
				ear2="Dawn Earring",
                body="Erilaz Surcoat +1", 
				hands="Erilaz Gauntlets",
                ring1="Defending Ring", 
				ring2={ name="Dark Ring", augments={'Magic dmg. taken -3%','Phys. dmg. taken -5%',}},
                back="Shadow Mantle", 
				waist="Flume Belt",
                legs="Erilaz Leg Guards +1", 
				feet="Skadi's Jambeaux +1"
				}
 
        -- ShellV, Defending Ring and Mollusca is enough to cap MDT for Rune Fencer. --
 
        sets.idle['Magic Defense'] = {
                ammo="Vanir Battery", 
				head="Fu. Bandeau",
                ear1="Ethereal Earring", 
				ear2="Dawn Earring",
                neck="Twilight Torque",
                body="Futhark Coat", 
				hands="Umuthi Gloves",
                ring1={ name="Dark Ring", augments={'Spell interruption rate down -4%','Phys. dmg. taken -4%','Magic dmg. taken -4%',}}, 
				ring2="Defending Ring",
                back="Shadow Mantle", 
				waist="Flume Belt",
                legs="Rune. Trousers", 
				feet="Skadi's Jambeaux +1"
				}
 
        ------------------
        -- Engaged Sets --
        ------------------
 
        TP_Set_Names = {"Normal","Fodder","DD Accuracy","Physical Defense","Magic Defense"}
 
        sets.engaged = {}
 
        sets.engaged.Normal = set_combine(sets.idle.Normal, {
				ammo="Ginsen",
                head="Futhark Bandeau", 
				neck="Twilight Torque",
                ear1="Bladeborn Earring", 
				ear2="Steelflash Earring",
                body="Erilaz Surcoat +1", 
				hands="Erilaz Gauntlets",
                ring1="Dark	Ring", 
				ring2="Dark Ring",
                back="Atheling Mantle", 
				waist="Windbuffet Belt",
                legs="Erilaz Leg Guards +1", 
				feet="Erilaz Greaves"
				})
 
        sets.engaged.Fodder = set_combine(sets.idle.Fodder, {
				ammo="Ginsen",
                head="Skormoth Mask", 
				neck="Asperity Necklace",
                ear1="Bladeborn Earring", 
				ear2="Steelflash Earring",
                body="Taeon Tabard", 
				hands="Erilaz Gauntlets",
                ring1="Rajas Ring", 
				ring2="Epona's Ring",
                back="Atheling Mantle", 
				waist="Windbuffet Belt",
                legs="Taeon Tights", 
				feet="Taeon Boots"
				})
 
        sets.engaged['DD Accuracy'] = set_combine(sets.idle['DD Accuracy'], {
				ammo="Ginsen",
                head="Skormoth Mask", 
				neck="Iqabi Necklace",
                ear1="Bladeborn Earring", 
				ear2="Steelflash Earring",
                body="Rawhide Vest", 
				hands="Umuthi Gloves",
                ring1="Rajas Ring", 
				ring2="Epona's Ring",
                back="Atheling Mantle", 
				waist="Windbuffet Belt",
                legs="Taeon Tights", 
				feet="Taeon Boots"
				})
 
        sets.engaged['Physical Defense'] = set_combine(sets.idle['Physical Defense'], {
				ammo="Ginsen",
                head="Futhark Bandeau", 
				neck="Twilight Torque",
                ear1="Bladeborn Earring", 
				ear2="Steelflash Earring",
                body="Erilaz Surcoat +1", 
				hands="Erilaz Gauntlets",
                ring1="Defending Ring", 
				ring2={ name="Dark Ring", augments={'Magic dmg. taken -3%','Phys. dmg. taken -5%',}},
                back="Atheling Mantle", 
				waist="Windbuffet Belt",
                legs="Erilaz Leg Guards +1", 
				feet="Erilaz Greaves"
				})
 
        sets.engaged['Magic Defense'] = set_combine(sets.idle['Magic Defense'], {
                ammo="Ginsen",
                head="Fu. Bandeau", 
				neck="Twilight Torque",
                ear1="Bladeborn Earring", 
				ear2="Steelflash Earring",
                body="Erilaz Surcoat +1", 
				hands="Erilaz Gauntlets",
                ring1={ name="Dark Ring", augments={'Spell interruption rate down -4%','Phys. dmg. taken -4%','Magic dmg. taken -4%',}}, 
				ring2="Defending Ring",
                back="Mollusca Mantle", 
				waist="Flume Belt",
                legs="Rune. Trousers", 
				feet="Futhark Boots"
				})
 sets.inwkr = {
		neck="Ygnas's Resolve +1"}
 
        -------------
        -- JA Sets --
        -------------
        sets.JA = {}
        sets.JA['Lunge'] = {
                head="Chelona Hat", 
				neck="Eddy Necklace",
                ear1="Hecate's earring", 
				ear2="Friomisi earring",
				ring1="Acumen Ring",
                body="Rawhide Vest", 
				hands="",
                back="Toro cape",
                legs="Shned. Tights +1", 
				feet="Weatherspoon Souliers +1"
				}
 
        sets.JA['Swipe'] = sets.JA['Lunge']
 
        sets.JA['Pflug'] = set_combine(sets.Enmity, {
                hands="Runeist Mitons", 
				feet="Runeist Bottes"
				})
				
        sets.JA['Elemental Sforzo'] = {
		body="Futhark Coat"
		}
		
        sets.JA['Battuta'] = set_combine(sets.Enmity, {
		head="Fu. Bandeau"
		})
		
		sets.JA['Vivacious Pulse'] = set_combine(sets.Enmity, {
		head="Erilaz Galea"
		})
		
        sets.JA['Vallation'] = set_combine(sets.Enmity, {
                body="Runeist Coat",
				legs="Futhark Trousers"
				})
				
        sets.JA['Valiance'] = set_combine(sets.Enmity, {
                body="Runeist Coat",
				legs="Futhark Trousers"
				})
				
        sets.JA['Gambit'] = set_combine(sets.Enmity, {
		hands="Runeist Mitons"
		})
 
        sets.JA['Swordplay'] = set_combine(sets.Enmity,
                {hands="Futhark Mitons"
				})
 
        sets.JA['Rayke'] = set_combine(sets.Enmity, {
		feet="Futhark Boots"
		})
		
        sets.JA['Liement'] = set_combine(sets.Enmity, {
		body="Futhark Coat"
		})
		
        sets.JA['Embolden'] = sets.Enmity
        sets.JA['One For All'] = sets.Enmity
 
        sets.JA['Provoke'] = sets.Enmity
        sets.JA['Warcry'] = sets.Enmity
        sets.JA['Animated Flourish'] = sets.Enmity
 
        -- Flourish --
        sets.Flourish = {}
 
        -----------------------------------
        -- Variables and notes to myself --
        -----------------------------------
        -- Rune elements --
        elements = {}
        elements.runes = {['Fire']='Ignis', ['Ice']='Gelus', ['Wind']='Flabra',
                ['Earth']='Tellus', ['Lightning']='Sulpor', ['Water']='Unda',
                ['Light']='Lux', ['Dark']='Tenebrae'}
 
        -- Element Obi definitions for Lunge and Swipe --
        sets.obi = {}
        sets.obi['Fire'] = {waist="Karin Obi"}
        sets.obi['Ice'] = {waist="Hyorin Obi"}
        sets.obi['Wind'] = {waist="Furin Obi"}
        sets.obi['Earth'] = {waist="Dorin Obi"}
        sets.obi['Lightning'] = {waist="Rairin Obi"}
        sets.obi['Water'] = {waist="Suirin Obi"}
        sets.obi['Light'] = {waist="Korin Obi"}
        sets.obi['Dark'] = {waist="Anrin Obi"}
 
        Mode_Index = 1
 
        send_command('input /macro book 16;wait .1;input /macro set 1')
end
 
function precast(spell,action)
        if spell.action_type == 'Magic' then
                equip(sets.precast.FastCast)
        elseif sets.WS[spell.name] then
                equip(sets.WS[spell.name])
        elseif spell.type=="JobAbility" then
                if sets.JA[spell.name] then
                        equip(sets.JA[spell.name])
                end
                if spell.name == 'Lunge' or spell.name == 'Swipe' then
                        update_obi()
                end
        elseif spell.type=="WeaponSkill" then
                equip(sets.WS)
        elseif spell.name:contains('Waltz') then
                equip(sets.precast.Waltz)
        elseif spell.name:contains('Step') then
                equip(sets.precast.Step)
        end
end
 if buffactive["reive mark"] then
        equip(sets.inwkr)
end
function midcast(spell,action)
        if spell.name == 'Sneak' or spell.name == 'Spectral Jig' or spell.name:startswith('Monomi') and spell.target.type == 'SELF' then
                send_command('cancel 71')
        elseif sets.midcast[spell.name] then
                equip(sets.midcast[spell.name])
        elseif spell.name:startswith('Regen') then
                equip(sets.midcast.Regen)
        elseif spell.name:startswith('Phalanx') then
                equip(sets.midcast.Phalanx)
        elseif sets.midcast[spell.skill] then
                equip(sets.midcast[spell.skill])
        end
end
 
function aftercast(spell,action)
        update_gear()
end
 
function status_change(new,action)
        update_gear()
end
 
-- Called when a player gains or loses a buff. --
function buff_change(buff,gain)
        if buff == "Swordplay" then update_gear() end
end
 
function self_command(command)
        if command:lower() == 'cycle' then
                Mode_Index = Mode_Index +1
                if Mode_Index > #Idle_Set_Names then
                        Mode_Index = 1
                end
                add_to_chat(8,'----- Gear Mode changed to '..Idle_Set_Names[Mode_Index]..' -----')
                update_gear()
        elseif command:lower() == 'mdt' then
                Mode_Index = 5
                add_to_chat(8,'----- Gear Mode changed to '..Idle_Set_Names[Mode_Index]..' -----')
                update_gear()
        elseif command:lower() == 'pdt' then
                Mode_Index = 4
                add_to_chat(8,'----- Gear Mode changed to '..Idle_Set_Names[Mode_Index]..' -----')
                update_gear()
        elseif command:lower() == 'acc' then
                Mode_Index = 3
                add_to_chat(8,'----- Gear Mode changed to '..Idle_Set_Names[Mode_Index]..' -----')
                update_gear()
        elseif command:lower() == 'fodder' then
                Mode_Index = 2
                add_to_chat(8,'----- Gear Mode changed to '..Idle_Set_Names[Mode_Index]..' -----')
                update_gear()
        elseif command:lower() == 'dd' then
                Mode_Index = 2
                add_to_chat(8,'----- Gear Mode changed to '..Idle_Set_Names[Mode_Index]..' -----')
                update_gear()
        elseif command:lower() == 'normal' then
                Mode_Index = 1
                add_to_chat(8,'----- Gear Mode changed to '..Idle_Set_Names[Mode_Index]..' -----')
                update_gear()
        end
end
 
function update_gear()
        if player.status == 'Engaged' then
                equip(sets.engaged[TP_Set_Names[Mode_Index]])
        elseif player.status == 'Idle' then
                if areas.Cities:contains(world.area) then
                        add_to_chat(8,'----- You are at '..world.area..'. Default Town gear equipped. -----')
                        equip(sets.idle.Town)
                else
                        -- Auto lockstyle. You can comment this out if you prefer.
                        --send_command('input /lockstyle on')--
 
                        equip(sets.idle[Idle_Set_Names[Mode_Index]])
                end
        else
                equip(sets.Resting)
        end
 
        if buffactive['Swordplay'] then equip(sets.buff['Swordplay']) end
end
 
function update_obi()
        if buffactive['Ignis'] then
                equip(sets.obi['Fire'])
        elseif buffactive['Gelus'] then
                equip(sets.obi['Ice'])
        elseif buffactive['Flabra'] then
                equip(sets.obi['Wind'])
        elseif buffactive['Tellus'] then
                equip(sets.obi['Earth'])
        elseif buffactive['Sulpor'] then
                equip(sets.obi['Lightning'])
        elseif buffactive['Lux'] then
                equip(sets.obi['Light'])
        elseif buffactive['Tenebrae'] then
                equip(sets.obi['Dark'])
        end

    end

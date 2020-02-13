/// scr_add_npc_to_crew(npc obj)
closest_sentient=argument0;
if(closest_sentient==noone){
    return false;
}

// Grant some equipment to the npc                      
var rnd_weapon = 51;

var equip_array = closest_sentient.npc_data[NPC_EQUIPMENT];
equip_array[@0]=rnd_weapon;
  

var newCrewIndex = array_length_1d(global.crew);
closest_sentient.npc_data[NPC_CREW_INDEX] = newCrewIndex;
global.crew = scr_push_array(global.crew,closest_sentient.npc_data);
closest_sentient.crew_index = newCrewIndex;

if(closest_sentient.npc_data[NPC_OCCUPATION]==occupation.cook){
    scr_event_fire(events.hiredCook);
}

with(closest_sentient){
    scr_crew_follow_player();
}               

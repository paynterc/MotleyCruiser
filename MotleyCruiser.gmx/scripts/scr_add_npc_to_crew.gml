/// scr_add_npc_to_crew(npc obj)
closest_sentient=argument0;
if(closest_sentient==noone){
    return false;
}
global.crew = scr_push_array(global.crew,closest_sentient.npc_data);
with(closest_sentient){
    instance_change(obj_crew,true);
    scr_npc_map_to_object();
}
closest_sentient.crew_index = array_length_1d(global.crew)-1;
                        

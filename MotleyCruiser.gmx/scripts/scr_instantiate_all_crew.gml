/// Instantiate all members of crew
//scr_intantiate_all_crew(x,y)
if(global.crew==noone) return false;
var xx = argument0;
var yy = argument1;
var thiscrew = noone;
var crewMap = 0;
var raceMap = 0;
for(var i=0; i<array_length_1d(global.crew); i++){
    npc_data = scr_npc();// Do this in case we've added any extra attributes since the last game save.
    npc_data = scr_fill_array(npc_data,global.crew[i]);
    if(!npc_data[NPC_ACTIVE]) continue;
    thiscrew = instance_create(xx, yy, obj_crew);
    
    thiscrew.npc_data = npc_data;
    with(thiscrew){
        scr_npc_map_to_object();
    }
    thiscrew.crew_index = i;//Keep track of which crewmember this is, in case he dies.
    
}

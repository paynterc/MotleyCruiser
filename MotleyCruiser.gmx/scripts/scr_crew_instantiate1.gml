/// scr_crew_instantiate1(crewIndex,x,y)
// Instantiate 1 crewmember
var myCrewIndex = argument0;
var xx = argument1;
var yy = argument2;
var npc_data = scr_npc();// Do this in case we've added any extra attributes since the last game save.
npc_data = scr_fill_array(npc_data,global.crew[myCrewIndex]);
if(!npc_data[NPC_ACTIVE]) return noone;

thiscrew = instance_create(xx, yy, obj_npc);
thiscrew.npc_data = npc_data;
with(thiscrew){
    scr_npc_map_to_object();
    if(sprite_exists(npc_data[NPC_SPRITE_TEMP])){
        sprite_index = npc_data[NPC_SPRITE_TEMP];
    }  
    faction = FACTION_PLAYER;
    mode="follow";
    targetMtype = obj_player;// move to this object      
}
thiscrew.crew_index = myCrewIndex;//Keep track of which crewmember this is, in case he dies.

return thiscrew;
    

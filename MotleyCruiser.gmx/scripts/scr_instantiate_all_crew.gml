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
    /***
    if(crewMap[NPC_SEX]==1){
        thiscrew.sprite_index=global.races[crewMap[NPC_RACE_INDEX], RACE_SPR_FML];
    }else{
        thiscrew.sprite_index=global.races[crewMap[NPC_RACE_INDEX], RACE_SPR];            
    }
    thiscrew.hp=crewMap[NPC_HP_CURRENT];
    thiscrew.hp_current=crewMap[NPC_HP_CURRENT];
    thiscrew.pspeed=crewMap[NPC_RUN_SPD];
    thiscrew.global_index = crewMap[NPC_GLOBAL_INDEX];
    ***/
    thiscrew.crew_index = i;
    

}

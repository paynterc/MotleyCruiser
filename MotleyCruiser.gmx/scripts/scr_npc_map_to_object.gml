/// Copy npc map data to npc object vars. Run this inside the npc object
// after the npc_data map has already been copied to it. This should work for crew and cantina npcs

if(npc_data[NPC_SEX]==1){
    sprite_index=global.races[npc_data[NPC_RACE_INDEX], RACE_SPR_FML];
}else{
    sprite_index=global.races[npc_data[NPC_RACE_INDEX], RACE_SPR];            
}

hp=npc_data[NPC_HP_CURRENT];
hp_current=npc_data[NPC_HP_CURRENT];
pspeed=npc_data[NPC_RUN_SPD];
global_index = npc_data[NPC_GLOBAL_INDEX];
name = npc_data[NPC_NAME];
race_index = npc_data[NPC_RACE_INDEX];
hire_price = npc_data[NPC_HIRE_PRICE];

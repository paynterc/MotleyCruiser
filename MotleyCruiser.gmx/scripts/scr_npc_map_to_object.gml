/// Copy npc map data to npc object vars. Run this inside the npc object
// after the npc_data map has already been copied to it. This should work for crew and cantina npcs

sprite_index=npc_data[NPC_SPRITE];
hp=npc_data[NPC_HP];
hp_current=npc_data[NPC_HP_CURRENT];
pspeed=npc_data[NPC_RUN_SPD];
pspeed_init = pspeed;
global_index = npc_data[NPC_GLOBAL_INDEX];
name = npc_data[NPC_NAME];
race_index = npc_data[NPC_RACE_INDEX];
hire_price = npc_data[NPC_HIRE_PRICE];

skincolor = scr_get_array_1d(npc_data,NPC_SKIN_COLOR);
accessories = scr_get_array_1d(npc_data,NPC_ACCESSORIES);

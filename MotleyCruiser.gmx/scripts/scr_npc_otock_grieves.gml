/// scr_npc_otock_grieves

var oldPirate = scr_npc();
oldPirate[NPC_NAME_FIRST] = "Otock";
oldPirate[NPC_NAME_LAST] = "Grieves";
oldPirate[NPC_NAME]="Otock Grieves";
oldPirate[NPC_TRAIT]=scr_array("greedy","lazy","snake in the grass");
oldPirate[NPC_OCCUPATION]=occupation.pilot;
oldPirate[NPC_SPRITE]=spr_otock_grieves;

return oldPirate;

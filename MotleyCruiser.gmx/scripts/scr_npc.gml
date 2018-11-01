/// Default values for npc
var npc = noone;

npc[NPC_RACE_INDEX]=0;
npc[NPC_NAME]="Slappy Brown";
npc[NPC_RUN_SPD]=1;
npc[NPC_HP]=10;
npc[NPC_HP_CURRENT]=10;
npc[NPC_NAME_FIRST]="Slappy";
npc[NPC_NAME_LAST]="Brown";
npc[NPC_MISSION]=noone;
npc[NPC_LOCATION]=noone;
npc[NPC_ACTIVE]=true;
npc[NPC_GLOBAL_INDEX]=noone;
npc[NPC_TRAIT]=noone;
npc[NPC_OCCUPATION]=noone;
npc[NPC_SEX]=0;// 0 male, 1 female, 2 ???
npc[NPC_HIRE_PRICE]=25;
npc[NPC_SPRITE]=noone;
var equip = noone;// Three slots
equip[2]=noone;
equip[1]=noone;
equip[0]=noone;
npc[NPC_EQUIPMENT]=equip;
npc[NPC_ACCESSORIES]=noone;// ARRAY OF arrays. Each array has a sprite_index and a color
npc[NPC_SKIN_COLOR]=c_white;// Tint the sprite with this color;
npc[NPC_SPRITE_TEMP]=noone;// replace this with a temporary sprite drawn with all accessories
npc[NPC_SPRITE_STRING]=noone;// Set this when saving the game

return npc;

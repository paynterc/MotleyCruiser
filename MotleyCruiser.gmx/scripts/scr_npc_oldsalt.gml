/// Default values for npc
var npc = scr_npc();

npc[NPC_RACE_INDEX]=1;
npc[NPC_NAME]="Old Salt";
npc[NPC_RUN_SPD]=1;
npc[NPC_HP]=10;
npc[NPC_HP_CURRENT]=10;
npc[NPC_NAME_FIRST]="Old";
npc[NPC_NAME_LAST]="Salt";
npc[NPC_MISSION]=noone;
npc[NPC_LOCATION]=noone;
npc[NPC_ACTIVE]=true;
npc[NPC_GLOBAL_INDEX]=noone;
var traits = noone;
traits[0]=TRAIT_KIND;
traits[1]=TRAIT_HONEST;
traits[2]=TRAIT_IMMORAL;
npc[NPC_TRAIT]=traits;
npc[NPC_OCCUPATION]=1;// pilot
npc[NPC_SEX]=0;// 0 male, 1 female, 2 ???
npc[NPC_HIRE_PRICE]=0;
npc[NPC_SPRITE]=spr_old_salt;
var equip = noone;// Three slots
equip[2]=noone;
equip[1]=noone;
equip[0]=51;
npc[NPC_EQUIPMENT]=equip;
return npc;

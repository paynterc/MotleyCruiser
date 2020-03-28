/// scr_kill_x_pirates(granter,killQty,illegal)

var granter = argument0;// Who granted the mission. A full NPC data array.
var killQty = argument1;
var illegal = argument2;

var mission = array_create(10);

//ds_map_add(mission,"id", global.mission_id);// Set the id and add to main map if the player accepts mission
mission[msnKillxy.mId] = noone;
mission[msnKillxy.type] = missionTypes.killXofY;
mission[msnKillxy.name] = "Desetroy pirates";
mission[msnKillxy.complete] = false;
mission[msnKillxy.npcText] = "The pirates in this sector are becoming a problem. Destroy " + string(killQty) + " of their ships and I'll make it worth your while.";
mission[msnKillxy.description] = "Destroy pirate ships in sector " + string(global.sector_x) + "," + string(global.sector_y) + ".";
mission[msnKillxy.illegal] = false;
mission[msnKillxy.rewards] = scr_array(scr_array("G",300),scr_array("I",59,1));
mission[msnKillxy.stage] = 0;
mission[msnKillxy.objectives] = noone;

var objective0 = noone;
objective0[msnKillxy.type] = missionTypes.killXofY;
objective0[msnKillxy.killType] = "ship";
objective0[msnKillxy.killFaction] = FACTION_PIRATE;
objective0[msnKillxy.killedRequired] = killQty;
objective0[msnKillxy.killedCurrent] = 0;
objective0[msnKillxy.sectorX] = global.sector_x;
objective0[msnKillxy.sectorY] = global.sector_y;
objective0[msnKillxy.complete] = false;
objective0[msnKillxy.description] = "Destroy pirate ships in sector " + string(global.sector_x) + "," + string(global.sector_y) + ".";


var objective1 = noone;
objective1[msnSpeakToName.type] = missionTypes.speakToName;
objective1[msnSpeakToName.location] = global.landed_on;
objective1[msnSpeakToName.npc] = granter;
objective1[msnSpeakToName.sectorX] = global.sector_x;
objective1[msnSpeakToName.sectorY] = global.sector_y;
objective1[msnSpeakToName.description] = "Return to "+granter[NPC_NAME]+" on "+ global.landed_on[LOC_NAME] +" in sector " + string(global.sector_x) + "," + string(global.sector_y) + ".";
objective1[msnSpeakToName.complete] = false;
objective1[msnSpeakToName.npcText] = "Good job. Here is you're reward.";


mission[msnKillxy.objectives] = scr_array(objective0,objective1);


return mission;


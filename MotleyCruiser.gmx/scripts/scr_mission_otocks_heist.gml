/// scr_kill_x_pirates(granter,killQty,illegal)

var granter = argument0;// Who granted the mission. A full NPC data array.
var killQty = argument1;
var illegal = argument2;

var mission = ds_map_create();

//ds_map_add(mission,"id", "xxxx");// Set the id and add to main map if the player accepts mission
ds_map_add(mission,"type", missionTypes.killXofY);//smuggle, deliver, bounty, hit, escort, obtain
ds_map_add(mission,"name", "Destroy pirate ships in sector " + string(global.sector_x) + "," + string(global.sector_y) + ".");
ds_map_add(mission,"complete", false);
ds_map_add(mission,"text", "Kill a priate for me and then we can talk. Destroy " + string(killQty) + " of their ships and I'll make it worth your while.");
ds_map_add(mission,"description", "Destroy pirate ships in sector " + string(global.sector_x) + "," + string(global.sector_y) + ".");// array[x,y];
ds_map_add(mission,"illegal", false);// keep track of objective stages
ds_map_add(mission,"rewards", scr_array(scr_array("G",300),scr_array("I",59,1)));//credits, item, crew, ship, map
ds_map_add(mission,"stage", 0);// keep track of objective stages
//ds_map_add(mission,"stageCount", 2);// Count of objectives. This is set in scr_mission_add_objective

var objective0 = ds_map_create();
ds_map_add(objective0,"type", missionTypes.killXofY);//smuggle, deliver, bounty, hit, escort, obtain
ds_map_add(objective0,"killType", "ship");
ds_map_add(objective0,"killFaction", FACTION_PIRATE);
ds_map_add(objective0,"killedRequired", killQty);
ds_map_add(objective0,"killedCurrent", 0);
ds_map_add(objective0,"sectorX", global.sector_x);
ds_map_add(objective0,"sectorY", global.sector_y);
ds_map_add(objective0,"description", granter[NPC_NAME]+ " wants you to destroy pirate ships in sector " + string(global.sector_x) + "," + string(global.sector_y) + ".");// array[x,y];
ds_map_add(objective0,"complete", false);
scr_mission_add_objective(mission,objective0);

var objective1 = ds_map_create();
ds_map_add(objective1,"type", missionTypes.speakToName);//smuggle, deliver, bounty, hit, escort, obtain
ds_map_add(objective1,"location", global.landed_on[LOC_GLOBAL_INDEX]);
ds_map_add(objective1,"npc", granter[NPC_GLOBAL_INDEX]);
ds_map_add(objective1,"sectorX", global.sector_x);
ds_map_add(objective1,"sectorY", global.sector_y);
ds_map_add(objective1,"description", "Return to "+granter[NPC_NAME]+" on "+ global.landed_on[LOC_NAME] +" in sector " + string(global.sector_x) + "," + string(global.sector_y) + ".");// array[x,y];
ds_map_add(objective1,"complete", false);
ds_map_add(objective1,"npcText", "Good job. Here is you're reward.");
scr_mission_add_objective(mission,objective1);


return mission;


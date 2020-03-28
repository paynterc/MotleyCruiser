/// scr_mission_type_test1(granter)

var granter = argument0;// Who granted the mission. A full NPC data array.
var mission = ds_map_create();

//ds_map_add(mission,"id", global.mission_id);// Set the id and add to main map if the player accepts mission
ds_map_add(mission,"type", missionTypes.speakToName);//smuggle, deliver, bounty, hit, escort, obtain
ds_map_add(mission,"name", "Test mission");
ds_map_add(mission,"complete", false);
ds_map_add(mission,"text", "Test speak to name");
ds_map_add(mission,"description", "Test mission Speak to" + scr_get_array_1d(granter,NPC_NAME));// array[x,y];
ds_map_add(mission,"illegal", false);// keep track of objective stages
ds_map_add(mission,"rewards", scr_array(scr_array("G",300),scr_array("I",59,1)));//credits, item, crew, ship, map
ds_map_add(mission,"stage", 0);// keep track of objective stages

var objective0 = ds_map_create();
ds_map_add(objective0,"type", missionTypes.speakToName);//smuggle, deliver, bounty, hit, escort, obtain
ds_map_add(objective0,"location", global.landed_on[LOC_GLOBAL_INDEX]);
ds_map_add(objective0,"npc", granter[NPC_GLOBAL_INDEX]);
ds_map_add(objective0,"sectorX", global.sector_x);
ds_map_add(objective0,"sectorY", global.sector_y);
ds_map_add(objective0,"description", "Return to "+granter[NPC_NAME]+" on "+ global.landed_on[LOC_NAME] +" in sector " + string(global.sector_x) + "," + string(global.sector_y) + ".");// array[x,y];
ds_map_add(objective0,"complete", false);
ds_map_add(objective0,"npcText", "Thanks for your help.");
scr_mission_add_objective(mission,objective0);


return mission;


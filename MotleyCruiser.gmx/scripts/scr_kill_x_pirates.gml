/// scr_kill_x_pirates(granter,killQty,illegal)

var granter = argument0;// Who granted the mission. A full NPC data array.
var killQty = argument1;
var illegal = argument2;

var mission = ds_map_create();

//ds_map_add(mission,"id", "xxxx");// Set the id and add to main map if the player accepts mission
ds_map_add(mission,"type", missionTypes.killXofY);//smuggle, deliver, bounty, hit, escort, obtain
ds_map_add(mission,"name", "Destroy pirate ships in sector " + string(global.sector_x) + "," + string(global.sector_y) + ".");
ds_map_add(mission,"complete", false);
ds_map_add(mission,"text", "The pirates in this sector are becoming a problem. Destroy " + string(killQty) + " of their ships and I'll make it worth your while.");
ds_map_add(mission,"description", "Destroy pirate ships in sector " + string(global.sector_x) + "," + string(global.sector_y) + ".");// array[x,y];
ds_map_add(mission,"illegal", false);// keep track of objective stages
ds_map_add(mission,"rewards", scr_array(scr_array("G",300),scr_array("I",59,1)));//credits, item, crew, ship, map
ds_map_add(mission,"stage", 0);// keep track of objective stages

ds_map_add(mission,"objectives", scr_array("Destroy pirates.","Return to " + granter[NPC_NAME] + " for your reward."));
ds_map_add(mission,"killType", "ship");
ds_map_add(mission,"killFaction", FACTION_PIRATE);
ds_map_add(mission,"killedRequired", killQty);
ds_map_add(mission,"killedCurrent", 0);
ds_map_add(mission,"sectorX", global.sector_x);
ds_map_add(mission,"sectorY", global.sector_y);
ds_map_add(mission,"returnToPlanet", global.landed_on);
ds_map_add(mission,"returnToNPC", granter);


return mission;


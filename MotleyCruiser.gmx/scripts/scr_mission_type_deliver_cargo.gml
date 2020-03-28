/// scr_mission_type_deliver_cargo(granter,commodityKey,qty,illegal)

var granter = argument0;// Who granted the mission. A full NPC data array.
var commodityKey = argument1;
var qty = argument2;
var illegal = argument3;

var commodityName = scr_commodity_lib_read(commodityKey,0);

var check = 1;
if( is_undefined(commodityName)){
    return undefined;
}
if(!qty){
    qty=1;
}

var mission = ds_map_create();

//ds_map_add(mission,"id", "xxx");// Set the id and add to main map if the player accepts mission
ds_map_add(mission,"type", missionTypes.deliverCargo);//smuggle, deliver, bounty, hit, escort, obtain
ds_map_add(mission,"name", "Deliver " + string(commodityName) + " to " + global.landed_on[LOC_NAME] + " in sector " + string(global.sector_x) + "," + string(global.sector_y) + ".");
ds_map_add(mission,"complete", false);
ds_map_add(mission,"text", "We're in desperate need of " + string(commodityName) + " here. Sell "+ string(qty) + " units to our merchant and then come talke to me.");
ds_map_add(mission,"description", "Deliver " + string(commodityName) + " to " + global.landed_on[LOC_NAME] + " in sector " + string(global.sector_x) + "," + string(global.sector_y) + ".");// array[x,y];
ds_map_add(mission,"illegal", false);// keep track of objective stages
ds_map_add(mission,"rewards", scr_array(scr_array("G",300),scr_array("I",59,1)));//credits, item, crew, ship, map
ds_map_add(mission,"stage", 0);// keep track of the current stage
//ds_map_add(mission,"stageCount", 2);// This will be set in scr_mission_add_objective

var objective0 = ds_map_create();
ds_map_add(objective0,"type", missionTypes.deliverCargo);//smuggle, deliver, bounty, hit, escort, obtain
ds_map_add(objective0,"description", "Deliver " +  string(commodityName)  + " to " + granter[NPC_NAME]+" on "+ global.landed_on[LOC_NAME] +" in sector " + string(global.sector_x) + "," + string(global.sector_y) + ".");// array[x,y];
ds_map_add(objective0,"complete", false);
ds_map_add(objective0,"sectorX", global.sector_x);
ds_map_add(objective0,"sectorY", global.sector_y);
ds_map_add(objective0,"location", global.landed_on[LOC_GLOBAL_INDEX]);
ds_map_add(objective0,"npcText", "Thanks, you've done a good thing.");
ds_map_add(objective0,"commodityKey", commodityKey);
ds_map_add(objective0,"commodityQty", qty);
ds_map_add(objective0,"commodityQtyRemaining", qty);
scr_mission_add_objective(mission,objective0);

var objective1 = ds_map_create();
ds_map_add(objective1,"type", missionTypes.speakToName);//smuggle, deliver, bounty, hit, escort, obtain
ds_map_add(objective1,"location", global.landed_on[LOC_GLOBAL_INDEX]);
ds_map_add(objective1,"npc", granter[NPC_GLOBAL_INDEX]);
ds_map_add(objective1,"sectorX", global.sector_x);
ds_map_add(objective1,"sectorY", global.sector_y);
ds_map_add(objective1,"description", "Return to "+granter[NPC_NAME]+" on "+ global.landed_on[LOC_NAME] +" in sector " + string(global.sector_x) + "," + string(global.sector_y) + ".");// array[x,y];
ds_map_add(objective1,"complete", false);
ds_map_add(objective1,"npcText", "Thanks for your help.");
scr_mission_add_objective(mission,objective1);


return mission;


/// scr_mission_what_otock_wants(OtocksGlobalIndex)

var otocksIndex = argument0;
var oldPirate = global.gx_people[| otocksIndex];
var npcName = scr_get_array_1d(oldPirate,NPC_NAME);

var sectorX, sectorY;
var loc = global.landed_on;
if(loc == noone){
    return undefined
}

var locSec = scr_get_array_1d(loc,LOC_SECTOR);
if(is_array(locSec)){
    sectorX = locSec[0];
    sectorY = locSec[1];
}else{
    return undefined;
}


var illegal = false;

var mission = ds_map_create();


//ds_map_add(mission,"id", "xxx");// Set the id and add to main map if the player accepts mission
ds_map_add(mission,"type", missionTypes.speakToName);//smuggle, deliver, bounty, hit, escort, obtain
ds_map_add(mission,"name", "The Old Pirate.");
ds_map_add(mission,"complete", false);
ds_map_add(mission,"text", "");
ds_map_add(mission,"description", "Find " + string(npcName) + " at " + loc[LOC_NAME] + " to sector " + string(sectorX) + "," + string(sectorY) + ".");
ds_map_add(mission,"illegal", false);// keep track of objective stages
ds_map_add(mission,"rewards", scr_array());//credits, item, crew, ship, map
ds_map_add(mission,"stage", 0);// keep track of the current stage
ds_map_add(mission,"npc", oldPirate[NPC_GLOBAL_INDEX]);
// GRANT ANOTHER MISSION HERE


var objective1 = ds_map_create();
ds_map_add(objective1,"type", missionTypes.speakToName);//smuggle, deliver, bounty, hit, escort, obtain
ds_map_add(objective1,"location", loc[LOC_GLOBAL_INDEX]);
ds_map_add(objective1,"npc", oldPirate[NPC_GLOBAL_INDEX]);
ds_map_add(objective1,"sectorX", sectorX);
ds_map_add(objective1,"sectorY", sectorY);
ds_map_add(objective1,"description", "Speak with "+oldPirate[NPC_NAME]+" in the cantina.");// array[x,y];
ds_map_add(objective1,"complete", false);
ds_map_add(objective1,"npcText", "I'll need you to do a job for me.");
scr_mission_add_objective(mission,objective1);


return mission;


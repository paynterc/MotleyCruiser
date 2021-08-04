/// scr_mission_find_captain()



var oldPirate = scr_npc_otock_grieves();
var npcName = scr_get_array_1d(oldPirate,NPC_NAME);

// Add Otock to the global index of characters.
scr_gx_people_add(oldPirate);

var sectorX, sectorY;
var loc = scr_array_random(global.passengerLocs);
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
ds_map_add(mission,"text", "So you lost you're family to slavers? They've broken many a family around here. I met an old pirate once. At least he said he was a pirate. Said his captain would sell prisoners to the slavers now and then. He might be able to tell you how to find their ships.
Last I saw him, he was at " + loc[LOC_NAME] + " in sector " + string(sectorX) + "," + string(sectorY) + ". He didn't look like he was going anywhere.");
ds_map_add(mission,"description", "Find " + string(npcName) + " at " + loc[LOC_NAME] + " to sector " + string(sectorX) + "," + string(sectorY) + ".");
ds_map_add(mission,"illegal", false);// keep track of objective stages
ds_map_add(mission,"rewards", scr_array(scr_array("G",300),scr_array("I",59,1)));//credits, item, crew, ship, map
ds_map_add(mission,"stage", 0);// keep track of the current stage
ds_map_add(mission,"npc", oldPirate[NPC_GLOBAL_INDEX]);
ds_map_add(mission,"completionScript","scr_mission_grant_s1_2," + string(oldPirate[NPC_GLOBAL_INDEX]));
//ds_map_add(mission,"stageCount", 2);// This will be set in scr_mission_add_objective


var objective1 = ds_map_create();
ds_map_add(objective1,"type", missionTypes.speakToName);//smuggle, deliver, bounty, hit, escort, obtain
ds_map_add(objective1,"location", loc[LOC_GLOBAL_INDEX]);
ds_map_add(objective1,"npc", oldPirate[NPC_GLOBAL_INDEX]);
ds_map_add(objective1,"sectorX", sectorX);
ds_map_add(objective1,"sectorY", sectorY);
ds_map_add(objective1,"description", "Speak with "+oldPirate[NPC_NAME]+" in the cantina.");// array[x,y];
ds_map_add(objective1,"complete", false);
ds_map_add(objective1,"npcText", "You want me to tell you about slavers? Maybe I can help you, but you'll need to do something for me first. Come and talk to me later am we'll discuss details.");
scr_mission_add_objective(mission,objective1);


return mission;


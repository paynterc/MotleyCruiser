/// scr_mission_type_deliver_passenger(granter,loc)

var args = noone;
for (var i=0; i<8; i++)
{
    if (i < argument_count)
        args[i] = argument[i];
    else
        args[i] = noone;
}

var granter = args[0];// Who granted the mission. A full NPC data array.
var loc = args[1];
var illegal = args[2];
var sectorX, sectorY;


if(loc == noone){
    return undefined
}
var npcName = scr_get_array_1d(granter,NPC_NAME);
if(npcName == noone){
    return undefined;
}

var locSec = scr_get_array_1d(loc,LOC_SECTOR);
if(is_array(locSec)){
    sectorX = locSec[0];
    sectorY = locSec[1];
}else{
    return undefined;
}




if illegal==noone illegal = false;

var mission = ds_map_create();


//ds_map_add(mission,"id", "xxx");// Set the id and add to main map if the player accepts mission
ds_map_add(mission,"type", missionTypes.deliverPassenger);//smuggle, deliver, bounty, hit, escort, obtain
ds_map_add(mission,"name", "Deliver " + string(npcName) + " to " + loc[LOC_NAME] + " to sector " + string(sectorX) + "," + string(sectorY) + ".");
ds_map_add(mission,"complete", false);
ds_map_add(mission,"text", "I need passage to "+ loc[LOC_NAME]+" in sector " + string(sectorX) + "," + string(sectorY) + ". I'll make it worth your while.");
ds_map_add(mission,"description", "Deliver " + string(npcName) + " to " + loc[LOC_NAME] + " to sector " + string(sectorX) + "," + string(sectorY) + ".");
ds_map_add(mission,"illegal", false);// keep track of objective stages
ds_map_add(mission,"rewards", scr_array(scr_array("G",300),scr_array("I",59,1)));//credits, item, crew, ship, map
ds_map_add(mission,"stage", 0);// keep track of the current stage
ds_map_add(mission,"npc", granter[NPC_GLOBAL_INDEX]);
//ds_map_add(mission,"stageCount", 2);// This will be set in scr_mission_add_objective

// This should fire when the player lands at any port in the target sector
var objective0 = ds_map_create();
ds_map_add(objective0,"type", missionTypes.deliverPassenger);//smuggle, deliver, bounty, hit, escort, obtain
ds_map_add(objective0,"description", "Deliver your passenger");// array[x,y];
ds_map_add(objective0,"complete", false);
ds_map_add(objective0,"sectorX", sectorX);
ds_map_add(objective0,"sectorY", sectorY);
ds_map_add(objective0,"location", loc[LOC_GLOBAL_INDEX]);
scr_mission_add_objective(mission,objective0);

var objective1 = ds_map_create();
ds_map_add(objective1,"type", missionTypes.speakToName);//smuggle, deliver, bounty, hit, escort, obtain
ds_map_add(objective1,"location", loc[LOC_GLOBAL_INDEX]);
ds_map_add(objective1,"npc", granter[NPC_GLOBAL_INDEX]);
ds_map_add(objective1,"sectorX", sectorX);
ds_map_add(objective1,"sectorY", sectorY);
ds_map_add(objective1,"description", "Speak with "+granter[NPC_NAME]+" in the cantina.");// array[x,y];
ds_map_add(objective1,"complete", false);
ds_map_add(objective1,"npcText", "Thanks for your help.");
scr_mission_add_objective(mission,objective1);


return mission;


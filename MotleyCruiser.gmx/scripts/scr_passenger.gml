/// scr_passenger(granter_id)

var granter_id = argument0;// Who granted the mission.
var granter = global.npcs[granter_id];
var granter_loc = scr_str_split(granter[NPC_LOCATION],",");
var dest_type = choose("planet","moon","station");
var tg = scr_find_random_mission_target(dest_type,2,granter[NPC_LOCATION]);
if(tg == noone) return noone;



var tg_sector=noone;
var tg_name = noone;
var tg_index = noone;
switch(dest_type){

    case("planet"):
        tg_sector = tg[PLANET_SECTOR];
        tg_name = tg[PLANET_NAME];
        tg_index = tg[PLANET_GLOBAL_INDEX];
        break;
    case("moon"):
        tg_sector = tg[MOON_SECTOR];
        tg_name = tg[MOON_NAME];
        tg_index = tg[MOON_GLOBAL_INDEX];
        break;
    case("station"):
        tg_sector = tg[STATION_SECTOR];
        tg_name = tg[STATION_NAME];
        tg_index = tg[STATION_GLOBAL_INDEX];
        break;
}



var mission = scr_make_mission();
mission[MISSION_TEXT]="I need you to deliver me to "+ dest_type + " " + tg_name[0] + " in sector " + string(tg_sector[0]) + " " + string(tg_sector[1]) + ".";
mission[MISSION_TYPE]="passenger";
mission[MISSION_REWARD]="cr,500";
mission[MISSION_SCRIPT_START]="scr_add_npc_to_crew";
mission[MISSION_GRANTED_BY]=granter_id;


var objectives = noone;

var ob = scr_mission_objective();
ob[OBJECTIVE_DESCRIPTION]="Deliver passenger " + granter[NPC_NAME] + " to "+dest_type + " " + tg_name[0] + " in sector " + string(tg_sector[0]) + " " + string(tg_sector[1]) + ".";
ob[OBJECTIVE_TYPE]="deliver_passenger";
ob[OBJECTIVE_TARGET_TYPE]=dest_type;
ob[OBJECTIVE_TARGET_INDEX]=tg_index;
ob[OBJECTIVE_REQUIRED_NPC]=granter_id;
ob[OBJECTIVE_STATE]="active";
ob[OBJECTIVE_MISSION_ID]=mission[MISSION_ID];
objectives[0]=ob;

var ob = scr_mission_objective();
ob[OBJECTIVE_DESCRIPTION]="Say farewell to " + granter[NPC_NAME] + " at "+dest_type + " " + tg_name[0] + " in sector " + string(tg_sector[0]) + " " + string(tg_sector[1]) + ".";
ob[OBJECTIVE_TYPE]="visit";
ob[OBJECTIVE_TARGET_TYPE]="npc";
ob[OBJECTIVE_TARGET_INDEX]=granter_id;
ob[OBJECTIVE_MISSION_ID]=mission[MISSION_ID];
objectives[1]=ob;

mission[MISSION_OBJECTIVES]=objectives;


return mission;

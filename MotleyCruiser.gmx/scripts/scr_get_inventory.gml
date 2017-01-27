/// Generate a mission. These will hopefully be randomly generated later.
// Granter_id should always be set.
// scr_generate_mission(granter_id);


var granter_id = argument0;// Who granted the mission.
var granter = global.npcs[granter_id];
var granter_loc = scr_str_split(granter[NPC_LOCATION],",");
var gloc = scr_location_translate(granter_loc[0],granter_loc[1]);

var target_id = scr_find_random_mission_target("npc",1,granter[NPC_LOCATION]);
if(target_id == noone) return noone;
var td = global.npcs[target_id];//target data
var td_loc = scr_str_split(td[NPC_LOCATION],",");
var tloc = scr_location_translate(td_loc[0],td_loc[1]);

var mission = scr_make_mission();
mission[MISSION_TEXT]="I need you to bring me an item from "+td[NPC_NAME]+ " on " + td_loc[0] + " " + tloc[LOC_NAME_1] + " in sector " + td_loc[3] + "," + td_loc[2];
mission[MISSION_TYPE]="get";
mission[MISSION_REWARD]="cr,100";
mission[MISSION_GRANTED_BY]=granter_id;

var objectives = noone;

var ob = scr_mission_objective();
ob[OBJECTIVE_DESCRIPTION]="Get the item from "+td[NPC_NAME];
ob[OBJECTIVE_TYPE]="visit";
ob[OBJECTIVE_TARGET_TYPE]="npc";
ob[OBJECTIVE_TARGET_INDEX]=target_id;
ob[OBJECTIVE_STATE]="active";
ob[OBJECTIVE_MISSION_ID]=mission[MISSION_ID];
ob[OBJECTIVE_SCRIPT_END]="inventory_item_add,25,1";
objectives[0]=ob;




var ob = scr_mission_objective();
ob[OBJECTIVE_DESCRIPTION]="Return to "+granter[NPC_NAME]+" on " + granter_loc[0] + " " + gloc[LOC_NAME_1] + " in sector " + granter_loc[3] + "," + granter_loc[2];
ob[OBJECTIVE_TYPE]="deliver";
ob[OBJECTIVE_TARGET_TYPE]="npc";
ob[OBJECTIVE_TARGET_INDEX]=granter_id;
ob[OBJECTIVE_MISSION_ID]=mission[MISSION_ID];
ob[OBJECTIVE_REQUIRED_INVENTORY]=25;
objectives[1]=ob;


mission[MISSION_OBJECTIVES]=objectives;
    

return mission;

/// Generate a mission. These will hopefully be randomly generated later.
// We may not need to send a target_id in later versions. granter_id should always be set.
// scr_generate_mission(granter_id);


var granter_id = argument0;// Who granted the mission.
var granter = global.npcs[granter_id];
var granter_loc = scr_str_split(granter[NPC_LOCATION],",");

var target_id = scr_find_random_mission_target("npc",1,granter[NPC_LOCATION]);
if(target_id == noone) return noone;
var td = global.npcs[target_id];//target data
var td_loc = scr_str_split(td[NPC_LOCATION],",");

//var inv_item = 


var mission = scr_make_mission();
mission[MISSION_TEXT]="I need you to deliver an item to "+td[NPC_NAME]+ " on " + td_loc[0] + " " + td_loc[1] + " in sector " + td_loc[2] + "," + td_loc[3];
mission[MISSION_TYPE]="deliver";
mission[MISSION_REWARD]="cr,100";
mission[MISSION_GRANT_INVENTORY_START]=25;
mission[MISSION_SCRIPT_START]="inventory_item_add,25,1";


var objectives = noone;

var ob = scr_mission_objective();
ob[OBJECTIVE_DESCRIPTION]="Deliver the item to "+td[NPC_NAME];
ob[OBJECTIVE_TYPE]="deliver";
ob[OBJECTIVE_TARGET_TYPE]="npc";
ob[OBJECTIVE_TARGET_INDEX]=target_id;
ob[OBJECTIVE_REQUIRED_INVENTORY]=25;
ob[OBJECTIVE_STATE]="active";
ob[OBJECTIVE_MISSION_ID]=mission[MISSION_ID];
objectives[0]=ob;


var ob = scr_mission_objective();
ob[OBJECTIVE_DESCRIPTION]="Return to "+granter[NPC_NAME]+" on " + granter_loc[0] + " " + granter_loc[1] + " in sector " + granter_loc[2] + "," + granter_loc[3];
ob[OBJECTIVE_TYPE]="visit";
ob[OBJECTIVE_TARGET_TYPE]="npc";
ob[OBJECTIVE_TARGET_INDEX]=granter_id;
ob[OBJECTIVE_MISSION_ID]=mission[MISSION_ID];
objectives[1]=ob;


mission[MISSION_OBJECTIVES]=objectives;
    

return mission;

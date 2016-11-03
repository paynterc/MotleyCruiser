/// Generate a mission. These will hopefully be randomly generated later.
// We may not need to send a target_id in later versions. granter_id should always be set.
// scr_generate_mission(target_id, granter_id);


var target_id = argument0;// Who do we need to visit.
var granter_id = argument1;// Who granted the mission.


var td = global.npcs[target_id];//target data
var granter = global.npcs[granter_id];

var mission = scr_make_mission();
mission[MISSION_TEXT]="I need you to deliver an item to "+td[NPC_NAME];
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
ob[OBJECTIVE_DESCRIPTION]="Return to "+granter[NPC_NAME]+" at PLANET FOO in Sector XX,YY for your reward.";
ob[OBJECTIVE_TYPE]="visit";
ob[OBJECTIVE_TARGET_TYPE]="npc";
ob[OBJECTIVE_TARGET_INDEX]=granter_id;
ob[OBJECTIVE_MISSION_ID]=mission[MISSION_ID];
objectives[1]=ob;
    
mission[MISSION_OBJECTIVES]=objectives;
    

return mission;

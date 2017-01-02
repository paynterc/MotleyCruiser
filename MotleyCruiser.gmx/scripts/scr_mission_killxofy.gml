///scr_mission_killxofy(granter_id)

/// Generate a mission. These will hopefully be randomly generated later.
// We may not need to send a target_id in later versions. granter_id should always be set.
// scr_generate_mission(granter_id);


var granter_id = argument0;// Who granted the mission.
var granter = global.npcs[granter_id];
var granter_loc = scr_str_split(granter[NPC_LOCATION],",");


//var inv_item = 


var mission = scr_make_mission();
mission[MISSION_TEXT]="The pirates in this sector have gotten out of control. Take out 3 of their ships and I'll see that you are rewarded.";
mission[MISSION_TYPE]="kill_x_of_y";
mission[MISSION_REWARD]="cr,300";
mission[MISSION_GRANTED_BY]=granter_id;

var objectives = noone;

var ob = scr_mission_objective();
ob[OBJECTIVE_DESCRIPTION]="Destroy 3 pirate ships in sector " + granter_loc[2] + "," + granter_loc[3] + ".";
ob[OBJECTIVE_TYPE]="kill_x_of_y";
ob[OBJECTIVE_TARGET_FACTION]=FACTION_PIRATE;
ob[OBJECTIVE_TARGET_COUNT]=3;
ob[OBJECTIVE_TARGET_COUNT_CURRENT]=0;
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

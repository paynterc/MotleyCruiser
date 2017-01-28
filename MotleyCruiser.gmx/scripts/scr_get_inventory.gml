/// Generate a mission. These will hopefully be randomly generated later.
// Granter_id should always be set.
// scr_get_inventory(granter_id);

var mission = scr_make_mission();
var granter_id = argument0;// Who granted the mission.
var granter = global.npcs[granter_id];
var granter_loc = scr_str_split(granter[NPC_LOCATION],",");
var gloc = scr_location_translate(granter_loc[0],granter_loc[1]);

var target_id = scr_find_random_mission_target("npc",1,granter[NPC_LOCATION]);
if(target_id == noone) return noone;
var td = global.npcs[target_id];//target data
var td_loc = scr_str_split(td[NPC_LOCATION],",");
var tloc = scr_location_translate(td_loc[0],td_loc[1]);
var criminal = scr_has_trait(TRAIT_IMMORAL,granter[NPC_TRAIT]);

var inv_item=noone;
var credits=0;


var mission = scr_make_mission();


var illegal = false;
if(criminal){
    var odds =3;
    if(irandom(odds)==odds){
        illegal = true;
    }
}


if(illegal){
    mission[MISSION_ILLEGAL]=true;
    var c_odds = 3;
    if(irandom(c_odds)==c_odds){
        var contraband = scr_contraband();
        inv_item = scr_array_random(contraband);
        credits=500;
    }else{
        inv_item = irandom(53);
        credits = 300;
    }

}else{
    inv_item = irandom(53);
    credits = 200;
}

var item_name = item_id_read(inv_item,0);

var mtext = "I need you to bring me a shipment of "+item_name+" from "+td[NPC_NAME]+ " on " + td_loc[0] + " " + tloc[LOC_NAME_1] + " in sector " + td_loc[3] + "," + td_loc[2] + ".";
if(mission[MISSION_ILLEGAL]){
    mtext += " I need you to be discreet about this and avoid the authorities. You will be well rewarded.";
}


mission[MISSION_TEXT]=mtext;
mission[MISSION_TYPE]="get";
mission[MISSION_REWARD]="cr,"+string(credits);
mission[MISSION_GRANTED_BY]=granter_id;

var objectives = noone;

var ob = scr_mission_objective();
ob[OBJECTIVE_DESCRIPTION]="Get "+item_name+" item from "+td[NPC_NAME];
ob[OBJECTIVE_TYPE]="visit";
ob[OBJECTIVE_TARGET_TYPE]="npc";
ob[OBJECTIVE_TARGET_INDEX]=target_id;
ob[OBJECTIVE_STATE]="active";
ob[OBJECTIVE_MISSION_ID]=mission[MISSION_ID];
ob[OBJECTIVE_SCRIPT_END]="inventory_item_add,"+string(inv_item)+",1";
objectives[0]=ob;


var ob = scr_mission_objective();
ob[OBJECTIVE_DESCRIPTION]="Return to "+granter[NPC_NAME]+" on " + granter_loc[0] + " " + gloc[LOC_NAME_1] + " in sector " + granter_loc[3] + "," + granter_loc[2];
ob[OBJECTIVE_TYPE]="deliver";
ob[OBJECTIVE_TARGET_TYPE]="npc";
ob[OBJECTIVE_TARGET_INDEX]=granter_id;
ob[OBJECTIVE_MISSION_ID]=mission[MISSION_ID];
ob[OBJECTIVE_REQUIRED_INVENTORY]=inv_item;
objectives[1]=ob;


mission[MISSION_OBJECTIVES]=objectives;
    

return mission;

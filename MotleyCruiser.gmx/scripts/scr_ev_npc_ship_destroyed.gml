/// Run this inside the npc object
// scr_ev_npc_ship_destroyed()

// Check for mission update
for(var i=0; i<array_length_1d(global.missions); i++){
    var thismission = global.missions[i];
    if(thismission[MISSION_STATE]!="active") continue;
    if(thismission[MISSION_TYPE]=="kill_x_of_y"){
        //Check objectives
        var obs = thismission[MISSION_OBJECTIVES];
        for(var o = 0; o<array_length_1d(obs); o++){
            var ob = obs[o];
            if(ob[OBJECTIVE_STATE]!="active") continue;
            if(ob[OBJECTIVE_TYPE]=="kill_x_of_y"
            && ob[OBJECTIVE_TARGET_FACTION] == faction)
            {
                ob[@ OBJECTIVE_TARGET_COUNT_CURRENT]++;
                if( ob[@ OBJECTIVE_TARGET_COUNT_CURRENT] >= ob[OBJECTIVE_TARGET_COUNT]){
                    scr_complete_objective(ob[OBJECTIVE_ID],noone,noone);
                }
            }
        }
    }
}


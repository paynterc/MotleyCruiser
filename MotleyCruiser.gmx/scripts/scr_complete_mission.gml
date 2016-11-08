/// Check all objectives. If all are complete, set mission to complete, provide reward and run any associated scripts
// scr_complete_mission(mission_id)

var mission = scr_find_mission(argument0);
var complete = false;


if(mission==noone) return false;

if(mission[MISSION_STATE]=="complete") return false;//Can't complete a mission twice.

var objectives = mission[MISSION_OBJECTIVES];
var obcount = array_length_1d(objectives);
var complete_count = 0;
if(obcount>0){
    for(var i = 0; i<obcount; i++){
        var obchx = objectives[i];
        if(obchx[OBJECTIVE_STATE]=="complete"){
            complete_count ++;
        }
    }
}
if(complete_count==obcount){
    // All objectives are complete
    complete = true;
    mission[@ MISSION_STATE]="complete";
    scr_grant_reward(mission[MISSION_REWARD]);
}

return complete;

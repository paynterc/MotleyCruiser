/****
crewmate died. Send notification
****/
/// scr_ev_crew_died(crew_index)
var ci = argument0;// Crew index
var crewMate = scr_get_array_1d(global.crew,ci);
if(crewMate!=noone){
    
    // Deactivate in crew array. Don't remove, we need to retain indexes.
    scr_global_update(global.crew,ci,NPC_ACTIVE,false);
    
    // Remove from team (if they are on team)
    //global.team = scr_array_remove(global.team,ci);
    scr_team_remove_ci(ci);
    
    var txt = string(crewMate[NPC_NAME]) + " has died.";
    scr_ai_bark(txt);
}



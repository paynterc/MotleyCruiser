/// scr_crew_set_inactive(crewIndex)
var ci = argument0;
var check=1;
if(ci != noone){
    // Deactivate in crew array. Don't remove, we need to retain indexes.
    scr_global_update(global.crew,ci,NPC_ACTIVE,false);
    
    // Remove from team (if they are on team)
    scr_team_remove_ci(ci);
} 

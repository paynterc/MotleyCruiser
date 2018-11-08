/****
crewmate died. Send notification
****/
/// scr_ev_crew_died(crew_index)
var ci = argument0;// Crew index
var crewMate = scr_get_array_1d(global.crew,ci);
if(crewMate!=noone){
    var txt = string(crewMate[NPC_NAME]) + " has died.";
    scr_ai_bark(txt);
}


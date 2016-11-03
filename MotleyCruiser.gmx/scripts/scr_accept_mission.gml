/// Accept mission and run any associated scripts
// scr_accept_mission(mission)

var m = argument0;

if(m[MISSION_SCRIPT_START]!=noone){
    scr_script_parse(m[MISSION_SCRIPT_START]);     
}

global.missions = scr_push_array(global.missions,m);

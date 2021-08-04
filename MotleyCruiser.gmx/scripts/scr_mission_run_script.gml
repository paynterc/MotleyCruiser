///scr_mission_run_script(rewardsArray)
// 
var script = argument0;
if(is_undefined(script)) return false;
if(script==noone) return false;

scr_script_parse(script);

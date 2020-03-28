///scr_mission_grant_rewards(rewardsArray)
// rewardsArray = [["G",300],["Map",1]]
var rewardsArray = argument0;
if(!is_array(rewardsArray)) return false;

var R;
for(var i=0; i<array_length_1d(rewardsArray); i++){
   scr_grant_reward(rewardsArray[i]);
} 

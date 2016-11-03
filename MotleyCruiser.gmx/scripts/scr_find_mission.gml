/// Find mission by mission_id
// scr_find_mission(mission_id)

var mission_id=argument0;
var mission = noone;
for(var i = 0; i<array_length_1d(global.missions); i++){
    var mission=global.missions[i];
    if( mission[MISSION_ID]==mission_id){
        return mission;
    }   
}

return noone;

//Submit a crew index number and the grievance id (grievances.money, grievances.food_quality, etc). Will delete all grievances of that type
/// scr_grievance_delete(crewIndex,grievanceId)
var cIndex = argument0;
var grievanceId = argument1;
var G=ds_map_find_value(global.grievance_map,cIndex);
if(is_undefined(G)) return false;
if(!ds_exists(G, ds_type_list)) return false;
var deleted = false;
for(var i=0;i<ds_list_size(G);i++){
    var val = ds_list_find_value(G,i);
    if(val==grievanceId){
        ds_list_delete(G, i);
        deleted = true;
    }
}

return deleted;

// scr_grievance_add(crewIndex,grievanceId)
var cIndex = argument0;
var grievanceId = argument1;
if(cIndex>=array_length_1d(global.crew) || cIndex<0){
    return false;
}
var thisCrew = global.crew[cIndex];
var G=ds_map_find_value(global.grievance_map,cIndex);// Find greivances by crew index value
if(is_undefined(G)){
    show_debug_message("There is no current grv list for crewmember "+ string(cIndex) + " ("+thisCrew[NPC_NAME_FIRST]+")" + " Creating new list.");
    G = ds_list_create();
}
ds_list_add(G,grievanceId);
ds_map_replace(global.grievance_map,cIndex,G);
return true;

/// scr_morale_get_grievance_count(crewIndex)
var cIndex = argument0;
var count;
if(cIndex<0 || cIndex>=array_length_1d(global.crew)){
    return 0;
}

var thisCrew = global.crew[cIndex];

var G=ds_map_find_value(global.grievance_map,cIndex);// Find greivances by crew index value
if(is_undefined(G)){
    if(debug_mode) show_debug_message("There is no current grv list for crewmember " + string(cIndex));
    return 0;
}
return ds_list_size(G);

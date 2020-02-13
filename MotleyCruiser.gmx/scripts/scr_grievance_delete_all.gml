/// scr_grievance_delete_all(grievanceId)
var grievanceId = argument0;
var found;
var cidx, thisCrew;
for(var i=0; i < array_length_1d(global.crew); i++){
    if( !is_array(global.crew[i]) ){
        continue;
    }
    thisCrew = global.crew[i];
    cidx = scr_get_array_1d(thisCrew,NPC_CREW_INDEX);
    found = scr_grievance_delete(cidx,grievanceId);
    if(found){
        if(debug_mode){
            show_debug_message("DEBUG: Grievance " + string(grievanceId) + " found and deleted from crew index " + string(i) );
        }
        scr_morale_add(cidx,1);
    }
}

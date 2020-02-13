var found;
for(var i=0; i < array_length_1d(global.crew); i++){
    found = scr_grievance_delete(i,grievances.food_quality);
    if(found){
        if(debug_mode){
            show_debug_message("DEBUG: Grievance food_quality found and deleted from crew index " + string(i));
        }
        scr_morale_add(i,1);
    }
}

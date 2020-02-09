//scr_ev_boughtpet()
/***
Register this event in the event manager.
When pet is purchased, search for all crewmembers with grievances.loneliness
Remove the grievance and increase morale by 1
***/
var found;
for(var i=0; i < array_length_1d(global.crew); i++){
    found = scr_grievance_delete(i,grievances.loneliness);
    if(found){
        if(debug_mode){
            show_debug_message("DEBUG: Grievance loneliness found and deleted from crew index " + string(i));
        }
        scr_morale_add(i,1);
    }
}

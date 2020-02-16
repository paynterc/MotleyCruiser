//scr_ev_boughtpet(data)
/***
Register this event in the event manager.
When pet is purchased, search for all crewmembers with grievances.loneliness
Remove the grievance and increase morale by 1
***/
var petData = argument0;

if(debug_mode){ show_debug_message("DEBUG: Script scr_ev_boughtpet fired. Pet name is " + string(petData[pet.name])) }

scr_grievance_delete_all(grievances.loneliness);

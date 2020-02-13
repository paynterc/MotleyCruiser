//scr_ev_boughtpet()
/***
Register this event in the event manager.
When pet is purchased, search for all crewmembers with grievances.loneliness
Remove the grievance and increase morale by 1
***/
scr_grievance_delete_all(grievances.loneliness);

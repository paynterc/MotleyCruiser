/*************
EVENT: Docked
Scripts to run when player lands on a planet, moon or station
*************/

// See if we are meeting a mission objective
var objectives = scr_get_entity_objectives(global.landed_type,global.landed_on);
if(objectives != noone){

    for(var ob = 0; ob<array_length_1d(objectives); ob++){
        objv=objectives[ob];
        scr_complete_objective(objv[OBJECTIVE_ID],global.landed_on,global.landed_type);

    }
    
}

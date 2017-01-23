// Repair percentage of damage
//scr_repair_all_ship_cost()
var hull_delta = 0;

global.player_ship = scr_modules_to_ship_data(global.player_ship);
hull_delta = max(0,global.player_ship[SHIP_HULL] - global.player_ship[SHIP_HULL_CUR]);

if(global.fleet!=noone){
    for(var i=0;i<array_length_1d(global.fleet);i++){
        global.fleet[i]=scr_modules_to_ship_data(global.fleet[i]); 
        var fship = global.fleet[i];
        hull_delta += max(0,fship[SHIP_HULL] - fship[SHIP_HULL_CUR]);
    }
}

return hull_delta * global.hull_repair_cost;


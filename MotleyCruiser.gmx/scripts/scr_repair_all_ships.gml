//scr_repair_all_ships()
var repair_cost = scr_repair_all_ship_cost();

global.player_ship = scr_repair_ship(global.player_ship);

if(global.fleet!=noone){
    for(var i=0;i<array_length_1d(global.fleet);i++){
        global.fleet[i]=scr_repair_ship(global.fleet[i]);    
    }
}

global.credits -= repair_cost;

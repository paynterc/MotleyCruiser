/****
Pirate drones spawn randomly, usually around asteroids or deralicts.
Drones have low shields and armor and are not boardable.
****/ 
if(!instance_exists(obj_player_ship)){
    return false;
}

var qty = irandom(2)+2;
var drone;
var spawn_dir = irandom(360);
var spawn_dist = 400;
var x1 = obj_player_ship.x + lengthdir_x(spawn_dist, spawn_dir);
var y1 = obj_player_ship.y + lengthdir_y(spawn_dist, spawn_dir);
var dir=0;
var dist=200;
for(var i = 0; i<qty; i++){
    drone = scr_spawn_npc_ship_single(FACTION_PIRATE, 21, x1+lengthdir_x(dist, dir), y1+lengthdir_y(dist, dir));
    if(drone != noone){
        drone.shields = global.ship_default_shields / 3;
        drone.shields_current = drone.shields;
        drone.hull = global.ship_min_hull;
        drone.hull_current = drone.hull;
        drone.disposition = DISPOSITION_HOSTILE;
        drone.boardable = false; 
    }

    dir += 360/qty;
}

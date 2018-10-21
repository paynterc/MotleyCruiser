/**********
Create a group of asteroids, mining drones and a mining platform. Maybe defense platforms.
*************/
// scr_mining_area(x,y);

// Choose random cocrdinates
var x1=argument0;
var y1=argument1;

if(x1==noone){
    x1 = irandom_range(100,global.sector_width - 100 );
    y1 = irandom_range(100,global.sector_width - 100 );
}

// Instaniate asteroids at random offsets to center. No momentum
var a,ax,ay,dist,dist2;
var dir = 0;
for(var i=0;i<11;i++){
    
    dist = irandom_range(200,1200);
    a = instance_create(x1+lengthdir_x(dist, dir), y1+lengthdir_y(dist, dir), obj_asteroid); 
    a.does_self_destruct = false;

    
    dir+=30;
}

// Generate a platform

// Generate mining drones. They should automatically go after asteroids.
dir=0;
for(var i=0;i<11;i++){
    
    dist = irandom_range(200,1200);
    a = instance_create(x1+lengthdir_x(dist, dir), y1+lengthdir_y(dist, dir), obj_mining_drone); 

    dir+=30;
}

// Add some defense platforms
var platform;
dir=0;
for(var i=0;i<5;i++){
    dist = irandom_range(200,1200);
    platform = scr_spawn_npc_ship_single(FACTION_NEUTRAL,22,x1+lengthdir_x(dist, dir), y1+lengthdir_y(dist, dir));
    platform.turn_spd = 0;
    platform.disposition = DISPOSITION_HOSTILE;
    platform.ship_type = ship_types.platform;
    dir+=30;
}

//scr_spawn_patrol(x,y,faction,qty)
var _x = argument0;
var _y = argument1;
var _faction = argument2;
var _qty = argument3;

var pship, wp1, wp2, wp3, tgt1;

// Choose one planet and two random locations
tgt1 = scr_find_landable_target();
wp1 = scr_array(tgt1.x,tgt1.y);
wp2 = scr_array(irandom(global.sector_width),irandom(global.sector_width));
wp3 = scr_array(_x,_y);

/***

   drone=0,
    platform=1,
    fighter=2,
    corvette=3,
    destroyer=4,
    frigate=5,
    cruiser=6,
    battleship=7,
    carrier=8,
    dreadnaught=9,
    tanker=10,
    freighter=11
***/

for(var i = 0; i < _qty; i++){
    
    var shipChance = irandom(6);
    var shipClass;
    if(shipChance==5){
        shipClass=ship_class.corvette;
    }else if(shipChance==6){
        shipClass=ship_class.destroyer;
    }else{
        shipClass=ship_class.fighter;
    }

    pship = scr_spawn_npc_ship_single(_faction,noone,_x,_y,shipClass);
    
    pship.waypoints = scr_array(wp1,wp2,wp3);
    pship.mode = MODE_PATROLING;
    pship.disposition = DISPOSITION_HOSTILE;
    pship.testme = true;
    
}

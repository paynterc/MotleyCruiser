//scr_spawn_patrol(x,y,faction,qty)
var _x = argument0;
var _y = argument1;
var _faction = argument2;
var _qty = argument3;

var pship, wp1, wp2, wp3, tgt1;

// Choose one planet and two random locations
tgt1 = scr_find_landable_target();
wp1 = scr_array(tgt1.x,tgt1.y);
wp2 = scr_array(irandom(room_width),irandom(room_height));
wp3 = scr_array(_x,_y);

for(var i = 0; i < _qty; i++){
    
    pship = scr_spawn_npc_ship_single(_faction,1,_x,_y);
    
    pship.waypoints = scr_array(wp1,wp2,wp3);
    pship.mode = MODE_PATROLING;
    pship.disposition = DISPOSITION_HOSTILE;
    pship.testme = true;
    
}

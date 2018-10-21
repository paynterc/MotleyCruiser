/***
Loop through entire library and update all ships with any new params
***/
var thisShip;
for(var i = 0; i<array_length_1d(global.ship_library); i++){
    thisShip = scr_fill_array( scr_ship_entity(),global.ship_library[i]);
    
    thisShip[SHIP_FACTION] = real( thisShip[SHIP_FACTION] );
    thisShip[SHIP_FUNCTION] = real( thisShip[SHIP_FUNCTION] );
    thisShip[SHIP_CLASS] = real( thisShip[SHIP_CLASS] );
    thisShip[SHIP_TYPE] = real( thisShip[SHIP_TYPE] );
    
    global.ship_library[i]=thisShip;
}
scr_write_array(global.ship_library,"libraries","ships",DATA_FILE);

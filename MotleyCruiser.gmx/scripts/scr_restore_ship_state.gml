///Restore ship stats with current state from ship_data.
//scr_restore_ship_state()
if(SHIP_SHIELDS_CUR < array_length_1d(ship_data)){
    shields_current = ship_data[SHIP_SHIELDS_CUR];
}
if(SHIP_HULL_CUR < array_length_1d(ship_data)){
    hull_current = ship_data[SHIP_HULL_CUR];
}
if(SHIP_ENERGY_CUR < array_length_1d(ship_data)){
    energy_current = ship_data[SHIP_ENERGY_CUR];
}


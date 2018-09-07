/// Ship turrets
global.ship_turret_library = scr_new_array();

var turret;

//0
turret = scr_ship_turret();
turret[TURRET_TURN_SPEED]=25;
turret[TURRET_GUN_INDEX]=3;//Refers to global.guns
scr_push_array_1d(global.ship_turret_library,turret);

//1
turret = scr_ship_turret();
turret[TURRET_TURN_SPEED]=30;
turret[TURRET_GUN_INDEX]=3;//Refers to global.guns
scr_push_array_1d(global.ship_turret_library,turret);

//2
turret = scr_ship_turret();
turret[TURRET_TURN_SPEED]=30;
turret[TURRET_GUN_INDEX]=4;//Refers to global.guns
scr_push_array_1d(global.ship_turret_library,turret);

//3
turret = scr_ship_turret();
turret[TURRET_TURN_SPEED]=30;
turret[TURRET_GUN_INDEX]=6;//Refers to global.guns
scr_push_array_1d(global.ship_turret_library,turret);

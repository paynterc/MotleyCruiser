/// scr_board_ship()
// Run this script by default when a user attempts to board a disabled ship
// Requires a closest_boardable variable to be set in the obj_player_ship
room_persistent = false;// unpersist the space room
global.ship_boarded = closest_boardable.ship_data;
global.ship_boarded[SHIP_X1] = closest_boardable.x;
global.ship_boarded[SHIP_Y1] = closest_boardable.y;
global.ship_boarded[SHIP_ANGLE] = closest_boardable.image_angle;
global.paused = true;
global.player_x = obj_player_ship.x;
global.player_y = obj_player_ship.y;
scr_persist_game_state();
view_object[0]=closest_boardable;
//obj_space_level.zoom=true;
scr_reset_room_random();
global.decks = 4;// Override some settings
//room_goto(rm_ship_deck_rnd);
//room_goto(rm_podlaunch);
room_goto(rm_inventory);

/**
Persist game state. Place current ship and fleet state in globals so we can move
between sectors.
NOT THE SAME AS SAVING THE GAME. This is only to achieve continuity between rooms.
Use scr_game_save()to save the game to a file.
**/

// If we're in a space environment, persist space objects.
if(instance_exists(obj_space_level)){
    
    // Update player ship data
    if(instance_exists(obj_player_ship)){
        with(obj_player_ship){
            // Update current hull and shield level in ship data.
            scr_update_ship_data();
        }
        global.player_ship = obj_player_ship.ship_data;
        
        global.player_x = obj_player_ship.x;
        global.player_y = obj_player_ship.y;
    }

    // Update the fleet
    global.fleet=noone;
    var s_count = instance_number(obj_npc_ship);
    for(var i = 0; i < s_count; i++) {
        var npc_ship = instance_find(obj_npc_ship,i);
        if(npc_ship.faction==FACTION_PLAYER){
            with(npc_ship){
                scr_update_ship_data();
            }
            global.fleet=scr_push_array(global.fleet,npc_ship.ship_data);
        }
    }
    
    // Save the current sector map
    scr_galaxy_map_add(global.sector_x,global.sector_y,global.sector_map);
}

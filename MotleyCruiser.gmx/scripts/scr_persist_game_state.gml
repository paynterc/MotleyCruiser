/**
Save game state. Place current ship and fleet state in globals so we can move
between sectors. Save data to a file so it can be loaded later.
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
    
}

// If we're in a room, persist npc and crew.

// Write to file
scr_game_save();

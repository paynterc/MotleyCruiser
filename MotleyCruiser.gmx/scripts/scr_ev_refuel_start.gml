/// scr_ev_refuel_start(tgt,shipId)
var tgt = argument0;
var shipId = argument1;// The ship doing the refueling.
if(tgt==obj_player_ship){
    // kick off refuel event with player
    
    //Create npc data
    var npc_data = scr_gx_make_npc(global.sector_x, global.sector_y);
    
    //Instantiate obj_npc offscreen and populate with data
    var npcObject = instance_create(0, 0, obj_npc);
    npcObject.npc_data = npc_data;
    with(npcObject){
        scr_npc_map_to_object();
        event_user(1);// Make sprite
        instance_deactivate_object(self);
    }
    
    // Update the "sent" variable in obj_dialogue to your new npc object
    // Also, set the state variable in obj_dialogue and pauseForce the game.
    obj_dialog_control.sent = npcObject;
    obj_dialog_control.shipId = shipId;

    
    // Have obj_dialogue kick off the text
    with(obj_dialog_control){
        event_user(3);
    }
}



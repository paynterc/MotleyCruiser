// scr_equip_weapon(item_id)
if(ds_map_exists(global.equipped,"weapon")){
    
    var cur_item_id = ds_map_find_value(global.equipped, "weapon");
    if(cur_item_id!=noone){
        scr_inv_item_add(cur_item_id,1); // Move the current weapon back to inventory
    }
    
    ds_map_replace(global.equipped, "weapon", argument0);
    if(instance_exists(obj_player)){
        with(obj_player){
            event_user(0);// Instantiate weapon
        }
    }
    

    
}

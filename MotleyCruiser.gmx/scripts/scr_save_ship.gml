/// Save the ship you're currently editing. Export to file.
var ship_index = argument0;
var ship = noone;
if(ship_index!=noone){
    // Update a ship    
    if(ship_index<0 || ship_index>array_length_1d(global.ship_library)){
        show_message("Invalid ship index.");
        exit;
    }
    ship = obj_ship_editor.loaded_ship;
}else{
    // Create a ship
    ship = scr_ship_entity();
}

ship[SHIP_SCAFFOLD_SIZE]=obj_ship_editor.scaffold_size;
var s_count = instance_number(obj_place_module);
var module_records = noone;
for(var i = 0; i < s_count; i++) {
    var module_obj = instance_find(obj_place_module,i);
    module_records = scr_push_array(module_records,module_obj.module_data);        
}

ship[SHIP_MODULES]=module_records;

if(ship_index==noone){
    global.ship_library = scr_push_array(global.ship_library,ship);
}else{
    global.ship_library[ship_index]=ship;
}


scr_write_array(global.ship_library,"libraries","ships",DATA_FILE);



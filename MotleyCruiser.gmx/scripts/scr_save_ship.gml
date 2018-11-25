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
ship[SHIP_NAME_MODEL] = obj_ship_editor.field_ship_name.txt;
ship[SHIP_FACTION] = real(obj_ship_editor.field_ship_faction.txt);
ship[SHIP_FUNCTION] = real(obj_ship_editor.field_ship_function.txt);
ship[SHIP_CLASS] = real(obj_ship_editor.field_ship_class.txt);
ship[SHIP_TYPE] = real(obj_ship_editor.field_ship_type.txt);

ship[SHIP_SCAFFOLD_SIZE]=obj_ship_editor.scaffold_size;
var s_count = instance_number(obj_place_module);
var module_records = noone;
var commandCount = 0;
var moduleData = noone;
var MP;
for(var i = 0; i < s_count; i++) {
    var module_obj = instance_find(obj_place_module,i);
    moduleData = module_obj.module_data;
    MP = global.module_library[moduleData[I_MODULE_INDEX]];
    if(MP[MODULE_TYPE]=="command"){
        commandCount++;
    }
    module_records = scr_push_array(module_records,module_obj.module_data);        
}
if(commandCount>1){
        show_message("You can not have more than one command module.");
        exit;
}

ship[SHIP_MODULES]=module_records;

if(ship_index==noone){
    global.ship_library = scr_push_array(global.ship_library,ship);
}else{
    global.ship_library[ship_index]=ship;
}


scr_write_array(global.ship_library,"libraries","ships",DATA_FILE);



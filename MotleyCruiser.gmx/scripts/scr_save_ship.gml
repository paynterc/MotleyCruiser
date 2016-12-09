/// Save the ship you're currently editing. Export to file.
var ship = scr_ship_entity();

var s_count = instance_number(obj_place_module);
var module_records = noone;
for(var i = 0; i < s_count; i++) {
    var module_obj = instance_find(obj_place_module,i);
    module_records = scr_push_array(module_records,module_obj.module_data);        
}

ship[SHIP_MODULES]=module_records;

obj_ship_editor.ship_library = scr_push_array(obj_ship_editor.ship_library,ship);

scr_write_array(obj_ship_editor.ship_library,"libraries","ships","motleyships.ini")



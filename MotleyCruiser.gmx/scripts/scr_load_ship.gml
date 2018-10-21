/// Load a ship to editor.
// scr_load_ship(ship_index)
var ship_id = argument0;
if(ship_id = noone || ship_id<0 || ship_id>array_length_1d(global.ship_library)){
    show_message("Invalid ship id.");
}

scr_clear_editor();
//obj_ship_editor.loaded_ship = scr_ship_entity();
obj_ship_editor.loaded_ship = scr_fill_array( scr_ship_entity(),global.ship_library[ship_id]);
obj_ship_editor.loaded_ship_index = ship_id;
obj_ship_editor.scaffold_size = obj_ship_editor.loaded_ship[SHIP_SCAFFOLD_SIZE];

obj_ship_editor.field_ship_name.txt = obj_ship_editor.loaded_ship[SHIP_NAME_MODEL];
obj_ship_editor.field_ship_faction.txt = obj_ship_editor.loaded_ship[SHIP_FACTION];
obj_ship_editor.field_ship_function.txt = obj_ship_editor.loaded_ship[SHIP_FUNCTION];
obj_ship_editor.field_ship_class.txt = obj_ship_editor.loaded_ship[SHIP_CLASS];
obj_ship_editor.field_ship_type.txt = obj_ship_editor.loaded_ship[SHIP_TYPE];
// Create scaffold grids
with(obj_ship_editor){
    scr_shipedit_create_grids();
}

//Assemble the ship in the editor
var module_data = obj_ship_editor.loaded_ship[SHIP_MODULES];
for(var m=0; m<array_length_1d(module_data); m++){
    
    var module = module_data[m];
    var m_coords = module[I_MODULE_COORDS];
    // Get the prototype module
    if(module[I_MODULE_INDEX] >= array_length_1d(global.module_library)){
        continue;
    }
    var m_proto = global.module_library[module[I_MODULE_INDEX]];
    
    if(m_coords == noone || m_proto == noone){
        continue;
    }
    
    var grid = obj_ship_editor.grid_centers[module[I_MODULE_DEPTH]];
    
    if( m_coords[0] >= array_height_2d(grid) || m_coords[1] >= array_length_2d(grid,0) ){
        show_message("coordinates are outside of current grid size.");
        break;
    }
    var g_coords = grid[m_coords[0],m_coords[1]];
    if(g_coords!=noone){
        var x1 = g_coords[0];
        var y1 = g_coords[1];
    
        var m_object = instance_create(x1, y1 ,obj_place_module);
        m_object.sprite_index = m_proto[MODULE_SPRITE_INDEX];
        m_object.image_blend = module[I_MODULE_COLOR];
        m_object.image_yscale = module[I_MODULE_YSCALE];
        m_object.image_xscale = module[I_MODULE_XSCALE];
        m_object.module_data = module;
        m_object.image_angle = 90;
    }else{
        show_message("coordinates could not be loaded");
    }

}

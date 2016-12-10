/// Save the ship you're currently editing. Export to file.
if(obj_ship_editor.loaded_ship == noone){
    show_message("No ship loaded");
}

// Clear any existing modules
scr_clear_modules();
var theship = obj_ship_editor.loaded_ship;
//Assemble the ship in the editor
var module_data = obj_ship_editor.loaded_ship[SHIP_MODULES];
for(var m=0; m<array_length_1d(module_data); m++){
    
    var module = module_data[m];
    var m_coords = module[MODULE_COORDS];
    if(m_coords == noone){
        continue;
    }
    
    var grid = obj_ship_editor.grid_centers[module[MODULE_DEPTH]];
    
    var g_coords = grid[m_coords[0],m_coords[1]];
    if(g_coords!=noone){
        var x1 = g_coords[0];
        var y1 = g_coords[1];
    
        var m_object = instance_create(x1, y1 ,obj_place_module);
        m_object.sprite_index = module[MODULE_SPRITE_INDEX];
        m_object.image_blend = module[MODULE_COLOR];
        m_object.image_yscale = module[MODULE_YSCALE];
        m_object.module_data = module;
        m_object.image_angle = 90;
    }else{
        show_message("coordinates could not be loaded");
    }


    
}



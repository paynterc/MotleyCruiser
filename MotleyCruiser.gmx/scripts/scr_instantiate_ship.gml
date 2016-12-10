/// scr_instantiate_ship(ship_data)

module_data = ship_data[SHIP_MODULES];
modules = noone;
var mag = ship_data[SHIP_SCAFFOLD_SIZE];// Assume scaffolds are of equal height and width. 3x3,5x5,7x7
var m_object = noone;
// Set offsets for each module_record according to their scaffold coordinates
for(var m=0; m<array_length_1d(module_data); m++){
    
    var module_record = module_data[m];
    var coords = module_record[I_MODULE_COORDS];
    
    //ROTATE COORDS 90 degrees
    coords = scr_rotate_coords(coords,mag);
    
    var r = coords[0];
    var c = coords[1];
    
    var offsets = noone;
    var gunoffsets = noone;
    
    offsets = scr_scaffold_offsets(mag,r,c);   
    module_record[I_MODULE_OFFSETS] = offsets;
    
    var d = offsets[0]; // distance
    var a = offsets[1]; // angle

    // Get module prototype
    var m_proto = global.module_library[module_record[I_MODULE_INDEX]];
    if(m_proto[MODULE_TYPE]=="gun"){
        m_object = instance_create(x + lengthdir_x(d, image_angle + a),y + lengthdir_y(d, image_angle + a),obj_ship_module_gun);
    }else{
        m_object = instance_create(x + lengthdir_x(d, image_angle + a),y + lengthdir_y(d, image_angle + a),obj_ship_module);
    }
    m_object.offsets = offsets;
    m_object.sprite_index = m_proto[MODULE_SPRITE_INDEX];
    m_object.image_blend = module_record[I_MODULE_COLOR];
    m_object.image_xscale = module_record[I_MODULE_XSCALE];
    m_object.image_yscale = module_record[I_MODULE_YSCALE];
    m_object.depth = depth - module_record[I_MODULE_DEPTH];
    m_object.faction = faction;
    m_object.module_data = module_record;
    m_object.m_proto = m_proto;
    
    modules[m]=m_object.id;
    
    m_object.parent_obj = id;
     
    module_data[m]=module_record;

}

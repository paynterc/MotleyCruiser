/*****
Instantiates the module objects for the ship object
The progression should be 
scr_instatiate_ship()->
    scr_module_modify_stats()->
        ship_data = scr_modules_to_ship_data(ship_data)
scr_update_ship_data() (for new ship)
OR
scr_restore_ship_state() (when loading ship in new room)

After instantiating modules and updating ship stats for the first time, I put the stats back into the ship_data  
using scr_update_ship_data so we get a starting shield and hull amount.

Ship stats are the raw variables that exist in the ship object. Ship data is an array containing module and ship info.

Use scr_update_ship_data whenever you leave a sector, so we can record losses to shield and hull.

Once the new sector is loaded, use scr_restore_ship_state to move shield and hull data back into ship stats.
*****/

// scr_instantiate_ship(ship_data)

module_data = ship_data[SHIP_MODULES];
modules = noone;
var mag = ship_data[SHIP_SCAFFOLD_SIZE];// Assume scaffolds are of equal height and width. 3x3,5x5,7x7
var m_object = noone;
// Set offsets for each module_record according to their scaffold coordinates
for(var m=0; m<array_length_1d(module_data); m++){
    
    // TODO: See if you can do all this using the scr_instantiate_module script.
    var module_record = module_data[m];
    var coords = module_record[I_MODULE_COORDS];// These are the row/column coords on the scaffold
    if(coords==noone) continue;;
    //ROTATE COORDS 90 degrees
    coords = scr_rotate_coords(coords,mag);//Rotate them, since the editor is 90degrees off from the actual sprite
    
    var r = coords[0];
    var c = coords[1];
    
    var offsets = noone;
    var gunoffsets = noone;
    
    offsets = scr_scaffold_offsets(mag,r,c);   
    module_record[I_MODULE_OFFSETS] = offsets;// These are the offsets in pixels
    
    var d = offsets[0]; // distance
    var a = offsets[1]; // angle

    // Get module prototype
    var m_proto = global.module_library[module_record[I_MODULE_INDEX]];
    if(m_proto[MODULE_TYPE]=="gun"){
        m_object = instance_create(x + lengthdir_x(d, image_angle + a),y + lengthdir_y(d, image_angle + a),obj_ship_module_gun);
    }else if(m_proto[MODULE_TYPE]=="turret"){
        m_object = instance_create(x + lengthdir_x(d, image_angle + a),y + lengthdir_y(d, image_angle + a),obj_ship_module_turret);
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
    m_object.module_type = m_proto[MODULE_TYPE];
    with(m_object){
        guntip = sprite_get_width(sprite_index)/2;
    }
    m_object.m_proto = m_proto;
    modules[m]=m_object.id;
    
    // Fp this after adding object to array in parent
    m_object.parent_obj = id;  
    module_data[m]=module_record;

}

// Now modify the ship stats based on installed modules
scr_module_modify_stats();

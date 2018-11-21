/****
Instantiates and populates a module object.
****/
//scr_instantiate_module(module data, magnitude, drawsprite)
var args = noone;
for (var i=0; i<16; i++)
{
    if (i < argument_count)
        args[i] = argument[i];
    else
        args[i] = noone;
}

var module_record = args[0];
var mag = args[1];
var drawsprite = args[2];
if(drawsprite==noone) drawsprite = true;

var m_object;
var coords = module_record[I_MODULE_COORDS];//These are the row/column coords on the scaffold
if(coords==noone) return noone;
//ROTATE COORDS 90 degrees
coords = scr_rotate_coords(coords,mag);//Rotate them, since the editor is 90degrees off from the actual sprite

var r = coords[0];
var c = coords[1];

var offsets = noone;
var gunoffsets = noone;

offsets = scr_scaffold_offsets(mag,r,c);     
module_record[I_MODULE_OFFSETS] = offsets;


// Get module prototype
var m_proto = scr_get_array_1d(global.module_library,module_record[I_MODULE_INDEX]);
if(m_proto==noone){
    return noone;
}
if(m_proto[MODULE_TYPE]=="gun"){
    m_object = instance_create(x,y,obj_ship_module_gun);
}else{
    m_object = instance_create(x,y,obj_ship_module);
}
m_object.offsets = offsets;
m_object.sprite_index = m_proto[MODULE_SPRITE_INDEX];
m_object.image_blend = module_record[I_MODULE_COLOR];
m_object.image_xscale = module_record[I_MODULE_XSCALE];// These are for flipping sprites on their axis, not for scaling the size of the sprite
m_object.image_yscale = module_record[I_MODULE_YSCALE];// Values should really only be 1 and -1.

m_object.depth = depth - module_record[I_MODULE_DEPTH];
m_object.faction = faction;
m_object.module_data = module_record;
m_object.module_type = m_proto[MODULE_TYPE];
with(m_object){
    guntip = sprite_get_width(sprite_index)/2;
}
m_object.m_proto = m_proto;

m_object.drawsprite = drawsprite;
if(drawsprite){
    with(m_object){
        guntip = sprite_get_width(sprite_index)/2;
    }
}else{
    m_object.guntip = sprite_get_width(sprite_index)/2;// IMPORTANT: WE'RE MAKING THE GUN INVISIBLE AND SETTING THE EMINATION POINT TO THE PARENT SPRITE
}

  

return m_object;


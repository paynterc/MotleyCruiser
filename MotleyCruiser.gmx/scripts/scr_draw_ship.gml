/// scr_draw_ship(shipData,scale)
/***
Create a single sprite for a ship at any scale
***/
var ship_data = argument0;
var scale = argument1;

var module_data = ship_data[SHIP_MODULES];
var mag = ship_data[SHIP_SCAFFOLD_SIZE];// Assume scaffolds are of equal height and width. 3x3,5x5,7x7

for(var m=0; m<array_length_1d(module_data); m++){
    var module_record = module_data[m];
    var m_proto = scr_get_array_1d(global.module_library,module_record[I_MODULE_INDEX]);
    if(m_proto==noone){
        continue;
    }
    var msprite = m_proto[MODULE_SPRITE_INDEX];
    var xdir = module_record[I_MODULE_XSCALE];
    var ydir = module_record[I_MODULE_YSCALE];// Values should really only be 1 and -1.
    var coords = module_record[I_MODULE_COORDS];//These are the row/column coords on the scaffold
    var clr = module_record[I_MODULE_COLOR];
    var r = coords[0];
    var c = coords[1];
    var offsets = scr_scaffold_offsets(mag,r,c,scale);
}

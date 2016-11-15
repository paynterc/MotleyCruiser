/// Update unit in global array
// scr_global_update(global_array, index, attribute_index, new_value);
if(argument0==noone || argument1==noone || argument2==noone) return false;
if(argument1>=array_length_1d(argument0)) return false;

var c = argument0[argument1];
c[@ argument2] = argument3;

/// scr_get_from_pool(key,obj);
// Find an inactive object in the global.obj_pool map. If none found,
// instantiate a new one, add it to the pool and return it.
var key = argument0;
var obj = argument1;

if(!ds_map_exists(global.obj_pool, key)){
    //Maybe create a new instance. Return null for now
    return noone;
}

var obj_array =  global.obj_pool[? key];
var obj = noone;
var key_at = key + "_at";
var obj_at = global.obj_pool[? key_at];

var obj = obj_array[obj_at];
obj_at +=1 ;

global.obj_pool[? key_at] = obj_at mod array_length_1d(obj_array);

return obj;

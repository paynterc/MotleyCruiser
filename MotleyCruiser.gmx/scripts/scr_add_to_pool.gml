///scr_add_to_pool(object, key, amount)
if(!ds_exists(global.obj_pool, ds_type_map)){
    show_debug_message("Object Pool not found!"); 
    exit;
}

var obj = argument0;
var key = argument1;
var amt = argument2;
var obj_array = noone;
var key_at = key + "_at";

for(var i=1;i<=amt;i++){
    newobj = instance_create(-10000,-10000,obj);
    obj_array = scr_push_array(obj_array,newobj);   
}

ds_map_add(global.obj_pool, key, obj_array);
ds_map_add(global.obj_pool, key_at, 0);


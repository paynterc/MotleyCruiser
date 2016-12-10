///Clear all modules from editor
var s_count = instance_number(obj_place_module);
var module_records = noone;
for(var i = 0; i < s_count; i++) {
    var module_obj = instance_find(obj_place_module,i);
    with(module_obj){
        active = 0;
    }        
}

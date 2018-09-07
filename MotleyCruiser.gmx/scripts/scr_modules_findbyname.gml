//scr_modules_findbyname(text name)
// returns the index of the requested module by name
var name = argument0;
var module;
var result = noone;
for(var i=0; i<array_length_1d(global.module_library); i++){
    module = global.module_library[i];
    if(module[MODULE_NAME]==name){
        result = i;
        break;
    }
}

return result;

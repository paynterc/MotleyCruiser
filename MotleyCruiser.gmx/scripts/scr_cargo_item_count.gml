// scr_cargo_item_count(key)
var key = string(argument0);
var count = global.cargo_list[? key];
if(count){
    return count;
}else{
    return 0;
}


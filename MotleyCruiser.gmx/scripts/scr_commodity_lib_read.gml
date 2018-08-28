/************
Read an attribute from a given item in the library.
*************/
// scr_commodity_lib_read(row_id,column_id)
var item_id = argument0;
var attribute_id = argument1;
var result =  ds_map_find_value(global.commodity_library,"item["+string(item_id)+","+string(attribute_id)+"]");

if(is_undefined(result)){
    return noone;
}else{
    return result;
}

/************
Read an attribute from a given item in the library.
*************/
// scr_inv_item_read(item_id,attribute_id)
var item_id = argument0;
var attribute_id = argument1;
// will return <undefined> if no such key exists
var result = item_id_read(item_id,attribute_id);
if(is_undefined(result)){
    return noone;
}else{
    return result;
}

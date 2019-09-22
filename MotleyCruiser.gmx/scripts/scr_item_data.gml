/// scr_item_data(item_id)
// Fill an array with data for the selected item
var item_id = argument0;
var data = noone;
for(var i=0; i<global.item_attribute_count; i++){
    data[i]=item_id_read(item_id,i);
}
return data;

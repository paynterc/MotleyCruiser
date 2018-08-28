/// scr_commodity_lib_add(Row Index,Column Index, value)

if !ds_map_exists(global.commodity_library,"item["+string(argument0)+","+string(argument1)+"]"){
   ds_map_add(global.commodity_library,"item["+string(argument0)+","+string(argument1)+"]",argument2)
}else{
   show_message("THERE IS ALREADY AN ITEM, AT: " + "#item["+string(argument0)+","+string(argument1)+"]")
}

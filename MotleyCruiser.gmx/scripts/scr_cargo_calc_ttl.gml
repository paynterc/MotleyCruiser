// scr_cargo_calc_ttl()
var count=0;
var key;
var ct = ds_map_size(global.cargo_list);
if(ct<1){
    return 0;
}
key = ds_map_find_first(global.cargo_list);
count+=global.cargo_list[? key];
for(n=1; n < ct; n++){
    key = ds_map_find_next(global.cargo_list, key);
    count+=global.cargo_list[? key];
}
return count;

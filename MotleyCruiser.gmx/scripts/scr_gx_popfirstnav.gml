/// scr_gx_popfirstnav()
if(!is_array(global.nav_queue) || array_length_1d(global.nav_queue)<1 ){
    return noone;
}
var pt = scr_get_array_1d(global.nav_queue,0);
global.nav_queue = scr_array_delete_first(global.nav_queue);

var ptArray = scr_str_split(pt,",");
return ptArray;

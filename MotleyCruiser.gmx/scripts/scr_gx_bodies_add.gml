///scr_gx_bodies_add(body)
var body = argument0;
var len = ds_list_size(global.gx_bodies);
body[@ LOC_GLOBAL_INDEX] = len;
ds_list_add(global.gx_bodies,body);
return len;

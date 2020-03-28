/// scr_gx_loc_get_landables()
// Iterate over the galaxy map and generate an array of all landable locations
var thisBody;
var searchSectors = noone;
var landables = noone;
var i=0;
for (var i=0; i<ds_list_size(global.gx_bodies); i++) {
  var thisBody = global.gx_bodies[| i];
  if(is_undefined(thisBody)) continue;
  if(scr_get_array_1d(thisBody,LOC_HAS_PORT)==true){
    landables = scr_push_array(landables,thisBody);
  }
}

return landables;

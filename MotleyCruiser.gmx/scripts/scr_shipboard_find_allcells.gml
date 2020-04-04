/// scr_shipboard_find_allcells(ship_data)
// Find all cells in a ship scaffold that are populated by a module
var shipData = argument0;
var moduleData = scr_get_array_1d(shipData,SHIP_MODULES);
var sz = scr_get_array_1d(shipData,SHIP_SCAFFOLD_SIZE);
if(moduleData==noone || sz==noone) return noone;
var center = floor(sz/2);//center of grid. if mag 5 then 2 (0,1,*2*,3,4)


var allCells = ds_grid_create(sz,sz);
var i, j;
i = 0;
j = 0;
repeat (ds_grid_width(allCells))
   {
   repeat (ds_grid_height(allCells))
      {
      ds_grid_set(allCells, i, j, false);
      j += 1;
      }
   j = 0;
   i += 1;
}

for(var m=0; m<array_length_1d(moduleData); m++){
    var module = moduleData[m];
    var coords = scr_get_array_1d(module,I_MODULE_COORDS);
    if(!is_array(coords)) continue;
    var r = coords[0];
    var c = coords[1];
    ds_grid_set(allCells,c,r,true);
}

return allCells;

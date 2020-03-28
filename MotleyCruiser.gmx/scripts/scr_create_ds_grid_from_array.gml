/// scr_create_ds_grid_from_array(description, array)

var dsGrid;
var array = argument0;
var arrayH = array_length_1d(array);
var arrayW = array_length_1d(array[0]);

dsGrid = ds_grid_create(arrayW,arrayH);

var yy=0;repeat(arrayH){
    var questArray = array[yy];
    var xx = 0;repeat(arrayW){
        dsGrid[# xx,yy] = questArray[xx];
        xx++;
    }
    yy++;
}


return dsGrid;

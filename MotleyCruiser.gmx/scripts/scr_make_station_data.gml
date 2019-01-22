/// scr_make_station_data(orX,orY,section index,index,xx,yy)
var orX = argument0;
var orY = argument1;
var secIndex = argument2;
var libIndex = argument3;
var modX = argument4;
var modY = argument5;

var ofX = abs(modX) - abs(orX);
var ofY = abs(modY) - abs(orY);

return scr_array(secIndex,libIndex,ofX,ofY);

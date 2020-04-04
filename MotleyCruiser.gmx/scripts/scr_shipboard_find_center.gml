/// scr_shipboard_find_center(ship_data)
var shipData = argument0;
var moduleData = scr_get_array_1d(shipData,SHIP_MODULES);
var scaffoldSize = scr_get_array_1d(shipData,SHIP_SCAFFOLD_SIZE);
if(moduleData==noone || scaffoldSize==noone) return noone;
var center = floor(scaffoldSize/2);//center of grid. if mag 5 then 2 (0,1,*2*,3,4)

var centerCoords = noone;
var centerCells = noone;
var allCells = noone;
for(var m=0; m<array_length_1d(moduleData); m++){
    var module = moduleData[m];
    var coords = scr_get_array_1d(module,I_MODULE_COORDS);
    var check=1;
    if(coords == noone) continue;
    
    if(!is_array(coords)) continue;
    
    var r = coords[0];
    var c = coords[1];
    allCells = scr_push_array( allCells,scr_array(c-center,r-center) );
        var check=1;
    if(c != center) continue;
    if(r==center && c==center){
        centerCells = noone;
        centerCells[0] = scr_array(0,0);
        break;
    }else{
        // if mag3. center = 1. If col = 0, row=0, return -1,-1
        centerCells = scr_push_array( centerCells,scr_array(c-center,r-center) );
    }
}

if(is_array(centerCells)){
    return scr_array_random(centerCells);
}else{
    return scr_array_random(allCells);
}


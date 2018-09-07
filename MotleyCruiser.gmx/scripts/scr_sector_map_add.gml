//scr_sector_map_add(x,y,type)
/***
Adds a location to the current sector map
***/
var _x = argument0;
var _y = argument1;
var _t = argument2;

var ld,lx,ly,lt;//Location data,Location X, Location Y, Location Type
var on_map = false;

if(global.sector_map != noone){
    for(var i=0; i<array_length_1d(global.sector_map);i++){
        ld = global.sector_map[i];
        if(ld[0] ==_x && ld[1] == _y && ld[1]== _t){
           on_map = true;
           break; 
        }
    }
    
    if(!on_map){
        global.sector_map[ array_length_1d( global.sector_map ) ] = scr_array(_x,_y,_t);
    }
    
}else{
    global.sector_map[0]=scr_array(_x,_y,_t);   
}



/***********************
Find the racial makeup of the current sector

global.rTSize;
global.racial_centers;


***/
/// scr_racial_center_lookup(galaxy x, galaxy y);
var gx = argument0;
var gy = argument1;
var rts = global.rTSize;
var cToB = floor(rts/2);// Center to border
var races = noone;
for(var i = 0; i < array_height_2d(global.racial_centers); i++){
    var _cx = global.racial_centers[i,0];//center x
    var _cy = global.racial_centers[i,1];// center y
    
    var cRight = _cx+cToB;
    var cLeft = _cx-cToB;
    var cTop = _cy-cToB;
    var cBottom = _cy+cToB;

    if(gx <= cRight && gx >= cLeft && gy >= cTop && gy <= cBottom){
        races = global.racial_centers[i,2]; // An array of indexes from the global.races array
        break;
    }
    
}

if(races==noone){
    races = scr_array(17);
}

return races;

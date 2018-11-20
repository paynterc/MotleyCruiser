/// scr_view_zoom(amount, view)
var zoom = argument0;
var view = argument1;

if(zoom!=1 && zoom!=-1){
    return false;
}

var scaleMap = noone;
scaleMap[0,0]=1120; // Width
scaleMap[0,1]=640; // Height
scaleMap[1,0]=2240; 
scaleMap[1,1]=1280;
scaleMap[2,0]=3360; 
scaleMap[2,1]=1920;

global.zoomLvl = clamp(global.zoomLvl+zoom,0,array_height_2d(scaleMap)-1)

view_wview[view] = scaleMap[global.zoomLvl,0];
view_hview[view] = scaleMap[global.zoomLvl,1];

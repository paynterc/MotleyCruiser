/// scr_gx_make_path(startx,starty,endx,endy,reverse);
var args = noone;
for (var i=0; i<8; i++)
{
    if (i < argument_count)
        args[i] = argument[i];
    else
        args[i] = noone;
}

var startX = args[0];
var startY = args[1];
var endX = args[2];
var endY = args[3];
var reverse = args[4];

if(reverse==noone){
    reverse=true;
}


var gxMapKey, ofsetx, ofsety, newStartPathArray, newEndPathArray;

var newPath = string(endX)+","+string(endY);
var newPathRvs = string(startX)+","+string(startY);
    
var pathKeyStart = "x"+string(startX)+"y"+string(startY)+"~paths";
var pathKeyEnd = "x"+string(endX)+"y"+string(endY)+"~paths";
var offsetKeyStart = "x"+string(startX)+"y"+string(startY)+"~mapoffsets";
var offsetKeyEnd = "x"+string(endX)+"y"+string(endY)+"~mapoffsets";


var sectorPathsStart = ds_map_find_value(global.galaxy,pathKeyStart);
var sectorPathsEnd = ds_map_find_value(global.galaxy,pathKeyEnd);
var sectorOffsetsStart = ds_map_find_value(global.galaxy,offsetKeyStart);
var sectorOffsetsEnd = ds_map_find_value(global.galaxy,offsetKeyEnd);


if(is_array(sectorPathsStart)){

    // validate
    if( !scr_in_array(sectorPathsStart,newPath) ){
        newStartPathArray = scr_push_array(sectorPathsStart,newPath);
        ds_map_replace(global.galaxy,pathKeyStart,newStartPathArray);
    }
   
}else{
    newStartPathArray = scr_array(newPath);
    ds_map_add(global.galaxy,pathKeyStart,newStartPathArray);
}


var test = 1;

/*** Maybe we won't make a return path automatically. I don't know, could be interesting. Be sure to add validation like above. ***/
if(reverse){
    if(is_array(sectorPathsEnd)){
        // validate
        if( !scr_in_array(sectorPathsEnd,newPathRvs) ){
            newEndPathArray = scr_push_array(sectorPathsEnd,newPathRvs);
            ds_map_replace(global.galaxy,pathKeyEnd,newEndPathArray);
        }
    }else{
        newEndPathArray = scr_array(newPathRvs);
        ds_map_add(global.galaxy,pathKeyEnd,newEndPathArray);
    }
}



if(is_undefined(sectorOffsetsStart)){
    ofsetx=irandom(GX_GRIDSIZE)-(GX_GRIDSIZE/2);
    ofsety=irandom(GX_GRIDSIZE)-(GX_GRIDSIZE/2);
    ds_map_add( global.galaxy, offsetKeyStart, string(ofsetx)+","+string(ofsety) );
}
if(is_undefined(sectorOffsetsEnd)){
    ofsetx=irandom(GX_GRIDSIZE)-(GX_GRIDSIZE/2);
    ofsety=irandom(GX_GRIDSIZE)-(GX_GRIDSIZE/2);
    ds_map_add( global.galaxy, offsetKeyEnd, string(ofsetx)+","+string(ofsety) );
}



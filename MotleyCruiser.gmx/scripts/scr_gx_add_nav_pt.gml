/// scr_gx_add_nav_pt(gx,gy)
/*****
Get the requested destination sector. gx, gy
Can we get to this sector?

Lookup the last queued destination in global.nav_queue
Use these coordinates to look up possible paths in global.galaxy "paths" index
If the requested destination is in the list of possible paths, add it to the nav_queue.

If there is nothing in the nav_queue, look up the current sector in global.galaxy, follow the same process
above.

*****/
var gx=real(argument0);
var gy=real(argument1);
var destCount = array_length_1d(global.nav_queue);
var destString = string(gx)+","+string(gy);
var curString = string(global.sector_x) + "," + string(global.sector_y);
var sPaths;// Valid paths from the current sector. Use this to validate the selection. 
var qLast = scr_array_get_last(global.nav_queue);
var q2ndLast = scr_get_array_1d( global.nav_queue, destCount-2 );
var qArray=noone;
var rslt=false;
if(qLast!=noone){
    
    if(destString==qLast){
        // Can't select the same destination twice.
        return false; 
    }

    if(destString==q2ndLast || (destString==curString && destCount==1)){
        // We're backtracking. Remove the last waypoint.
        global.nav_queue = scr_array_delete_last(global.nav_queue);
        return false; 
    }
    qArray = scr_str_split(qLast,",");
    sPaths=scr_gx_get_by_key(qArray[0],qArray[1],"paths");

}else{
    
    
    if(destString==curString){
        return false; // We shouldn't be able to jump to the sector we're already in.
    }   
    sPaths=scr_gx_get_by_key(global.sector_x, global.sector_y, "paths");

}
if(is_array(sPaths)){
    if( scr_in_array(sPaths,destString) ){
        // This is a valid path from the current sector. Add it to the queue
        global.nav_queue = scr_push_array(global.nav_queue, destString);
        rslt=true;
    }
}


    
return rslt;


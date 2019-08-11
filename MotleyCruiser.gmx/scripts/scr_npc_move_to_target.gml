/***
Target in view?
Assumes path(), targetM, ispeed, pxM, pxY, dDistance
***/

/// scr_npc_move_to_target()
if(pxM!=noone && pyM!=noone){
    image_speed = ispeed;// Animate        
    scr_get_path_to_point(pxM,pyM,pspeed);             
    if(point_distance(x,y,pxM,pyM) < dDistance){
        if( !scr_gridcol_line(x,y,pxM,pyM) ){
            path_end();
            image_speed = 0;
            image_index = 0;
        }
    }
}else{
    path_end();
    image_speed = 0;
    image_index = 0;
}

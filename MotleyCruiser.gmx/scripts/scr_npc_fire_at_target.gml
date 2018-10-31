/***
Assumes targetK, targetKinView, weapon, pxK, pyK

***/

/// scr_npc_fire_at_target()

if( instance_exists(targetK) && instance_exists(weapon) ){
    if(targetKinView && !scr_gridcol_line(weapon.x,weapon.y,targetK.x,targetK.y)){
        
       
        // Start shooting
        weapon.image_angle =  point_direction(x, y, pxK, pyK);
        weapon.shooting = true;

    
    }else{
        weapon.shooting = false;
        weapon.image_angle = direction;
    }
}else{
    if(instance_exists(weapon)){
        weapon.shooting = false;
        weapon.image_angle = direction;
    }
}

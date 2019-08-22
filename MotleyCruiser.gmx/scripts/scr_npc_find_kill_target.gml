/***
Assumes targetKtype, targetK, targetKinView, weapon, pxK, pyK, faction, targetKfaction

CREW NPCS LOOK FOR DISPOSITION HOSTILE, NOT JUST FACTION.
***/

/// scr_npc_find_kill_target()

// Select kill target

if(targetK==noone || !instance_exists(targetK) || point_distance(x,y,targetK.x,targetK.y) > 200){
    
    if(instance_exists(targetKtype)){
        if(faction != FACTION_PLAYER){
            // Make sure there is a faction we're looking for, otherwise the NPC could target any other faction.
            if(targetKfaction!=noone){
                targetK = scr_get_closest_notfaction(targetKtype,self,-1,targetKfaction);
            }else{
                targetK = noone;
            }
            
        }else{
            targetK = scr_get_closest_hostile(targetKtype,self);
        }
    }else{
        targetK=noone;
    }           
}

if( targetK!=noone && instance_exists(targetK) ){
    pxK = (targetK.x div CELL_WIDTH)* CELL_WIDTH + CELL_WIDTH/2;
    pyK = (targetK.y div CELL_HEIGHT)* CELL_HEIGHT + CELL_HEIGHT/2;
}else{
    targetK = noone;
    if(instance_exists(weapon)){
        weapon.shooting = false;
        weapon.image_angle = direction;
    }
}


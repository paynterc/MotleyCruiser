/***
Select move to target
Assumes targetMtype, targetM, weapon, pxK, pyK, faction
***/

/// scr_npc_find_kill_target()

if(targetM==noone || !instance_exists(targetM)){
    if(instance_exists(targetMtype)){
        targetM = instance_nearest(x,y,targetMtype);
    }
}

if( targetM!=noone && instance_exists(targetM) ){
    pxM = (targetM.x div CELL_WIDTH)* CELL_WIDTH + CELL_WIDTH/2;
    pyM = (targetM.y div CELL_HEIGHT)* CELL_HEIGHT + CELL_HEIGHT/2;
}else{
    targetM=noone;
    path_end();
}



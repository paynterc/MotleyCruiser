/***
Target in view?
Assumes targetK, faction, targetKinView
***/

/// scr_npc_target_kill_in_view()
if(instance_exists(targetK)){
    if(faction==FACTION_PLAYER){
        targetKinView =  scr_instance_in_view(targetK);   
    }else{
        targetKinView =  scr_instance_in_view(self);
    }
}

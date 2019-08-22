/****************
Player puts weapon away. Maybe people relax.
***************/
var tgtObjType = obj_npc;
if(instance_exists(obj_cantina) || instance_exists(obj_dock)){

    for(var i = 0; i < instance_number(tgtObjType); i++) {
        this_obj = instance_find(tgtObjType,i);
        with(this_obj){
            // Calling this again should toggle the weapon
            event_user(0);
        }

    }
}

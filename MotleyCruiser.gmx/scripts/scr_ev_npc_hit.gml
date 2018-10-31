/****************
Sombody was shot in the cantina
***************/
// scr_ev_npc_hit(object_id, object_type)
var object_id = argument0;
var object_type = argument1;
var tgtObjType = obj_npc;
if(instance_exists(obj_lvl_cantina)){

    for(var i = 0; i < instance_number(tgtObjType); i++) {
        this_obj = instance_find(tgtObjType,i);
        with(this_obj){
            // Calling this again should toggle the weapon
            disposition = DISPOSITION_HOSTILE;
            targetKtype = object_type;
            targetK = object_id;
            mode="hunt";
        }

    }
}

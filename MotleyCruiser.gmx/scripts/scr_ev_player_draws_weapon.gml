/****************
Player draws weapon. Trouble ensues.
***************/
var tgtObjType = obj_npc;
if(instance_exists(obj_lvl_cantina)){
    // In a cantina, everybody draw weapon. Some may shoot first, ask questions later.
    for(var i = 0; i < instance_number(tgtObjType); i++) {
        this_obj = instance_find(tgtObjType,i);
        with(this_obj){
            // This should cause teemmates to draw weapon as well.
            event_user(0);
        }

    }
}

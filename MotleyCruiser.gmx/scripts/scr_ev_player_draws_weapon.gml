/****************
Player draws weapon. Trouble ensues.
***************/
var tgtObjType = obj_npc;
if(instance_exists(obj_cantina) || instance_exists(obj_dock)){
    // In a cantina, everybody draw weapon. Some may shoot first, ask questions later.
    for(var i = 0; i < instance_number(tgtObjType); i++) {
        this_obj = instance_find(tgtObjType,i);
        with(this_obj){
            // This should cause teammates to draw weapon as well.
            event_user(0);
        }

    }
}

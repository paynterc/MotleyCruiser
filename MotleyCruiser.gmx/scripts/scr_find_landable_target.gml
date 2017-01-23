/// Find a landable target for npc ship
//scr_find_landable_target

var tgt = noone;
var tgt_count = instance_number(obj_landable);
if(tgt_count>0){
    tgt = instance_find(obj_landable,irandom(tgt_count - 1))
}else{
    tgt = obj_space_level;
}

return tgt;

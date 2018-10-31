/***
Target in view?
***/
/// scr_npc_sees_enemy(seeker,seeking)
var seeker = argument0;
var seeking = argument1;

var range = 400; // TODO: Set this dynamically, maybe per-npc.

for(var i = 0; i < instance_number(seeking); i++) {
    var this_obj = instance_find(seeking,i);
    var this_range = point_distance(seeker.x,seeker.y,this_obj.x,this_obj.y);
    if(this_obj.faction != seeker.faction){
        if(this_range<range || range<0){
            if( !scr_gridcol_line(seeker.x,seeker.y,this_obj.x,this_obj.y) )
            {
                return this_obj;
            }
        }
    }
}

return noone;

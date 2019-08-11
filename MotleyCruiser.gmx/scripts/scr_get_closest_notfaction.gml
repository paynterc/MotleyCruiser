/***
 Find the closest instance of a given object to the given source that is not of the same faction. You may specify a faction to look for.
***/
/// scr_get_closest_notfaction(ObjectTarget, ObjSource, RangeLimit, faction)
var args = noone;
for (var i=0; i<8; i++)
{
    if (i < argument_count)
        args[i] = argument[i];
    else
        args[i] = noone;
}

var obj_target = args[0];
var obj_source = args[1];
var range = args[2];
var targetFaction = args[3];
if(range == noone){
    range = -1;//set this to -1 for infinite range
}

var closest = noone;
var this_obj = noone;
var closest_range = 0;
var this_range = 0;

for(var i = 0; i < instance_number(obj_target); i++) {
    this_obj = instance_find(obj_target,i);
    this_range = point_distance(obj_source.x,obj_source.y,this_obj.x,this_obj.y);
    
    if(
    this_obj != obj_source 
    && this_obj.faction != obj_source.faction 
    && this_obj.faction == targetFaction
    ){
        if(this_range<range || range<0){
            if(closest==noone){
                closest = this_obj;
                closest_range = this_range;
            }else if(this_range<closest_range){
                closest = this_obj;
                closest_range = this_range;
            }
        }
    }
}

        if(closest!=noone){
            if(closest.name=="mortal"){
                var checkpoint = 1;
            }
        }

return closest;

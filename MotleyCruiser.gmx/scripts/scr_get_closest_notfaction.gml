/***
 Find the closest instance of a given object to the given source
***/
/// scr_get_closest_notfaction(ObjectTarget, ObjSource, RangeLimit);
var args = noone;
for (var i=0; i<16; i++)
{
    if (i < argument_count)
        args[i] = argument[i];
    else
        args[i] = noone;
}

var obj_target = args[0];
var obj_source = args[1];
var range = args[2];
if(range == noone){
    range = -1;//set this to -1 for infinite range
}

closest = noone;
var this_obj = noone;
var closest_range = 0;
var this_range = 0;
for(var i = 0; i < instance_number(obj_target); i++) {
    this_obj = instance_find(obj_target,i);
    this_range = point_distance(obj_source.x,obj_source.y,this_obj.x,this_obj.y);
    if(this_obj!=obj_source && this_obj.faction != obj_source.faction){
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

return closest;

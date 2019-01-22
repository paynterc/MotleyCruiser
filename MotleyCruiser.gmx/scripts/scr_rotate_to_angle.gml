/// scr_rotate_to_angle(object,tgt_angle,rspeed)
// point_direction will give tgt_angle
var ob = argument0;
var tgt_angle = argument1;
var rspeed = argument2;// turn speed or rotation speed
var cur_angle = ob.image_angle;

var diff;
// 180 is to be replaced by "pi" for radians
diff = scr_rotate_cycle(tgt_angle - cur_angle, -180, 180);
// clamp rotations by speed:
if (diff < -rspeed){
    ob.image_angle = cur_angle - rspeed;
}else if (diff > rspeed){
    ob.image_angle = cur_angle + rspeed;
}else{
    // if difference within speed, rotation's done:
    ob.image_angle = tgt_angle;
}

return diff;

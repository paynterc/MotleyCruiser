/// scr_gradually_rotate_5(object, target x, target y, speed)
//myangle, targetangle, speed

var ob = argument0;
var tgx = argument1;
var tgy = argument2;
var rspeed = argument3;

var cur_angle = ob.image_angle;
var tgt_angle = point_direction(ob.x,ob.y,tgx,tgy);


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



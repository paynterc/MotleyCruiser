//scr_start_alarm(obj,alarm,spd)
var obj = real(argument0);
var alm = real(argument1);
var spd = real(argument2);
if(instance_exists(obj)){
    with(obj){
        alarm[alm]=room_speed * spd;
    }
}


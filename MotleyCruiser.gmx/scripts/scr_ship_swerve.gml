/// scr_ship_swerve(odds)
var odds=argument0;

if(odds == irandom(odds)){
    
    var odds2=1;// Which direction
    var mult=1;
    if(odds2==irandom(odds2)){
        mult=-1;
    }
    var xx = x + lengthdir_x(tgt_dist, 45*mult);
    var yy = y + lengthdir_y(tgt_dist, 45*mult);
    waypoint_current[0]=xx;
    waypoint_current[1]=yy;
    
    avoiding = true;
    alarm[9]=room_speed * choose(.5,1,1.5);
}

/// scr_npc_avoid()

for(var i = 0; i < instance_number(obj_bullet); i++) {
    o = instance_find(obj_bullet,i);
    if(o.type == faction) continue;
    if( scr_gridcol_line(o.x,o.y,x,y,1) ){
        // behind wall
        continue;
    }
    var xdir = o.x + lengthdir_x(1000,o.direction);
    var ydir = o.y + lengthdir_y(1000,o.direction);
    if(collision_line(o.x,o.y,xdir,ydir,id,false,false)){
        
        var mvDir = o.direction + ddir;
        show_debug_message("bdir " + string(o.direction));
        show_debug_message("avoid " + string(mvDir));
        var mvX = x + lengthdir_x(128,mvDir);
        var mvY = y + lengthdir_y(128,mvDir);
        /***
        if(scr_mpgrid_place_meeting(mvX,mvY)){
            mvDir = o.direction - 90;
            mvX = x + lengthdir_x(128,mvDir);
            mvY = y + lengthdir_y(128,mvDir);
        }
        ***/
        path_end();
        scr_move_to_point(mvX,mvY,dspeed,1);
        break;
    }
}

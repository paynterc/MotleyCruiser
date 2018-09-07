// scr_minimap(x,y,scale)
var _x, _y, _s;
_x = argument0
_y = argument1
_s = argument2

_rw = global.sector_width;
_rh = global.sector_width;
// Run this in the draw_gui step
draw_set_color(c_white)
draw_rectangle(_x,_y,_x+ (_rw * _s),_y+ (_rw * _s),0);
draw_set_color(c_black)
draw_rectangle(_x+2,_y+2,_x + (_rw * _s) -2,_y+ (_rw * _s) -2,0);

if(instance_exists(obj_player_ship)){
    draw_set_color(c_green);
    draw_circle(_x+(obj_player_ship.x * _s),_y+(obj_player_ship.y*_s),2,1);
}

var ld,lx,ly,lt;//Location data,Location X, Location Y, Location Type
if(global.sector_map!=noone){
    for(var i=0; i<array_length_1d(global.sector_map);i++){
        ld = global.sector_map[i];
        if(ld[2]=="planet"){
            draw_set_color(c_blue);
            draw_circle(_x+(ld[0] * _s),_y+(ld[1]*_s),3,1);
        }else if(ld[2]=="sun"){
            draw_set_color(c_yellow);
            draw_circle(_x+(ld[0] * _s),_y+(ld[1]*_s),5,1);
        }else if(ld[2]=="asteroid"){
            draw_set_color(c_fuchsia);
            draw_circle(_x+(ld[0] * _s),_y+(ld[1]*_s),2,1);
        }else{
            draw_set_color(c_white);
            draw_circle(_x+(ld[0] * _s),_y+(ld[1]*_s),3,1);
        }
    }
}

/***
with(obj_sun){
    draw_set_color(c_yellow);
    draw_circle(_x+(x * _s),_y+(y*_s),5,1);
}

with(obj_planet){
    draw_set_color(c_blue);
    draw_circle(_x+(x * _s),_y+(y*_s),3,1);
}
***/

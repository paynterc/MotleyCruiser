/// scr_draw_hotbar(_x,_y,boxes)

// 2 boxes
var boxes = argument2;
var boxw = 40;//box width
var boxp = 4;//padding
var boxm = 12;//margin

//var _x = (global.gui_width/2) - ( ( (boxes * boxw) + ((boxes-1)* boxm) ) /2 );
//var _y = 0 + boxm;
var _x = argument0;
var _y = argument1 - boxw - boxm;
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_lime);
draw_set_font(fnt_menus);
var spr;
for(var i=0; i<boxes; i++){
    draw_panel(spr_background,0,_x,_y,boxw,boxw,16);
    spr = global.hotbar[i,2];   
    if( spr!=noone ){
        draw_sprite_ext(spr,0,_x + (boxw/2),_y + (boxw/2),2,2,0,c_white,1);
    }
    draw_text(_x,_y,string(global.hotbar[i,1]));  
    _x+=boxm+boxw;
}

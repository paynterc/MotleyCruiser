/// scr_gui_draw_button(array btnData)
var b = argument0;
if(b[BTN_SHOW]){   
    var thefont = fnt_menus;
    var font_size = font_get_size(thefont);    
    draw_set_font(thefont);
    draw_set_color(c_lime);   
    draw_set_valign(fa_center);
    draw_set_halign(fa_center);
    draw_panel(spr_background,0,b[0],b[1],b[2],b[3],16);
    if(b[4]){
        draw_set_color(c_white);
    }
    draw_text(b[0]+(b[2]/2),b[1]+(b[3]/2),b[5]);
    draw_set_color(c_lime);  
}

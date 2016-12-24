/// Show or hide a panel. Draw the panel and all of its text and buttons
//scr_draw_panel(p)
var p = argument0;
if(p!=noone && p[4]){
    var thefont = fnt_menus;
    var font_size = font_get_size(thefont);    
    draw_set_font(thefont);
    draw_set_color(c_lime);
    draw_set_valign(fa_center);
    draw_set_halign(fa_center);
    draw_panel(spr_background,0,p[0],p[1],p[2],p[3],32);
    
    // Cancel button
    /***
    var cb = p[6];
    draw_panel(spr_background,0,cb[0],cb[1],cb[2],cb[3],16);
    if(cb[4]){
        draw_set_color(c_white);
    }
    draw_text(cb[0]+(cb[2]/2),cb[1]+(cb[3]/2),cb[5]);
    draw_set_color(c_lime);
    ***/

    // Panel Header
    draw_text(p[0]+(p[2]/2),p[1]+(font_size)+p[5],p[7]);
    
    // Configured Buttons
    if(p[8]!=noone){
        var btns = p[8];
        for(var i = 0; i<array_length_1d(btns); i++){
            var b = btns[i];
            if(b[BTN_SHOW]){
                draw_panel(spr_background,0,b[0],b[1],b[2],b[3],16);
                if(b[4]){
                    draw_set_color(c_white);
                }
                draw_text(b[0]+(b[2]/2),b[1]+(b[3]/2),b[5]);
                draw_set_color(c_lime);
            }
        }
    }

}

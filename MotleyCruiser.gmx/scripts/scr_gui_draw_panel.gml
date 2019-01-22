/// Show or hide a panel. Draw the panel and all of its text and buttons
//scr_draw_panel(panel_data)
// panel[4]=show/hide

var args = noone;
for (var i=0; i<16; i++)
{
    if (i < argument_count)
        args[i] = argument[i];
    else
        args[i] = noone;
}
var p = args[0];
var hide_background = args[1];
if(p!=noone && p[4]){
    var thefont = fnt_menus;
    var font_size = font_get_size(thefont);    
    draw_set_font(thefont);
    draw_set_color(c_lime);
    draw_set_valign(fa_center);
    draw_set_halign(fa_center);
    if(!hide_background){
        draw_panel(spr_background,0,p[0],p[1],p[2],p[3],32);
    }
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
            scr_gui_draw_button(b);
        }
    }

}

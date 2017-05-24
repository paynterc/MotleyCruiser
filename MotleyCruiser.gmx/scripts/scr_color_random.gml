/*****
If complex, choose basic color, else random rgb
*****/
//scr_color_random(complex)
var complex = argument[0];
if(complex){
    return make_colour_rgb(irandom(255), irandom(255), irandom(255));
}else{
    return choose(c_white,c_blue,c_dkgray,c_fuchsia,c_gray,c_green,c_lime,c_ltgray,c_navy,c_orange,c_purple,c_red,c_silver,c_teal,c_yellow);
}

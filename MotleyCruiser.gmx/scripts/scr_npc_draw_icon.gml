/// scr_npc_draw_icon(x, y, text)

var npcX = argument0;
var npcY = argument1;
var txt = argument2;

draw_sprite(spr_npc_icon,0, npcX, npcY - 17);
draw_set_font(fnt_coder);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_black);
draw_text(npcX,npcY-16-10,txt);


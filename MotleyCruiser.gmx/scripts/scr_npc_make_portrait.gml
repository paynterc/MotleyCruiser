/// scr_npc_make_portrait(sprite)
// Creates a new sprite for dialog boxes, scaled to portrait size.
var spr1 = argument0;
var P = noone;/// new portrait sprite
var surf = noone;
surf  = surface_create(16, 16);
surface_set_target(surf);
draw_clear_alpha(c_black, 0);
draw_sprite_part(spr1,0,8,8,16,16,0,0);
P = sprite_create_from_surface(surf, 0, 0, 16, 16, false, false, 0, 0);
if(surface_exists(surf)){
    surface_free(surf);
}
surface_reset_target();

return P;

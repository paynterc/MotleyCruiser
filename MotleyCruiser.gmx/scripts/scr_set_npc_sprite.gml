/***
Return a sprite with body and accessories
***/
/// scr_set_npc_sprite(npc_data)
var npc_data = argument0;
var _sprite_index=scr_get_array_1d(npc_data,NPC_SPRITE);
var skincolor = scr_get_array_1d(npc_data,NPC_SKIN_COLOR);
var accessories = scr_get_array_1d(npc_data,NPC_ACCESSORIES);

// Put body sprite in an array with the skincolor
var bodyData = scr_array(_sprite_index,skincolor);

// Submit all sprites to a script to merge them and draw them to a surface
var spriteArray = scr_array(bodyData);
for(var i=0;i<array_length_1d(accessories); i++){
    spriteArray = scr_push_array(spriteArray,accessories[i]);
}

return scr_surface_to_sprite(spriteArray);


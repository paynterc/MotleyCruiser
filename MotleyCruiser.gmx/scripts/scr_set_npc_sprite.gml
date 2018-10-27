/***
Run inside an npc object. Assumes existence of an npc_data array
***/
/// scr_set_npc_sprite()
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

custom_sprite = scr_surface_to_sprite(spriteArray);
sprite_index = custom_sprite;

/// scr_add_npc_to_crew(npc obj)
closest_sentient=argument0;
if(closest_sentient==noone){
    return false;
}

// Grant some equipment to the npc                      
var rnd_weapon = 51;

var equip_array = closest_sentient.npc_data[NPC_EQUIPMENT];
equip_array[@0]=rnd_weapon;
  
/***                      
with(closest_sentient){
    instance_change(obj_crew,true);
    scr_npc_map_to_object();
    
    // Submit all sprites to a script to merge them and draw them to a surface
    var bodyData = scr_array(sprite_index,skincolor);
    var spriteArray = scr_array(bodyData);
    for(var i=0;i<array_length_1d(accessories); i++){
        spriteArray = scr_push_array(spriteArray,accessories[i]);
    }
    npc_data[NPC_SPRITE_TEMP] = scr_surface_to_sprite(spriteArray);
    if(sprite_exists(npc_data[NPC_SPRITE_TEMP])){
        sprite_index = npc_data[NPC_SPRITE_TEMP];
    }

}
***/
global.crew = scr_push_array(global.crew,closest_sentient.npc_data);
closest_sentient.crew_index = array_length_1d(global.crew)-1;
with(closest_sentient){
    scr_crew_follow_player();
}               

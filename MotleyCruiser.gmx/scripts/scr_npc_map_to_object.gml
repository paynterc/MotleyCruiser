/// Copy npc map data to npc object vars. Run this inside the npc object
// after the npc_data map has already been copied to it. This should work for crew and cantina npcs

sprite_index=npc_data[NPC_SPRITE];
hp=npc_data[NPC_HP_CURRENT];
hp_current=npc_data[NPC_HP_CURRENT];
pspeed=npc_data[NPC_RUN_SPD];
global_index = npc_data[NPC_GLOBAL_INDEX];
name = npc_data[NPC_NAME];
race_index = npc_data[NPC_RACE_INDEX];
hire_price = npc_data[NPC_HIRE_PRICE];

accessories = noone;
acc_colors = noone;
//global.accessories[race_index]
if(global.accessories[race_index] != noone){
    
    var accessories = global.accessories[race_index];
    var a_chance = 3;
    
    //skincolor
    if(race_index==0){
        skincolor = scr_array_random(global.skincolors);
        if(skincolor != noone){
            image_blend = skincolor;
        }
    }
    
    
    //chest   
    var tops = accessories[0];
    if(tops != noone){
        //choose chest
        if(irandom(a_chance)==a_chance){
            top = scr_array_random(tops);
        }       
    }
    
    
    
    //hair
    var hairs = accessories[1];
    if(hairs != noone){
        //choose hair
        if(irandom(a_chance)==a_chance){
            hair = scr_array_random(hairs);
            haircolor = scr_array_random(global.haircolors);;
        }
    }
    
    
    //head
    var heads = accessories[2];
    if(heads != noone){
        //choose heads
        if(irandom(a_chance)==a_chance){
            hat = scr_array_random(heads);
        }
    }
    
    //eyes
    var eyes = accessories[3];
    if(eyes != noone){
        //choose eyes
        if(irandom(a_chance)==a_chance){
            eye = scr_array_random(eyes);
        }
    }
    
    custom_sprite = scr_surface_to_sprite(sprite_index,hair,top,eye,hat);
    sprite_index = custom_sprite;
    
}

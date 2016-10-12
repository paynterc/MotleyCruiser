/// Populate the cantina

location_index = global.landed_on;
location = global.stations[location_index];

npcs = location[STATION_NPCS];

// Place NPCs at sentient positions.
var s_count = instance_number(obj_sentient);
for(var i = 0; i < s_count; i++) {
    //instance_list(obj_sentient)[i].instance_destroy();
        var sentient = instance_find(obj_sentient,i);
        //var raceIndex = irandom( array_height_2d(global.races) - 1 );
        
        if(i < array_length_1d(npcs)){
            var npc = global.npcs[npcs[i]];
            var raceIndex = npc[NPC_RACE_INDEX];
            sentient.sprite_index=global.races[raceIndex, RACE_SPR];
            sentient.name = npc[NPC_NAME];
            sentient.image_speed = 0;
            sentient.race_index = raceIndex;
        }
}

// Delete the unused sentients.
s_count = instance_number(obj_sentient);
for(var j = 0; j < s_count; j+=1) {
    var sentient2 = instance_find(obj_sentient,j);
    instance_deactivate_object(sentient2);
    if(sentient2!=noone && sentient2.race_index == noone){
        //
    }
}

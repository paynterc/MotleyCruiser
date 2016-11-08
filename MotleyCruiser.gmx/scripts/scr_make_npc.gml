/// Create an array with npc attributes
// Attribute names are contained in Macros/All configurations
var location = argument0;

var map = noone;

var race_index = irandom(array_height_2d(global.races) - 1);
var run_modifier = irandom(4)-2;
var hp_modifier = irandom(10)-5;
var names = noone;
switch(race_index){
    case(0):
        names = totro_plus(2,4,irandom_range(2,4),0,0);// human
        break;
    case(1):
        names = totro_plus(2,3,irandom_range(2,4),0,0);// chicken
        break;
    case(2):
        names = totro_plus(4,5,irandom_range(1,2),0,1);// hurgan
        break;
    case(3):
        names = totro_plus(3,5,irandom_range(2,4),1,0);// flowridian
        break;
            
    default:
        names = totro_plus(2,4,2,0,0);
}



map[NPC_RACE_INDEX] = race_index;
map[NPC_NAME] = scr_array_concat(names," ");
map[NPC_NAME_FIRST] = names[0];
if(array_length_1d(names)>1){
    map[NPC_NAME_LAST] = names[array_length_1d(names)-1];
}else{
    map[NPC_NAME_LAST] = "";
}

map[NPC_RUN_SPD] =  max(global.min_spd, global.races[race_index,RACE_BASE_SPD] + run_modifier);
map[NPC_HP] =  max(global.min_hp, global.races[race_index,RACE_BASE_HP] + hp_modifier);
map[NPC_HP_CURRENT] =  map[NPC_HP];
map[NPC_MISSION]=noone;
map[NPC_LOCATION]=location;// string "type,index,sector_row,sector_col"


return map;

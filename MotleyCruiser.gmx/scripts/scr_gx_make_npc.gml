/// scr_gx_make_npc(sector_x,sector_y);
// Create an array with npc attributes
// Attribute names are contained in Macros/All configurations
var sector_x = argument0;
var sector_y = argument1;

var map = scr_npc();

/***
var faction_weights = scr_faction_location_weights(sector_x,sector_y);
// Make an array of possible factions
var thefactions = noone;
for(var i = 0; i<array_height_2d(global.faction_centers); i++){
    thefactions[i]=global.faction_centers[i,2];
}
// Pick a random, weighted faction
var random_faction = scr_random_weighted(thefactions,faction_weights);
***/
var random_faction = noone;
var available_races = scr_racial_center_lookup(sector_x,sector_y);
// Pick a race
var race_index = scr_array_random(available_races);

/***
if(random_faction!=noone){
    race_index = global.faction_races[ random_faction, irandom( array_length_2d(global.faction_races,random_faction)-1 ) ];
}else{
    race_index = irandom(array_height_2d(global.races) - 1);
}
***/


var run_modifier = irandom(4)-2;
var hp_modifier = irandom(10)-5;
var names = noone;
switch(race_index){
    case(0):
        names = totro_plus(2,4,irandom_range(2,4),0,0);// human
        break;
    case(1):
        names = totro_plus(2,3,irandom_range(2,4),0,0);// chicken
        for(var i=0;i<array_length_1d(names); i++){
            names[i]=names[i] + choose("KaKaw!","Bak!","Bok!","Akw!","Clk");
        }
        break;
    case(2):
        names = totro_plus(4,5,irandom_range(1,2),0,1);// hurgan
        break;
    case(3):
        names = totro_plus(3,5,irandom_range(2,4),1,0);// flowridian
        break;
    case(8):
        names = totro_plus(1,1,2,1,0);// bot
        for(var i=0;i<array_length_1d(names); i++){
            names[i]=names[i] + string(irandom(20));
        }
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
map[NPC_LOCATION]=noone;// string "type,index,sector_row,sector_col"
map[NPC_ACTIVE]=true;

map[NPC_TRAIT]=scr_get_random_traits();//save the index of the the trait
map[NPC_OCCUPATION]=irandom( array_length_1d(global.npc_occupations)-1 );//save the index of the the trait
map[NPC_SEX]=max(0,irandom(global.races[race_index,RACE_SEXES]-1));//Should give zero or one

if(map[NPC_SEX]==1){
    map[NPC_SPRITE] = asset_get_index( scr_array_random( scr_str_split( global.races[map[NPC_RACE_INDEX], RACE_SPR_FML],",") ) );
}else{
    map[NPC_SPRITE] = asset_get_index ( scr_array_random( scr_str_split( global.races[map[NPC_RACE_INDEX], RACE_SPR],",") ) );           
}

map[NPC_HIRE_PRICE]=choose(50,100,150,200);

accessories = noone;
acc_colors = noone;

if(race_index==0){
    skincolor = scr_array_random(global.skincolors);
    if(skincolor != noone){
        map[NPC_SKIN_COLOR] = skincolor;
    }
}
    
//global.accessories[race_index]
if(global.accessories[race_index] != noone){
    
    var accessories = global.accessories[race_index];
    var a_chance = 5;
    var acc_record = scr_array(noone,c_white);// Acc index, color
    //chest   
    var tops = accessories[0];
    var top = acc_record;
    if(tops != noone){
        //choose chest
        if( irandom(a_chance)!= a_chance ){
            top[0] = scr_array_random(tops);
        }       
    }
    
    
    
    //hair
    var hairs = accessories[1];
    var hair =acc_record;
    if(hairs != noone){
        //choose hair
        if(irandom(a_chance)!=a_chance){
            hair[0] = scr_array_random(hairs);
            hair[1] = scr_array_random(global.haircolors);;
        }
    }
    
    
    //head
    var heads = accessories[2];
    var head = acc_record;
    if(heads != noone){
        //choose heads
        if(irandom(a_chance)==a_chance){
            head[0] = scr_array_random(heads);
        }
    }
    
    //eyes
    var eyes = accessories[3];
    var eye = acc_record;
    if(eyes != noone){
        //choose eyes
        if(irandom(a_chance)==a_chance){
            eye[0] = scr_array_random(eyes);
        }
    }
    
    map[NPC_ACCESSORIES] = scr_array(top,hair,head,eye);
}

return map;

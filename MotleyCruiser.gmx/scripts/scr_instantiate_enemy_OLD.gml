/// Instantiate a random enemy or enemy of type
// scr_instantiate_enemy(x,y,race_index);
// Set race_index to negative for a random race.
// Alternate params: mode
var args = noone;
for (var i=0; i<8; i++)
{
    if (i < argument_count)
        args[i] = argument[i];
    else
        args[i] = noone;
}
var x1 = args[0];
var y1 = args[1];
var race_index = args[2];
var set_mode = args[3];
var sex = args[4];
var weapon = args[5];

var newEnemy = instance_create(x1,y1,obj_enemy);

// Set a random mode if none given
if(set_mode== noone){

    var oddsMode = 5;
    var modRnm = irandom(oddsMode);
    if(modRnm==0){
        set_mode = "hunt";
    }else if(modRnm==1){
        set_mode = "defend";                
    }else{
        set_mode = "hold";           
    }
}
newEnemy.mode = set_mode;

if(race_index < 0){
    race_index = irandom(array_height_2d(global.races)-1);
}
newEnemy.race_index = race_index;

if(sex==noone){
    sex = max(0,irandom(global.races[race_index,RACE_SEXES]-1));//Should give zero or one
    var spr;
    if(sex){
        spr = asset_get_index ( scr_array_random( scr_str_split( global.races[race_index, RACE_SPR_FML],",") ) );
    }else{
        spr = asset_get_index ( scr_array_random( scr_str_split( global.races[race_index, RACE_SPR],",") ) );           
    }
}
newEnemy.sex = sex;

if(weapon==noone){
    weapon = obj_gun;
}

newEnemy.sprite_index = spr;
newEnemy.weapon_index = weapon;
newEnemy.accessories = noone;
newEnemy.acc_colors = noone;
//global.accessories[race_index]
if(global.accessories[race_index] != noone){
    
    var accessories = global.accessories[race_index];
    var a_chance = 3;
    
    //skincolor
    if(race_index==0){
        newEnemy.skincolor = scr_array_random(global.skincolors);
        with(newEnemy){
            if(skincolor != noone){
                image_blend = skincolor;
            }
        }
    }
    
    
    //chest   
    var tops = accessories[0];
    if(tops != noone){
        //choose chest
        if(irandom(a_chance)==a_chance){
            newEnemy.top = scr_array_random(tops);
        }       
    }
    
    
    
    //hair
    var hairs = accessories[1];
    if(hairs != noone){
        //choose hair
        if(irandom(a_chance)==a_chance){
            newEnemy.hair = scr_array_random(hairs);
            newEnemy.haircolor = scr_array_random(global.haircolors);;
        }
    }
    
    
    //head
    var heads = accessories[2];
    if(heads != noone){
        //choose heads
        if(irandom(a_chance)==a_chance){
            newEnemy.hat = scr_array_random(heads);
        }
    }
    
    //eyes
    var eyes = accessories[3];
    if(eyes != noone){
        //choose eyes
        if(irandom(a_chance)==a_chance){
            newEnemy.eye = scr_array_random(eyes);
        }
    }
    
}


var run_modifier = irandom(2)-1;
var hp_modifier = irandom(2)-1;

newEnemy.pspeed = max(global.min_spd, global.races[race_index,RACE_BASE_SPD] + run_modifier);
newEnemy.hp = max(global.min_hp, global.races[race_index,RACE_BASE_HP] + hp_modifier);
newEnemy.hp_current = newEnemy.hp;


return newEnemy;

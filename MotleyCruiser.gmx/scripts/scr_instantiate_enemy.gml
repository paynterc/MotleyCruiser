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

    var oddsMode = 3;
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

return newEnemy;

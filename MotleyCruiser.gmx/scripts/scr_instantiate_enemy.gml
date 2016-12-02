/// Instantiate a random enemy or enemy of type
// scr_instantiate_enemy(x,y,race_index);
// Set race_index to negative for a random race.

var newEnemy = instance_create(argument0,argument1,obj_enemy);
var set_mode = "hold";

var oddsMode = 3;
var modRnm = irandom(oddsMode);
if(modRnm==0){
    set_mode = "hunt";
}else if(modRnm==1){
    set_mode = "defend";                
}else{
    set_mode = "hold";           
}
newEnemy.mode = set_mode;

var race_index = argument2;
if(race_index < 0){
    race_index = irandom(array_height_2d(global.races)-1);
}
newEnemy.sprite_index = global.races[race_index,RACE_SPR];

return newEnemy;

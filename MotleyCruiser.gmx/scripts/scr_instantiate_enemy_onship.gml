/// Instantiate a random enemy or enemy of type
// scr_instantiate_enemy_onship(x,y,race_index);
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
var ob_type = args[3];
if(ob_type==noone){
    ob_type = obj_npc;
}

/***
var race_index = args[2];
var set_mode = args[3];
var sex = args[4];
var weapon = args[5];
***/


var newEnemy = instance_create(x1,y1,ob_type);
var npc_data = scr_gx_make_npc(global.sector_x,global.sector_y);
        
newEnemy.npc_data = npc_data;
with(newEnemy){
    scr_npc_map_to_object();
    default_weapon = choose(obj_gun,obj_shotgun1,obj_singularity_pistol,obj_plasmaknife,obj_heavy_blaster1,obj_blaster1);
}
// obj_gun,obj_shotgun1,obj_singularity_gun,obj_plasmaknife

// Set a random mode if none given
var oddsMode = 5;
var modRnm = irandom(oddsMode);
if(modRnm==1){
    set_mode = "hunt";                
}else{
    set_mode = "patrol";           
}

newEnemy.disposition = DISPOSITION_HOSTILE;
newEnemy.faction = FACTION_HOSTILE;
newEnemy.targetKfaction = FACTION_PLAYER;
newEnemy.mode = set_mode;

if(newEnemy.mode=="defend"){
    newEnemy.targetMtype = obj_core;
}


with(newEnemy){
    event_user(0);// Draw weapon
}

return newEnemy;

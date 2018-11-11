/// Default values for gun

var gun = noone;

gun[GUN_DAMAGE]=1;
gun[GUN_SPEED]=1;
gun[GUN_SPRITE]=spr_gun;
gun[GUN_BULLET_SPRITE]=spr_laser;
gun[GUN_RANGE]=400;
gun[GUN_BULLET_SPEED]=BULLET_BASE_SPEED;
gun[GUN_BULLET_TYPE]=bulletTypes.bullet;//enum set in obj_game_control. bullet, beam, missile_dumb, missile_guided
gun[GUN_BULLET_OBJECT]=obj_laser;

return gun;

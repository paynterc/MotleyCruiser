/// Default values for ship gun

var gun = noone;

gun[GUN_DAMAGE]=1;
gun[GUN_SPEED]=.25;// time between shots. fire rate
gun[GUN_SPRITE]=spr_gun;
gun[GUN_BULLET_SPRITE]=spr_laser;
gun[GUN_RANGE]=1000;
gun[GUN_BULLET_SPEED]=10;
gun[GUN_BULLET_TYPE]=bulletTypes.bullet;//enum set in obj_game_control. bullet, beam, missile_dumb, missile_guided
gun[GUN_BULLET_OBJECT]=obj_laser;
gun[GUN_ENERGY]=1;
gun[GUN_SOUND]=snd_laser1;
gun[GUN_TURN_SPEED]=0; // For turrets
gun[GUN_CAPACITY]=10;// shots per burst
gun[GUN_RECHARGE]=2;//recharge unit per second
return gun;

/// Ship-mounted guns
// Baseline at 10dps / 10eps (energy per second).
// Energy regen speed is 4click per room_speed (sec)
// Base energy regen points are 2.5. So 10 points per second.

global.guns = noone;

// baseline gun. 10dps. 10eps.
var gun = noone;
gun = scr_gun();
gun[GUN_SPEED]=.5;
gun[GUN_DAMAGE]=5;
gun[GUN_SPRITE]=spr_gun_16_48_1;
gun[GUN_BULLET_SPRITE]=spr_bolt;
gun[GUN_ENERGY]=5;// per shot. 1 is default.
global.guns[0]=gun;

gun=noone;
gun = scr_gun();
gun[GUN_SPEED]=.1;
gun[GUN_DAMAGE]=1;
gun[GUN_SPRITE]=spr_gun_16_32_1;
gun[GUN_BULLET_SPRITE]=spr_laser;
global.guns[1]=gun;

gun=noone;
gun = scr_gun();
gun[GUN_SPEED]=3;
gun[GUN_DAMAGE]=30;
gun[GUN_SPRITE]=spr_gun_16_32_2;
gun[GUN_BULLET_SPRITE]=spr_rail;
gun[GUN_ENERGY]=30;// per shot. 1 is default.
global.guns[2]=gun;

gun=noone;
gun = scr_gun();
gun[GUN_SPEED]=.1;
gun[GUN_DAMAGE]=1;
gun[GUN_SPRITE]=spr_gun_16_16_1;
gun[GUN_BULLET_SPRITE]=spr_laser_2;
global.guns[3]=gun;

gun=noone;
gun = scr_gun();
gun[GUN_SPEED]=.2;
gun[GUN_DAMAGE]=2;
gun[GUN_SPRITE]=spr_gun_16_16_1;
gun[GUN_BULLET_TYPE]=bulletTypes.beam;
gun[GUN_BULLET_COLOR]=c_yellow;
gun[GUN_RANGE]=150;
gun[GUN_ENERGY]=2;// per shot. 1 is default.
global.guns[4]=gun;

gun=noone;
gun = scr_gun();
gun[GUN_SPEED]=.1;
gun[GUN_DAMAGE]=1;
gun[GUN_SPRITE]=spr_gun_16_16_1;
gun[GUN_BULLET_TYPE]=bulletTypes.beam;
gun[GUN_BULLET_COLOR]=c_aqua;
gun[GUN_RANGE]=300;
gun[GUN_ENERGY]=2;// per shot. 1 is default.
global.guns[5]=gun;

gun = scr_gun();
gun[GUN_SPEED]=1;
gun[GUN_DAMAGE]=5;
gun[GUN_SPRITE]=spr_gun_16_48_1;
gun[GUN_BULLET_SPRITE]=spr_bolt;
gun[GUN_BULLET_SPEED]=6;
gun[GUN_BULLET_OBJECT]=obj_bullet_spread;
gun[GUN_RANGE]=1000;
gun[GUN_ENERGY]=10;// 3 bullets at 5 damage each.
global.guns[6]=gun;

gun=noone;
gun = scr_gun();
gun[GUN_SPEED]=.1;
gun[GUN_DAMAGE]=1;
gun[GUN_SPRITE]=spr_hellfury;
gun[GUN_BULLET_SPRITE]=spr_laser;
gun[GUN_BULLET_OBJECT]=obj_bullet_barage;
gun[GUN_ENERGY]=4;// 4 bullets per tick
gun[GUN_SOUND]=snd_hellfury;
gun[GUN_RANGE]=500;
global.guns[7]=gun;


gun = scr_gun();
gun[GUN_SPEED]=.5;
gun[GUN_DAMAGE]=10;
gun[GUN_SPRITE]=spr_missile_launcher_16_48_1;
gun[GUN_BULLET_SPRITE]=spr_missile;
gun[GUN_BULLET_SPEED]=3;
gun[GUN_BULLET_OBJECT]=obj_missile_guided;
gun[GUN_RANGE]=1000;
gun[GUN_SOUND]=snd_laser2;
gun[GUN_ENERGY]=10;
global.guns[8]=gun;

gun = scr_gun();
gun[GUN_SPEED]=2;
gun[GUN_DAMAGE]=30;
gun[GUN_SPRITE]=spr_railgun;
gun[GUN_BULLET_SPRITE]=spr_bullet_rail;
gun[GUN_BULLET_SPEED]=0;
gun[GUN_BULLET_OBJECT]=obj_bullet_rail;
gun[GUN_RANGE]=1000;
gun[GUN_SOUND]=snd_hellfury;
gun[GUN_BULLET_TYPE]=bulletTypes.rail;
gun[GUN_ENERGY]=60;
global.guns[9]=gun;

gun=noone;
gun = scr_gun();
gun[GUN_SPEED]=.1;
gun[GUN_DAMAGE]=1;
gun[GUN_SPRITE]=spr_gun_16_16_1;
gun[GUN_BULLET_SPRITE]=spr_laser_2;
gun[GUN_TURN_SPEED]=25;// turret
global.guns[10]=gun;

gun=noone;
gun = scr_gun();
gun[GUN_SPEED]=.2;
gun[GUN_DAMAGE]=2;
gun[GUN_SPRITE]=spr_gun_16_16_1;
gun[GUN_BULLET_TYPE]=bulletTypes.beam;
gun[GUN_BULLET_COLOR]=c_blue;
gun[GUN_RANGE]=300;
gun[GUN_ENERGY]=4;// per shot. 1 is default.
gun[GUN_TURN_SPEED]=30;// turret
global.guns[11]=gun;

gun = scr_gun();
gun[GUN_SPEED]=1;
gun[GUN_DAMAGE]=5;
gun[GUN_SPRITE]=spr_gun_16_48_1;
gun[GUN_BULLET_SPRITE]=spr_bolt;
gun[GUN_BULLET_SPEED]=6;
gun[GUN_BULLET_OBJECT]=obj_bullet_spread;
gun[GUN_RANGE]=1000;
gun[GUN_ENERGY]=10;// 3 bullets at 5 damage each.
gun[GUN_TURN_SPEED]=30;// turret
global.guns[12]=gun;


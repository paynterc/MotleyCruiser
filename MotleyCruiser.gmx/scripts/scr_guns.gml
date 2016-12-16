/// Ship-mounted guns
global.guns = noone;

var gun = noone;
gun = scr_gun();
gun[GUN_SPEED]=.2;
gun[GUN_DAMAGE]=3;
gun[GUN_SPRITE]=spr_gun_16_48_1;
gun[GUN_BULLET_SPRITE]=spr_bolt;
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
gun[GUN_SPEED]=1;
gun[GUN_DAMAGE]=10;
gun[GUN_SPRITE]=spr_gun_16_32_2;
gun[GUN_BULLET_SPRITE]=spr_rail;
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
gun[GUN_DAMAGE]=5;
gun[GUN_SPRITE]=spr_gun_16_16_1;
gun[GUN_BULLET_TYPE]="beam";
gun[GUN_BULLET_COLOR]=c_yellow;
gun[GUN_RANGE]=150;
global.guns[4]=gun;

gun=noone;
gun = scr_gun();
gun[GUN_SPEED]=.2;
gun[GUN_DAMAGE]=3;
gun[GUN_SPRITE]=spr_gun_16_16_1;
gun[GUN_BULLET_TYPE]="beam";
gun[GUN_BULLET_COLOR]=c_aqua;
gun[GUN_RANGE]=200;
global.guns[5]=gun;


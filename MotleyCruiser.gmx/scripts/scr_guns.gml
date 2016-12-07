/// Ship-mounted guns
var guns = noone;

var gun = noone;
gun = scr_gun();
gun[GUN_SPEED]=.2;
gun[GUN_DAMAGE]=3;
gun[GUN_SPRITE]=spr_gun_16_48_1;
gun[GUN_BULLET_SPRITE]=spr_bolt;
guns[0]=gun;

gun=noone;
gun = scr_gun();
gun[GUN_SPEED]=.1;
gun[GUN_DAMAGE]=1;
gun[GUN_SPRITE]=spr_gun_16_32_1;
gun[GUN_BULLET_SPRITE]=spr_laser;
guns[1]=gun;

return guns;

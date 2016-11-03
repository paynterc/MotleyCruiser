var guns = noone;

var gun = noone;
gun = scr_gun();
gun[GUN_SPEED]=10;
gun[GUN_DAMAGE]=10;
gun[GUN_SPRITE]=spr_bolt;
guns[0]=gun;

gun=noone;
gun = scr_gun();
gun[GUN_SPEED]=2;
guns[1]=gun;

return guns;
